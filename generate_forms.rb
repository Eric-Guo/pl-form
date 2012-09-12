# encoding: UTF-8
# PL-Forms Feature Status:
# * Sub-total status code in shift time, sum the same status code and production qty
# * check_items, criterias need same feature of items and specs
# * Add pass/failed confirm with QA, allow QA confirm after Operator input the data, QA have an extended time (e.g. 4 hours) to confirm
# * [no technical issue, need MFG line give 2 level category info, lacking such info in Excel] FOP Introduce 2 level form navigation, profile add department and only show department forms for perticular user
# * [phaseII]Kickout all operator login account
# * [phaseII]Support barcode scan via Mobile Phone Camera
# * [pending due to it's a UI enhancement only]Support detail expend in index page (suggest by summer)
# * [pending due to forms not complete, so vocabulary not complete] Display two language in forms
# * [pending due to no forms needs currently] Group Detail Item to up 5 times (QA)
# * [pending due to no forms needs currently] File attachment
# * [pending due to it's not a general feature for forms tempalte, so can add latter by one by one] Add data and color scope indicator (QA)
# * [done] Add typeahead of reject code auto complete.
# * [done] Add typeahead of complete equipment. (static auto complete function is done)
# * [done] Add Item and Spec as detail field description (QA)
# * [done] Detail, Head forms format need to support
# * [done] Fetch previous inputed record (only the latest)
# * [done] Add recent form quick list for OP
# * [done] Add filter based on user profile
# * [done] All input/update/delete action will be record now, not only including last one, all in history
# * [done]Seperate TOP ENG and PRD forms
# * [done]Add typeahead of complete lot name to reduce input error. (via dynamicly, need link to MES DB in backend)
# * [done]Add new feature support define status code per each forms (optional)
# * [done]Status code need redefine for each department (COP, FOP, BOP, )
def generate_form(dept, form, fields, detail_fields=nil)
	if fields.has_key? :status_code
		if fields[:status_code].kind_of? Array
			status_code = fields[:status_code]
			fields[:status_code] = :string
		else
			status_code = ['(N) Normal operation','(SC) Shift Change','(OP) MC Set Up','(CD) Change Device','(CS) Change Solder Paste','(CC) Change Component','(MS) Mount Squeegee','(CS) Change Stencil','(RM) Repaire M/C','(PM) PM'] # give default
		end
	end

	generate :scaffold, "#{form}#{fields.collect {|k,v| " #{k}:#{v}"}.join}"

	inject_into_file "app/models/#{form.underscore}.rb", :before => "end\n" do
	  "  audited\n"
	end

	inject_into_file "app/models/#{form.underscore}.rb", :before => "end\n" do
	  "  validates :status_code, :presence => true\n"
	end if fields.has_key? :status_code

	if detail_fields.present?
		dm_name = "#{form}D"
		dm_row_count = detail_fields[:row_count]
		detail_fields.delete :row_count
		if detail_fields[:items].present?
			dm_row_count ||= detail_fields[:items].count

			dm_items = detail_fields[:items] # Store Array first
			detail_fields[:items]=:string unless dm_items.nil? # replace with :string to generate model

			dm_specs = detail_fields[:specs]
			detail_fields[:specs]=:string unless dm_specs.nil?
		end

		generate :model, "#{dm_name} #{form.underscore}:references #{detail_fields.collect {|k,v| " #{k}:#{v}"}.join}"

		# resolve index name too long
		Dir.glob("db/migrate/*_create_#{dm_name.underscore.pluralize}.rb") do |dm|
			inject_into_file dm, :before => "\n  end\nend" do
		  	", :name => 'i_#{dm_name.underscore}'"
			end
		end

		inject_into_file "app/models/#{form.underscore}.rb", :before => "end\n" do
	  	"  has_many :#{dm_name.underscore.pluralize}, dependent: :destroy\n" + \
	  	"  accepts_nested_attributes_for :#{dm_name.underscore.pluralize}\n" + \
	  	"  attr_accessible :#{dm_name.underscore.pluralize}_attributes\n" + \
	  	"  has_associated_audits\n"
		end

		inject_into_file "app/models/#{dm_name.underscore}.rb", :before => "class" do
			"# encoding: UTF-8\n" # to avoid some non-English chat may appear in below
		end

		detail_model_inserts = "  belongs_to :#{form.underscore}\n"
		detail_model_inserts = "  audited :associated_with => :#{form.underscore}\n\n"
		if dm_items.present?
			detail_model_inserts<<"  def items_desc\n"
			detail_model_inserts<<"    #{dm_items.to_s}\n"
			detail_model_inserts<<"  end\n\n"
		end
		if dm_specs.present?
			detail_model_inserts<<"  def specs_desc\n"
			detail_model_inserts<<"    #{dm_specs.to_s}\n"
			detail_model_inserts<<"  end\n\n"
		end
		inject_into_file "app/models/#{dm_name.underscore}.rb", :before => "end\n" do
			detail_model_inserts
		end

		detail_controller_new_inserts ="    0.upto #{dm_row_count-1} do |i|\n"
		detail_controller_new_inserts<<"      t=@#{form.underscore}.#{form.underscore}_ds.build\n"
		if dm_items.present?
			detail_controller_new_inserts<<"        t.items=t.items_desc[i]\n"
		end
		if dm_specs.present?
			detail_controller_new_inserts<<"        t.specs=t.specs_desc[i]\n"
		end
		detail_controller_new_inserts<<"    end\n"
		inject_into_file "app/controllers/#{form.underscore.pluralize}_controller.rb", :after => "# after_controller_new\n" do
			detail_controller_new_inserts
		end

		detail_controller_create_inserts ="\n"
		if dm_items.present?
			detail_controller_create_inserts<<"    params[:#{form.underscore}][:#{dm_name.underscore.pluralize}_attributes].each do |d|\n"
			detail_controller_create_inserts<<"      d[1][:items] = @#{form.underscore}.#{dm_name.underscore.pluralize}.build.items_desc[d[0].to_i]\n"
			if dm_specs.present?
			detail_controller_create_inserts<<"      d[1][:specs] = @#{form.underscore}.#{dm_name.underscore.pluralize}.build.specs_desc[d[0].to_i]\n"
			end
			detail_controller_create_inserts<<"    end\n"
		end
		inject_into_file "app/controllers/#{form.underscore.pluralize}_controller.rb", :after => "def create\n" do
			detail_controller_create_inserts
		end

		dm_table_headers=detail_fields.keys.map {|e| "<th>#{e.to_s}</th>\n"}.join

		detail_view__form_inserts = '  <table class="table table-bordered">' + "\n"
		detail_view__form_inserts<< "    <tr>\n"
		detail_view__form_inserts<< "#{dm_table_headers}"
		detail_view__form_inserts<< "    </tr>\n"
		detail_view__form_inserts<< "<% @#{form.underscore}.#{dm_name.underscore.pluralize}.each do |detail| %>\n"
		detail_view__form_inserts<< "  <%= f.fields_for :#{dm_name.underscore.pluralize}, detail do |g| %>\n"
		detail_view__form_inserts<< "    <tr>\n"
		detail_fields.keys.each do |field_name|
	  	if [:items, :specs].include? field_name
				detail_view__form_inserts<< "<td><%= detail.#{field_name.to_s} %></td>\n"
	 		else
				detail_view__form_inserts<< "<td><%= g.input :#{field_name.to_s}, :wrapper => :tdata, :input_html => { :class => 'input-mini' } %></td>\n"
	 		end
		end
		detail_view__form_inserts<< "    </tr>\n"
		detail_view__form_inserts<< "  <% end %>\n"
		detail_view__form_inserts<< "<% end %>\n"
		detail_view__form_inserts<< "  </table>\n"

		inject_into_file "app/views/#{form.underscore.pluralize}/_form.html.erb", :before => "  </div><!--end_form-->\n" do
			detail_view__form_inserts
		end

		dm_table_items=detail_fields.keys.map {|e| "<td><%= d.#{e.to_s} %></td>\n"}.join

		inject_into_file "app/views/#{form.underscore.pluralize}/show.html.erb", :after => "<!--end_of_header-->\n" do
	  	'  <table class="table table-bordered">' + "\n" + \
	  	'    <tr>' + "\n" \
	  	"#{dm_table_headers}" + \
	  	'    </tr>' + "\n" + \
	  	"<% @#{form.underscore}.#{dm_name.underscore.pluralize}.each do |d| %>\n" + \
	  	'    <tr>' + "\n" \
	  	"#{dm_table_items}" + \
	  	'    </tr>' + "\n" + \
	  	"<% end %>\n" + \
	  	"  </table>\n"
		end
	end # detail_fields.present?

  # Update the navigation page
	inject_into_file "app/views/application/_nav.html.erb", :before => "</ul><!--#{dept}-->\n" do
	  "  <li><%= link_to '#{form.titleize}', #{form.pluralize.underscore}_path -%></li>\n"
	end

	inject_into_file "app/views/home/index.html.erb", :after => "<!--#{dept}-->\n" do
	  "  <li><%= link_to '#{form.titleize}', #{form.pluralize.underscore}_path -%></li>\n"
	end

	if fields.has_key? :status_code
		if status_code.present?
			status_codes_inserts="\n  def status_codes\n"
			status_codes_inserts<< "    #{status_code.to_s}\n"
			status_codes_inserts<< "  end\n"
		end
		inject_into_file "app/models/#{form.underscore}.rb", :before => "end\n" do
			status_codes_inserts
		end
		inject_into_file "app/views/#{form.pluralize.underscore}/index.html.erb", :after => '<!--Note-->' do
			"<h5>#{status_code.collect {|i| "#{i}, "}.join}</h5>"
		end
	end

	inject_into_file "app/views/#{form.pluralize.underscore}/index.html.erb", :after => '<!--Note-->' do
