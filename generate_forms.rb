# encoding: UTF-8
#Every field must searchable
#
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
#
# Need two language
# Add typeahead of reject code

def generate_form(dept, form, fields)
	generate :scaffold, "#{form}#{fields.collect {|k,v| " #{k}:#{v}"}.join}"

	inject_into_file "app/views/application/_nav.html.erb", :before => "</ul><!--#{dept}-->\n" do
	  "  <li><%= link_to '#{form.titleize}', #{form.pluralize.underscore}_path -%></li>\n"
	end

	inject_into_file "app/models/#{form.underscore}.rb", :before => "end" do
	  "  validates :status_code, :presence => true\n"
	end if fields.has_key? :status_code

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


# DOC#: 3743-02-10007 金线领用及入库记录单
gold_wire_in_out_fields = {
	:gold_wire_no        => :string,
	:gold_wire_device_no => :string,
	:in_qty              => :integer,
	:return_qty          => :integer,
	:issue_qty           => :integer,
	:sent_qty            => :integer,
	:applicant_badge     => :string,
	:remark              => :string,
}
generate_form 'FOP_MAT', 'GoldwireInOut',
	(gold_wire_in_out_fields.merge common_fields)


# DOC#: 3743-02-10004 直接原材料通用领用记录单
direct_material_general_apply_fields = {
	:material_no     => :string,
	:batch_no        => :string,
	:apply_qty       => :integer,
	:issue_qty       => :integer,
	:scrap_qty       => :integer,
	:stock_qty       => :integer,
	:applicant_badge => :string,
	:remark          => :string,
}
generate_form 'FOP_MAT', 'DirectMaterialGeneralApply',
	(direct_material_general_apply_fields.merge common_fields)


# DOC#: 3743-02-10027 Wafer报废登记表
wafer_scrap_fields = {
	:lot_no    => :string,
	:wafer_no  => :string,
	:wafer_qty => :integer,
	:remark    => :string,
}
generate_form 'FOP_MAT', 'WaferScrapLog',
	(wafer_scrap_fields.merge common_fields)


# DOC#: 3743-02-10006 焊线图及焊线程式软盘领用记录
wire_bond_drawing_program_apply_fields = {
	:package                => :string,
	:bonding_die_program_no => :string,
	:bonding_die_reversion  => :string,
	:qty                    => :integer,
	:remark                 => :string,
}
generate_form 'FOP_MAT', 'WireBondDrawingProgramApply',
	(wire_bond_drawing_program_apply_fields.merge common_fields)


# DOC#: 3743-02-10022 产线领用试机料登记表
fop_trial_material_fields = {
	:package       => :string,
	:device        => :string,
	:da_level      => :integer,
	:equipment     => :string,
	:substrate_no  => :string,
	:substrate_lot => :string,
	:substrate_qty => :string,
	:return_badge  => :string,
	:return_qty    => :integer,
}
generate_form 'FOP_MAT', 'FOPTrailMaterial',
	(fop_trial_material_fields.merge common_fields)


# DOC#: 3743-02-10025 Wafer冰箱存放登记表
 wafer_icebox_store_fields = {
	:store_at      => :timestamps,
	:return_badge  => :string,
	:return_qty    => :integer,
	:device        => :string,
	:lot_no        => :string,
	:batch_no      => :string,
	:pass_due_at   => :timestamps,
	:release_badge => :string,
	:release_qty   => :integer,
	:release_at    => :timestamps,
	:remark        => :string,
}
generate_form 'FOP_MAT', 'WaferIceboxStore',
	(wafer_icebox_store_fields.merge common_fields)


# DOC#: 3743-02-10018 氮气柜湿度记录表
humidity_n2_fields = {
	:humidity          =>:string,
	:humidity_standard =>:string,
 }
generate_form 'FOP_MAT', 'HumidityN2',
	(humidity_n2_fields.merge common_fields)


# DOC#: 3743-02-10001 生产重要产品通用领用记录单
product_important_use_fields = {
	:stocks => :integer，
}
generate_form 'FOP_MAT', 'ProductImportantUseApply',
	(product_important_use_fields.merge common_fields)


# DOC#: 3743-02-10035 线上异常金线接收登记表
exception_gold_accept_register_fields = {
	:letter_of_presentation => :string,
}
generate_form 'FOP_MAT', 'ExceptionGoldAcceptRegister',
	(exception_gold_accept_register_fields.merge common_fields)


