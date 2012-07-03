# encoding: UTF-8

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
	:store_at      => :timestamp,
	:return_badge  => :string,
	:return_qty    => :integer,
	:device        => :string,
	:lot_no        => :string,
	:batch_no      => :string,
	:pass_due_at   => :timestamp,
	:release_badge => :string,
	:release_qty   => :integer,
	:release_at    => :timestamp,
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
	:stocks => :integer,
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
saw_blade_relace_and_recycle_fields = {
  :used_length        => :string,
  :remaind_length     => :string,
  :reason_for_replace => :string,
}
generate_form 'FOP_PRD', 'SawBladeRelaceAndRecycle',
	(saw_blade_relace_and_recycle_fields.merge common_fields)


# DOC#: 3745-02-40014 DP Controller Wafter 交接记录表
dp_controller_wafter_handover_fields = {
	:placed_position   => :string,
	:hand_over_confirm => :string,
	:revcie_confirm    => :string,
}
generate_form 'FOP_PRD', 'DPControllerWafterHandover',
	(dp_controller_wafter_handover_fields.merge common_fields)


# DOC# 3745-02-40007 DP 2VM Production log sheet作业记录表
dp_2vm_Production_log_sheet_fields = {
	:die_qty_lot   => :string,
	:cutting_depth => :float,
}
generate_form 'FOP_PRD', 'DP2VMProductionLog',
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
	:begin_time                => :timestamp,
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
	:plan_wiikey_time                 => :timestamp,
	:really_wiikey_time               => :timestamp,
	:rms_turn_on                      => :string,
	:sub_parting_strip                => :string,
	:prodution_applicant              => :string,
}
generate_form 'FOP_PRD', 'WiiKeyRequisition',
	(wiikey_requisition_fields.merge common_fields)


# DOC# 3745-02-60004 Plasma_production_Log
plasma_production_fields = {
	:start_end_time => :timestamp,
	:program_no     => :string,
	:contact_angle  => :string,
}
generate_form 'FOP_PRD', 'PlasmaProduction',
	(plasma_production_fields.merge common_fields)


# DOC# 3745-02-70004 WB production Log Rev 7
wb_production_fields = {
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
the_3vm_optical_production_fields = {
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