'<h5>KGD Machine Status: A :Operation Time (机器运行时间); B :Check Probe Mark (检查针痕); C :Change Probe Card (更换针卡); D :Setup Device (机器转换不同产品); E :PM & CAL (维护校准时间); F :Prober Down Time (针测机停机时间); G :Tester Down Time (测试机停机时间); H :Facility Down (厂务停机时间); I :Engeer Use Time (工程使用时间); J :End lot Time (Lot转换时间); K :Idle (待料时间); L :Misc (其它)</h5>'
	end if fields.has_key? :kgd_machine_status

	inject_into_file "app/views/#{form.pluralize.underscore}/index.html.erb", :before => '  <%= f.submit :class => "btn" %>' do
"  <%= f.text_field :device_cont, :class => 'input-small search-query', :placeholder => 'PN Device', :title => 'Type here to search PN Device' %>\n"
	end if fields.has_key? :device

	inject_into_file "app/views/#{form.pluralize.underscore}/index.html.erb", :before => '  <%= f.submit :class => "btn" %>' do
"  <%= f.text_field :lot_no_cont, :class => 'input-small search-query', :placeholder => 'Lot No.', :title => 'Type here to search Lot No.' %>\n"
	end if fields.has_key? :lot_no

	inject_into_file "app/views/#{form.pluralize.underscore}/index.html.erb", :before => '  <%= f.submit :class => "btn" %>' do