# DOC#:3743-02-10015 冷库冰箱湿度登记表
icebox_refrigeratory_humidity_fields = {
	:equipment => :string,
}
generate_form 'FOP_MAT', 'IceboxRefrigeratoryHumidity',
	(icebox_refrigeratory_humidity_fields.merge common_fields)


# DOC#: 3745-02-50018 Die Sort Production log sheet 作业记录表
die_sort_production_fields = {
	:wafer_part_no            => :string,
	:wafer_id                 => :string,
	:check_type               => :string,
	:visual_inspection_result => :string,
	:confirm_by               => :string,
}
generate_form 'FOP_PRD', 'DieSortProduction',
	(common_production_fields.merge die_sort_production_fields.merge common_fields)


# DOC#: 3745-02-10004 SMT Production log sheet 作业记录表
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
generate_form 'FOP_PRD', 'SMT-Production',
	(common_production_fields.merge smt_production_fields.merge common_fields)


# DOC#: 3745-02-30007 DP(Back/Grinding) DP_Production_log_sheet 作业记录表
dp_production_fields = {
	:device_thickness                      => :string,
	:inspection_recorder                   => :string,
	:repair_adjustment_or_change_materials => :string,
	:wafer_thickness                       => :string,
	:visual_inspection_result              => :boolean,
}
generate_form 'FOP_PRD', 'DPBackGrindingProduction',
	(common_production_fields.merge dp_production_fields.merge common_fields)


# DOC#: 3745-02-40004 DP(Wafer Saw) DP_Production_log_sheet 作业记录表
dp_ws_production_fields = {
	:device_thickness                      => :string,
	:inspection_recorder                   => :string,
	:repair_adjustment_or_change_materials => :string,
	:kerf_width                            => :float,
	:inspection_code                       => :string,
}
generate_form 'FOP_PRD', 'DPWaferSawProduction',
	(common_production_fields.merge dp_ws_production_fields.merge common_fields)


# DOC#:3745-02-40008 SAW刀信息记录
saw_blade_relace_and_recycle_record = {
  :used_length        => :string,
  :remaind_length     => :string,
  :reason_for_replace => :string,
}
generate_form 'FOP_PRD', 'SawBladeRelaceAndRecycle',
	(saw_blade_relace_and_recycle_record.merge common_fields)


# DOC#: 3745-02-40014 DP Controller Wafter 交接记录表
dp_controller_wafter_handover_fields = {
	:placed_position   => :string,
	:hand_over_confirm => :string,
	:revcie_confirm    => :string,
}
generate_form 'FOP_MAT', 'DPControllerWafterHandover',
	(dp_controller_wafter_handover_fields.merge common_fields)


# DOC# 3745-02-40007 DP 2VM Production log sheet作业记录表
dp_2vm_Production_log_sheet_fields = {
	:die_qty_lot   => :string,
	:cutting_depth => :float,
}
generate_form 'FOP_MAT', 'DP2VMProductionLog',
	(dp_2vm_Production_log_sheet_fields.merge common_fields)


# DOC# 3745-02-50004 DA Production log sheet作业记录表
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
generate_form 'FOP_PRD', 'DieAttachProduction',
	(common_production_fields.merge die_attach_production_fields.merge common_fields)


# DOC#  3745-02-50008 DA(Oven Cure) Production log sheet 作业记录表
da_oven_cure_production_fields = {
	:over_type                 => :string,
	:program_no                => :string,
	:begin_time                => :timestamps,
	:cure_profile_check_result => :string,
}
generate_form 'FOP_PRD', 'DA-OvenCureProduction',
	(common_production_fields.merge da_oven_cure_production_fields.merge common_fields)


# DOC# 3745-02-20021 DA改机通知单
wiikey_requisition_fields = {
	:wiikey_after_device_standard_uph => :integer,
	:wiikey_after_device_reality_uph  => :integer,
	:original_product_device          => :string,
	:later_product_device             => :string,
	:plan_wiikey_time                 => :timestamps,
	:really_wiikey_time               => :timestamps,
	:rms_turn_on                      => :string,
	:sub_parting_strip                => :string,
	:prodution_applicant              => :string,
}
generate_form 'FOP_PRD', 'WiiKeyRequisition',
	(wiikey_requisition_fields.merge common_fields)

