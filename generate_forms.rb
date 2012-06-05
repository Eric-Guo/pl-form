# encoding: UTF-8
#Every field must searchable
#
#Reject Code
#Status Code
#select box
#
#Add reviewed field, if already reviewed, can not change now.
#Also record the reviewer info, review time
#
#Equipment,Container need autocomplete
#
#confirmed by need password confirm
#QA
#User
#Supervisor

def generate_form(dept, form, fields)
	generate :scaffold, "#{form}#{fields.collect {|k,v| " #{k}:#{v}"}.join}"
	inject_into_file 'app/views/application/_nav.html.erb', :before => "	</ul><!--#{dept}-->" do
	  "    <li><%= link_to '#{form.titleize}', #{form.pluralize.underscore}_path -%></li>\n"
	end
end

common_fields = {
	:create_badge      => :string,
	:create_shift_code => :string,
	:update_badge      => :string,
	:update_shift_code => :string,
}

# Common Production Fields
common_production_fields = {
	:status_code => :string,
	:device      => :string,
	:lot_no      => :string,
	:reject_code => :string,
	:remark      => :string,
}

# 金线领用及入库记录单 DOC#: 3743-02-10007
gold_wire_in_out_fields = {
	:gold_wire_no        => :string,
	:gold_wire_device_no => :string,
	:in_qty              => :integer,
	:return_qty          => :integer,
	:issue_qty           => :integer,
	:sent_qty            => :integer,
	:remark              => :string,
}
generate_form 'FOP', 'GoldwireInOut',
	(gold_wire_in_out_fields.merge common_fields)

# Wafer报废登记表 DOC#: 3743-02-10027
wafer_scrap_fields = {
	:lot_no    => :string,
	:wafer_no  => :string,
	:wafer_qty => :integer,
	:remark    => :string,
}
generate_form 'FOP', 'WaferScrapLog',
	(wafer_scrap_fields.merge common_fields)

# TCM Die Attach Production log sheet DOC#: 3745-01-50001
die_attach_production_fields = {
	:check_type               => :string,
	:visual_inspection_result => :string,
	:die_placement_x          => :float,
	:die_placement_y          => :float,
	:die_rotation             => :float,
	:die_tilt                 => :float,
	:stack_height             => :float,
	:confirm_by               => :string,
}
generate_form 'FOP', 'DieAttachProduction',
	(common_production_fields.merge die_attach_production_fields.merge common_fields)

# TCM Die Sorter Production log sheet DOC#: 3745-01-50002
die_sorter_production_fields = {
	:wafer_part_no            => :string,
	:wafer_id                 => :string,
	:check_type               => :string,
	:visual_inspection_result => :string,
	:confirm_by               => :string,
}
generate_form 'FOP', 'DieSorterProduction',
	(common_production_fields.merge die_sorter_production_fields.merge common_fields)

# TCM Printing SMT Production log sheet Ref:DOC# 3745-01-10001/3745-01-20001
smt_production_fields = {
	:qty_in                           => :integer,
	:qty_out                          => :integer,
	:inspection_result                => :string,
	:visual_inspection_after_printing => :string,
	:solder_thickness                 => :float,
	:capacitor_shear_force            => :float,
	:visual_inspection_after_smt      => :string,
	:confirm_by                       => :string,
}
generate_form 'FOP', 'SMT-Production',
	(common_production_fields.merge smt_production_fields.merge common_fields)