"  <%= f.text_field :reject_code_cont, :class => 'input-small search-query', :placeholder => 'Reject Code', :title => 'Type here to search Reject Code' %>\n"
	end if fields.has_key? :reject_code

	inject_into_file "app/views/#{form.pluralize.underscore}/index.html.erb", :before => '  <%= f.submit :class => "btn" %>' do
"  <%= f.text_field :gold_wire_no_cont, :class => 'input-medium search-query', :placeholder => 'Goldwire No.', :title => 'Type here to search Goldwire No.' %>\n"
	end if fields.has_key? :gold_wire_no

	inject_into_file "app/views/#{form.pluralize.underscore}/index.html.erb", :before => '  <%= f.submit :class => "btn" %>' do
"  <%= f.text_field :wafer_no_cont, :class => 'input-medium search-query', :placeholder => 'Wafer No.', :title => 'Type here to search Wafer No.' %>\n"
	end if fields.has_key? :wafer_no

	inject_into_file "app/views/#{form.pluralize.underscore}/index.html.erb", :before => '  <%= f.submit :class => "btn" %>' do
"  <%= f.text_field :material_no_cont, :class => 'input-medium search-query', :placeholder => 'Material No', :title => 'Type here to search Material No.' %>\n"
	end if fields.has_key? :material_no

	inject_into_file "app/views/#{form.pluralize.underscore}/index.html.erb", :before => '  <%= f.submit :class => "btn" %>' do
"  <%= f.text_field :batch_no_cont, :class => 'input-medium search-query', :placeholder => 'Batch No', :title => 'Type here to search Batch No.' %>\n"
	end if fields.has_key? :batch_no

	inject_into_file "app/views/#{form.pluralize.underscore}/index.html.erb", :before => '  <%= f.submit :class => "btn" %>' do
"  <%= f.text_field :applicant_badge_cont, :class => 'input-medium search-query', :placeholder => 'Applicant Badge', :title => 'Type here to search Applicant Badge' %>\n"
	end if fields.has_key? :applicant_badge

	inject_into_file "app/views/#{form.pluralize.underscore}/index.html.erb", :before => '  <%= f.submit :class => "btn" %>' do
"  <%= f.text_field :remark_cont, :class => 'input-small search-query', :placeholder => 'Remark', :title => 'Type here to search Remark' %>\n"
	end if fields.has_key? :remark
end

# Common form fields which almost every form will merge
common_fields = {
	:create_badge      => :string,
	:create_shift_code => :string,
	:update_badge      => :string,
	:update_shift_code => :string,
}

# generate FOP forms
eval File.read(File.expand_path('../forms_FOP.rb', __FILE__))

# generate BOP forms
eval File.read(File.expand_path('../forms_BOP.rb', __FILE__))

# generate TOP forms
eval File.read(File.expand_path('../forms_TOP.rb', __FILE__))

# generate COP forms
eval File.read(File.expand_path('../forms_COP.rb', __FILE__))

# generate KGD forms
eval File.read(File.expand_path('../forms_KGD.rb', __FILE__))

# generate QA forms
eval File.read(File.expand_path('../forms_QA.rb', __FILE__))

# generate Test forms (only used while development)
#eval File.read(File.expand_path('../forms_test.rb', __FILE__))