# DOC# 3745-02-60004 Plasma_production_Log
plasma_production_fields={
	:start_end_time => :timestamps,
	:program_no     => :string,
	:contact_angle  => :string,
}
generate_form 'FOP_PRD', 'PlasmaProduction',
	(plasma_production_fields.merge common_fields)


# DOC# 3745-02-70004 WB production Log Rev 7
wb_production_fields={
	:status_code             => :string,
	:device_no               => :string,
	:bonding_diagram_confirm => :string,
	:visual_inspection       => :string,
	:loop_height_per_layer   => :string,
	:ball_size               => :string,
	:total_loop_height       => :string,
}
generate_form 'FOP_PRD', 'WbProductionLog',
	(wb_production_fields.merge common_fields)


# DOC# 3745-02-70007 3VM 3rd optical production Log
the_3vm_optical_production_fields={
	:in_qty              => :integer,
	:out_qty              => :integer,
}
generate_form 'FOP_PRD', 'The3VMOpticalProduction',
	(common_production_fields.merge the_3vm_optical_production_fields.merge common_fields)


# DOC# 3746-02-10004 Mold_Production_Log_Sheet
mold_production_log_fields = {
	:peeling_test                     => :string,
	:molding_program_confirm          => :string,
	:top_mold_chase_temp_check        => :string,
	:btrn_mold_chase_temp_check       => :string,
	:internal_void_check              => :string,
	:peeling_test                     => :string,
	:wire_sweep_check                 => :string,
}
generate_form 'FOP_PRD', 'MoldProduction',
	(mold_production_log_fields.merge common_fields)


# DOC# 3746-02-10008 PMC Production log sheet 作业记录表
pmc_production_log_fields = {
	:profile_check => :string,
	:in_time       => :timestamps,
	:out_time      => :timestamps,
}
generate_form 'BOP_PRD', 'PmcProduction',
	(common_production_fields.merge pmc_production_log_fields.merge common_fields)


# DOC# 3746-02-10012 Ink Oven Cure Production Log Sheet
ink_oven_cure_production_fields = {
	:profile_check => :string,
	:in_time       => :timestamps,
	:out_time      => :timestamps,
}
generate_form 'BOP_PRD', 'InkOvenCureProduction',
	(common_production_fields.merge ink_oven_cure_production_fields.merge common_fields)


# DOC# 3746-02-20004 Compound Laser Mark Production Log
compound_mark_production_fields = {
	:profile_check                         => :string,
	:repair_adjustment_or_change_materials => :string,
	:golden_finger_defects                 => :string,
}
generate_form 'BOP_PRD', 'CompoundMarkProduction',
	(common_production_fields.merge compound_mark_production_fields.merge common_fields)


# DOC# 3746-02-20030	Substrate Laser Mark Production Log
laser_mark_production_fields = {
	:laser_power        => :float,
	:laser_depth        => :float,
	:position_demension => :string,
	:confirm_by         => :string,
}
generate_form 'BOP_PRD', 'LaserMarkProduction',
	(common_production_fields.merge laser_mark_production_fields.merge common_fields)


# DOC# 3746-02-20033	Substrate Ink Mark Production Log Sheet
substrate_ink_mark_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'InMarkProduction',
	(common_production_fields.merge substrate_ink_mark_production_log_fields.merge common_fields)


# DOC# 3746-02-20028	Compound Laser Sweeping Production Log
laser_weeping_production_fields = {
	:repair_adjustment_or_change_materials => :string,
	:confirm_by                            => :string,
}
generate_form 'BOP_PRD', 'LaserWeepingProduction',
	(common_production_fields.merge laser_weeping_production_fields.merge common_fields)


# DOC# 3746-02-20011	Production log sheet for ink mark
ink_mark_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'InkMarkProduction',
	(common_production_fields.merge ink_mark_production_log_fields.merge common_fields)


# DOC# 3746-02-30004	Laser cut production
laser_cut_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'LaserCutProduction',
	(common_production_fields.merge laser_cut_production_log_fields.merge common_fields)

# DOC# 3746-02-40004	Saw singulation production
saw_singulation_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'LaserCutProduction',
	(common_production_fields.merge saw_singulation_production_log_fields.merge common_fields)

