# encoding: UTF-8
# PL-Forms Feature Status:
# * Add typeahead of complete equipment.
# * Add pass/failed confirm with password and checkbox to indicate result, need define role as QA as seperate
# * Add typeahead of complete lot name to reduce input error. (dynamic auto complete)
# * [no technical issue, need MFG line give 2 level category info, lacking such info in Excel] FOP Introduce 2 level form navigation, profile add department and only show department forms for perticular user
# * [pending due to it's a UI enhancement only]Support detail expend in index page (suggest by summer)
# * [pending due to forms not complete, so vocabulary not complete] Display two language in forms
# * [pending due to no forms needs]Group Detail Item to up 5 times (QA)
# * [pending due to no forms needs currently] File attachment
# * [pending due to it's not general feature for forms tempalte] Add data and color scope indicator (QA)
# * [done] Add typeahead of reject code auto complete
# * [done] Add Item and Spec as detail field description (QA)
# * [done] Detail, Head forms format need to support
# * [done] Fetch previous inputed record (only the latest)
# * [done] Add recent form quick list for OP
def generate_form(dept, form, fields, detail_fields=nil)
	generate :scaffold, "#{form}#{fields.collect {|k,v| " #{k}:#{v}"}.join}"

	inject_into_file "app/models/#{form.underscore}.rb", :before => "end" do
	  "  validates :status_code, :presence => true\n"
	end if fields.has_key? :status_code

	if detail_fields.present?
		dm_name = "#{form}Detail"
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
		  	", :name => 'idex_#{dm_name.underscore.pluralize}'"
			end
		end

		inject_into_file "app/models/#{form.underscore}.rb", :before => "end" do
	  	"  has_many :#{dm_name.underscore.pluralize}, dependent: :destroy\n" + \
	  	"  accepts_nested_attributes_for :#{dm_name.underscore.pluralize}\n" + \
	  	"  attr_accessible :#{dm_name.underscore.pluralize}_attributes\n"
		end

		inject_into_file "app/models/#{dm_name.underscore}.rb", :before => "class" do
			"# encoding: UTF-8\n" # to avoid some non-English chat may appear in below
		end

		detail_model_inserts = "  belongs_to :#{form.underscore}\n\n"
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
		inject_into_file "app/models/#{dm_name.underscore}.rb", :before => "end" do
			detail_model_inserts
		end

		detail_controller_new_inserts ="    0.upto #{dm_row_count-1} do |i|\n"
		detail_controller_new_inserts<<"      t=@#{form.underscore}.#{form.underscore}_details.build\n"
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

	inject_into_file "app/views/application/_nav.html.erb", :before => "</ul><!--#{dept}-->\n" do
	  "  <li><%= link_to '#{form.titleize}', #{form.pluralize.underscore}_path -%></li>\n"
	end

	inject_into_file "app/views/home/index.html.erb", :after => "<!--#{dept}-->\n" do
	  "  <li><%= link_to '#{form.titleize}', #{form.pluralize.underscore}_path -%></li>\n"
	end

	inject_into_file "app/views/#{form.pluralize.underscore}/index.html.erb", :after => '<!--Note-->' do
'<h5>Status Code: (N) Normal operation 一般作业；(SC)Shift Change 换班；(OP) MC Set Up 开机；(CD) Change device换型号；(CS) Change solder paste  换锡膏；(CC) Change component  换元器件；(MS) mount squeegee 安装刮刀；(CS) change stencil 更换钢板；(RM) Repaire M/C 修机；(PM) PM 保养。</h5>'
	end if fields.has_key? :status_code

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

# Common Production Fields can be merge in production log form
common_production_fields = {
	:status_code => :string,
	:device      => :string,
	:lot_no      => :string,
	:reject_code => :string,
	:remark      => :string,
}

# generate FOP forms
#eval File.read(File.expand_path('../forms_fop.rb', __FILE__))

# generate BOP forms
#eval File.read(File.expand_path('../forms_bop.rb', __FILE__))

# generate TOP forms
#eval File.read(File.expand_path('../forms_top.rb', __FILE__))

# generate COP forms
#eval File.read(File.expand_path('../forms_cop.rb', __FILE__))

# generate KGD forms
#eval File.read(File.expand_path('../forms_kgd.rb', __FILE__))

# generate QA forms
#eval File.read(File.expand_path('../forms_qa.rb', __FILE__))

# generate Test forms (only used while development)
eval File.read(File.expand_path('../forms_test.rb', __FILE__))