# DOC# 3746-02-90010	SDSS_T-scan_production
t_scan_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'T_scanProduction',
	(common_production_fields.merge t_scan_production_log_fields.merge common_fields)

# DOC# 3746-02-60001	AOI production
aoi_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'AoiProduction',
	(common_production_fields.merge aoi_production_log_fields.merge common_fields)

# DOC# 3746-02-90003	SDSS Solder ball attach production
ba_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'BaProduction',
	(common_production_fields.merge ba_production_log_fields.merge common_fields)

# DOC# 3746-02-90016	SDSS_OSP_pre-clean_production_log
osp_pre_clean_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'BaProduction',
	(common_production_fields.merge osp_pre_clean_production_log_fields.merge common_fields)

# DOC# 3746-02-90013	SDSS_IR_Reflow_production_log
ir_reflow_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'IrReflowProduction',
	(common_production_fields.merge ir_reflow_production_log_fields.merge common_fields)

# DOC# 3742-02-30066	Package Saw shift check Record
sgn_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'SgnProduction',
	(common_production_fields.merge sgn_production_log_fields.merge common_fields)

# DOC# 3746-02-40003	Positrol log
sgn_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'SgnProduction',
	(common_production_fields.merge sgn_production_log_fields.merge common_fields)

# DOC# 3746-02-30053	Conversion Kit Change Record Sheet 改机记录表
sgn_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'SgnProduction',
	(common_production_fields.merge sgn_production_log_fields.merge common_fields)

# DOC# 3746-02-40006	saw singulation blade change record sheet
sgn_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'SgnProduction',
	(common_production_fields.merge sgn_production_log_fields.merge common_fields)

# DOC# 3742-02-30030	PM Monthly & Half year record
sgn_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'SgnProduction',
	(common_production_fields.merge sgn_production_log_fields.merge common_fields)

# DOC# 3742-02-30058	Oven shift check Record
oven_shift_check_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'OvenProduction',
	(common_production_fields.merge oven_shift_check_production_log_fields.merge common_fields)

# DOC# 3742-02-30088	Oven Weekly PM Record
oven_weekly_pm_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'OvenProduction',
	(common_production_fields.merge oven_Weekly_pm_production_log_fields.merge common_fields)

# DOC# 3746-02-10007&3746-02-10011	Positrol log
oven_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'OvenProduction',
	(common_production_fields.merge oven_production_log_fields.merge common_fields)

# DOC# 3742-02-30074	PM Monthly & Half year record
oven_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'OvenProduction',
	(common_production_fields.merge oven_production_log_fields.merge common_fields)

# DOC# 3742-02-30038	Engraver Equipment Monthly&Half yearly PM Record
engraver_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'EngraverProduction',
	(common_production_fields.merge engraver_production_log_fields.merge common_fields)

# DOC# 3742-02-30061	Ink Mark shift check Record
ink_mark_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'InkMarkrProduction',
	(common_production_fields.merge ink_mark_production_log_fields.merge common_fields)

# DOC# 3742-02-20008	Positrol log
ink_mark_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'InkMarkrProduction',
	(common_production_fields.merge ink_mark_production_log_fields.merge common_fields)

# DOC# 3742-02-30035	PM Monthly & Half year record
ink_mark_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'InkMarkrProduction',
	(common_production_fields.merge ink_mark_production_log_fields.merge common_fields)

# DOC# 3742-02-30062	Laser Mark shift check Record
laser_mark_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'LaserMarkProduction',
	(common_production_fields.merge laser_mark_production_log_fields.merge common_fields)


# DOC# 3742-02-30081	Laser Marking Dust weekly PM record
laser_mark_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'LaserMarkProduction',
	(common_production_fields.merge laser_mark_production_log_fields.merge common_fields)

# DOC# 3746-02-20003	Positrol log
laser_mark_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'LaserMarkProduction',
	(common_production_fields.merge laser_mark_production_log_fields.merge common_fields)

# DOC# 3742-02-30019	PM Monthly & Half year record
laser_mark_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'LaserMarkProduction',
	(common_production_fields.merge laser_mark_production_log_fields.merge common_fields)

# DOC# 3742-02-30059	Laser Cut shift check record
laser_cut_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'LaserCutProduction',
	(common_production_fields.merge laser_cut_production_log_fields.merge common_fields)

# DOC# 3742-02-30003	Positrol log
laser_cut_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'LaserCutProduction',
	(common_production_fields.merge laser_cut_production_log_fields.merge common_fields)

# DOC# 3742-02-30054	Conversion Kit Change Record Sheet 改机记录表
laser_cut_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'LaserCutProduction',
	(common_production_fields.merge laser_cut_production_log_fields.merge common_fields)

# DOC# 3742-02-30080	tooling_PM_&_power_check_track_list
laser_cut_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'LaserCutProduction',
	(common_production_fields.merge laser_cut_production_log_fields.merge common_fields)

# DOC# －－－	clean filter check list
laser_cut_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'LaserCutProduction',
	(common_production_fields.merge laser_cut_production_log_fields.merge common_fields)

# DOC# 3742-02-30028	PM Monthly & Half year record
laser_cut_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'LaserCutProduction',
	(common_production_fields.merge laser_cut_production_log_fields.merge common_fields)

# DOC# 3746-02-90001	B/A Positrol log
sba_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'SbaProduction',
	(common_production_fields.merge sba_production_log_fields.merge common_fields)

# DOC# 3746-02-60014	IR Reflow Positrol log
sba_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'SbaProduction',
	(common_production_fields.merge sba_production_log_fields.merge common_fields)

# DOC# 3742-02-30063	Ball Attach Shift Check Record
sba_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'SbaProduction',
	(common_production_fields.merge sba_production_log_fields.merge common_fields)

# DOC# 3742-02-30065	Aqueous Cleaner Shift Check Record
sba_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'SbaProduction',
	(common_production_fields.merge sba_production_log_fields.merge common_fields)

# DOC# 3742-02-30064	Oven Reflow Shift Check Record
sba_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'SbaProduction',
	(common_production_fields.merge sba_production_log_fields.merge common_fields)

# DOC# 3742-02-30055	Conversion Kit Change Record Sheet 改机记录表
sba_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'SbaProduction',
	(common_production_fields.merge sba_production_log_fields.merge common_fields)

# DOC# 3742-02-30075	Auto tool clean track list
sba_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'SbaProduction',
	(common_production_fields.merge sba_production_log_fields.merge common_fields)

# DOC# 3742-02-30076	Oven reflow change device record list
oven_reflow_change_device_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'SbaProduction',
	(common_production_fields.merge oven_reflow_change_device_production_log_fields.merge common_fields)

# DOC# 3742-02-30046	SBA ball attach Monthly&Half yearly PM Record
ball_attach_monthly_half_yearly_pm_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'SbaProduction',
	(common_production_fields.merge ball_attach_monthly_half_yearly_pm_production_log_fields.merge common_fields)

# DOC# 3742-02-30048	SBA reflow oven Equipment Monthly&Half yearly PM Record
reflow_oven_equipment_monthly&half_yearly_pm_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'SbaProduction',
	(common_production_fields.merge reflow_oven_equipment_monthly&half_yearly_pm_production_log_fields.merge common_fields)

# DOC# 3742-02-30049	SBA water cleaner Equipment Monthly&Half yearly PM Record
sba_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'SbaProduction',
	(common_production_fields.merge sba_production_log_fields.merge common_fields)

# DOC# 3742-02-30047	SBA shuttle Equipment Monthly&Half yearly PM Record
sba_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'SbaProduction',
	(common_production_fields.merge sba_production_log_fields.merge common_fields)

# DOC# 3742-02-30070	Onloader and unloader for Pre-clean Monthly & Half yearly PM Record
sba_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'SbaProduction',
	(common_production_fields.merge sba_production_log_fields.merge common_fields)

# DOC# 3742-02-30060	Ultrasonic Cleaner Shift Check Record
ultrasonic_cleaner_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'UltrasonicCleanerProduction',
	(common_production_fields.merge ultrasonic_cleaner_production_log_fields.merge common_fields)

# DOC# 3746-02-50003	Positrol log
ultrasonic_cleaner_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'UltrasonicCleanerProduction',
	(common_production_fields.merge ultrasonic_cleaner_production_log_fields.merge common_fields)

# DOC# 3742-02-30022   PM Weekly record
ultrasonic_cleaner_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'UltrasonicCleanerProduction',
	(common_production_fields.merge ultrasonic_cleaner_production_log_fields.merge common_fields)

# DOC# 3746-02-30022	Ultrasonic Cleaning  Equipment change solvent PM Record
ultrasonic_cleaner_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'UltrasonicCleanerProduction',
	(common_production_fields.merge ultrasonic_cleaner__productionlog_fields.merge common_fields)

# DOC# 3742-02-30023	PM Monthly & Half year record
ultrasonic_cleaner_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'UltrasonicCleanerProduction',
	(common_production_fields.merge ultrasonic_cleaner_production_log_fields.merge common_fields)

# DOC# 3746-02-00020	Shift Check Record
icos_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'IcosProduction',
	(common_production_fields.merge icos_production_log_fields.merge common_fields)

# DOC# 3746-02-60002	Positrol log
icos_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'IcosProduction',
	(common_production_fields.merge icos_production_log_fields.merge common_fields)

# DOC# 3742-02-30056	PM Monthly & Half year record
icos_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'IcosProduction',
	(common_production_fields.merge icos_production_log_fields.merge common_fields)

# DOC# 3742-02-30077	PM Monthly & Half year record
t_scan_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'T_scanProduction',
	(common_production_fields.merge t_scan_production_log_fields.merge common_fields)

# DOC# 3742-02-30077	Quarterly PM record
t_scan_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'T_scanProduction',
	(common_production_fields.merge t_scan_production_log_fields.merge common_fields)

# DOC# 3742-02-30079	change water tracking record - weekly
t_scan_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'T_scanProduction',
	(common_production_fields.merge t_scan_production_log_fields.merge common_fields)

# DOC# 3746-02-60002	Positrol log
sti_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'StiProduction',
	(common_production_fields.merge sti_production_log_fields.merge common_fields)

# DOC# 3742-02-30072	PM Weekly record
sti_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'StiProduction',
	(common_production_fields.merge sti_production_log_fields.merge common_fields)

# DOC# 3742-02-30071	PM Monthly & Half year record
sti_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'StiProduction',
	(common_production_fields.merge sti_production_log_fields.merge common_fields)

# DOC# 3742-02-30073	Shift Check Record
sti_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'StiProduction',
	(common_production_fields.merge sti_production_log_fields.merge common_fields)

# DOC# 3746-02-20019	UV Ink Cure Positrol log
uv_ink_cure_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'UvInkCureProduction',
	(common_production_fields.merge uv_ink_cure_production_log_fields.merge common_fields)


# DOC# 3742-02-30078	PM Monthly & Half year record
uv_ink_cure_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'UvInkCureProduction',
	(common_production_fields.merge uv_ink_cure_production_log_fields.merge common_fields)

# DOC# 3742-02-30082	PM Monthly & Half year record
punch_cure_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'PunchProduction',
	(common_production_fields.merge punch_production_log_fields.merge common_fields)

# DOC# 3742-02-30087	Tray Cleanning shift check Record
punch_cure_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'PunchProduction',
	(common_production_fields.merge punch_production_log_fields.merge common_fields)

# DOC# 3742-02-30085	Tray Cleaning  Equipment change  water PM Record
tray_cleaning_equipment_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'PunchProduction',
	(common_production_fields.merge punch_production_log_fields.merge common_fields)

# DOC# 3742-02-30086	PM Monthly & Half year record
tray_cleaning_equipment_monthly&half_yearly_pm_record_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'PunchProduction',
	(common_production_fields.merge tray_cleaning_equipment_monthly&half_yearly_pm_record_production_log_fields.merge common_fields)

# DOC# 3744-02-00011	EOL存货卡
mhl_cure_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'BOP_PRD', 'MhlProduction',
	(common_production_fields.merge mhl_cure_production_log_fields.merge common_fields)

#=============================================
# DOC# 3735-02-00025	MT productin log sheet
memory_test_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'TOP_PRD', 'MemoryTestProductin',
	(common_production_fields.merge memory_test_fields.merge common_fields)

# DOC# 3775-02-00103	CT productin log sheet
card_test_production_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'TOP_PRD', 'CardTestProduction',
	(common_production_fields.merge card_test_production_fields.merge common_fields)

# DOC# 3795-02-00006	TFCL productin log sheet
tfcl_production_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'TOP_PRD', 'TfclProduction',
	(common_production_fields.merge tfcl_production_fields.merge common_fields)

# DOC# 3735-02-00026	Memory Test Daily check list
memory_test_daily_check_fields={
	:start_end_time => :timestamps,
	:program_no     => :string,
	:contact_angle  => :string,
}
generate_form 'TOP_PRD', 'MemoryTestDailyCheck',
(memory_test_daily_check_fields.merge common_fields)

# DOC# 3731-02-30029	TOP shift machine jamming trend
mt_ct_tfcl_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'TOP_PRD', 'MtCtTfcl',
	(mt_ct_tfcl_fields.merge common_fields)

# DOC# 3731-02-20006	Monthly & Half Year PM Record
mt_ct_fields= {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'TOP_PRD', 'MtCt',
	(mt_ct_fields.merge common_fields)

# DOC# 3733-02-00138	TOP_conversion_checklist
top_conversion_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'TOP_PRD', 'TopConversion',
	(top_conversion_fields.merge common_fields)

# DOC# 3731-02-30036	STK Oven daily checklist
stk_oven_daily_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'TOP_PRD', 'StkOvenDaily',
	(stk_oven_daily_fields.merge common_fields)

# DOC# 3731-02-30037	 M820 Burn-In Daily Check Record
m820_burn_in_daily_check_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'TOP_PRD', 'M820BuinInDailyCheck',
	(m820_burn_in_daily_check_fields.merge common_fields)

# DOC# 3731-02-30037	 ProV Buin-In Daily Check Record
 prov_buin_in_daily_check_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'TOP_PRD', 'ProvBuinInDailyCheck',
	(prov_buin_in_daily_check_fields.merge common_fields)

# DOC# 3731-02-30036	JEC Oven daily checklist
jec_oven_daily_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'TOP_PRD', 'JecOvenDaily',
	(jec_oven_daily_fields.merge common_fields)

# DOC# 3731-02-30013	Monthly & Half Year PM Record
mirae_m820_handler_monthly_and_half_year_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'TOP_PRD', 'MiraeM820hHandlerMonthlyAndHalfYearPm',
	(mirae_m820_handler_monthly_and_half_year_pm_fields.merge common_fields)

# DOC# 3731-02-30013	Monthly & Half Year PM Record
burn_in_board_monthly_pm_record_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'TOP_PRD', 'BurnInBoardMonthlyPm',
	(burn_in_board_monthly_pm_fields.merge common_fields)

# DOC# 3775-02-00104	Card Test Daily check list
card_test_daily_check_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'TOP_PRD', 'CardTestDailyCheck',
	(card_test_daily_check_fields.merge common_fields)

# DOC# 3733-02-00140	TFCL Test Daily check list
tfcl_test_daily_check_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'TOP_PRD', 'TfclTestDailyCheck',
	(tfcl_test_daily_check_fields.merge common_fields)

# DOC# 3731-02-30046	HonTech Test Daily check list
honTech_test_daily_check_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'TOP_PRD', 'HonTechTestDailyCheck',
	(honTech_test_daily_check_fields.merge common_field)

# DOC# 3731-02-30045	Mirae M150 Test Daily check list
mirae_m150_test_daily_check_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'TOP_PRD', 'MiraeM150TestDailyCheck',
	(mirae_m150_test_daily_check_fields.merge common_field)

# DOC# 3791-02-30001	Monthly & Half Year PM Record
tfcl_tester_monthly_and_semi_annual_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'TOP_PRD', 'TfclTesterMonthlyAndSemiAnnualPm',
	(tfcl_tester_monthly_and_semi_annual_pm_fields.merge common_field)

# DOC# 3731-02-30044	Monthly & Half Year PM Record
mirae_m150_handler_monthly_and_half_year_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'TOP_PRD', 'MiraeM150HandlerMonthlyAndHalfYearPm',
	(mirae_m150_handler_monthly_and_half_year_pm_fields.merge common_field)

# DOC# 3731-02-30040	Monthly & Half Year PM Record
hontech_ht3600a_handler_monthly_and_half_year_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamps,
	:out_time    => :timestamps,
}
generate_form 'TOP_PRD', 'HontechHt3600aHandlerMonthlyAndHalfYearPm',
	(hontech_ht3600a_handler_monthly_and_half_year_pm_fields.merge common_field)

#====================2nd line=====================