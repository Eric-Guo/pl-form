# encoding: UTF-8
# file date 8/23/2012 by Eric

# Common Production Fields can be merge in production log form
fop_common_production_fields = {
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
generate_form 'FOP_MAT', 'DirectMatGeneralApply',
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
generate_form 'FOP_MAT', 'WireBondDrawingPrmApply',
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
	:is_pass           =>:boolean,
	:mark_badge        =>:string,
	:time              =>:timestamp,
	:is_cover          =>:boolean,
    :humidity_standard =>:string,
 }
generate_form 'FOP_MAT', 'HumidityN2',
	(humidity_n2_fields.merge common_fields)


# DOC#: 3743-02-10001 生产重要产品通用领用记录单
product_important_use_fields = {
	:stocks         => :integer,
	:sent_qty       => :integer,
	:is_return      => :boolean,
	:release_badge  => :string,
	:receive_badge  => :string,
	:remark         => :string,
}
generate_form 'FOP_MAT', 'ProductImportantUseApply',
	(product_important_use_fields.merge common_fields)


# DOC#: 3743-02-10035 线上异常金线接收登记表
exception_gold_accept_register_fields = {
	:machine_no             => :string,
	:operator_id            => :string,
	:receive_badge          => :string,
	:supervisor_mark        => :string,
	:letter_of_presentation => :string,
}
generate_form 'FOP_MAT', 'ExceptionGoldAcceptForm',
	(exception_gold_accept_register_fields.merge common_fields)


# DOC#:3743-02-10015 冷库冰箱湿度登记表
icebox_refrigeratory_humidity_fields = {
	:temperature_standard  => :float,
	:temperature           => :float,
	:is_pass               => :boolean,
	:equipment             => :string,
	:time                  => :timestamp,
	:remart                => :string,
}
generate_form 'FOP_MAT', 'IceboxHumidity',
	(icebox_refrigeratory_humidity_fields.merge common_fields)


# DOC#: 3745-02-50018 Die Sort Production log sheet 作业记录表
die_sort_production_fields = {
	:op_ID                    => :string,
	:status_code              => :string,
	:wafer_part_no            => :string,
	:wafer_id                 => :string,
	:lot_no                   => :string,
	:rejet_code               => :string,
	:remark                   => :string,
	:check_type               => :string,
	:check_device             => :string,
	:visual_inspection_result => :string,
	:confirm_by               => :string,
}
generate_form 'FOP_PRD', 'DieSortProduction',
	(fop_common_production_fields.merge die_sort_production_fields.merge common_fields)


# DOC#: 3745-02-10004 SMT Production log sheet 作业记录表
smt_production_fields = {
	:work_time         => :timestamp,
	:done_time         => :timestamp,
	:status_code       =>:string,
	:lot_no            =>:string,
	:in_qty            => :integer,
	:out_qty           => :integer,
	:inspection_result => :string,
	:remark            => :string,
	:check_item        => :string,
	:confirm_by        => :string,
}
smt_production_detail_fields = {
	:items => ["Visual Inspection after printing(印刷之后目检)","Solder thickness(锡膏厚度)","Capacitor shear force(电容剪切力)","Visual Inspection after SMT   (SMT之后目检)"],
	:result_1 => :string,
	:result_2 => :string,
	:result_3 => :string,
	:result_4 => :string,
	:result_5 => :string,
	:result_6 => :string,
	:result_7 => :string,
	:result_8 => :string,

}
generate_form 'FOP_PRD', 'SMT-Production',
	(fop_common_production_fields.merge smt_production_fields.merge common_fields), smt_production_detail_fields


# DOC#: 3745-02-30007 DP(Back/Grinding) DP_Production_log_sheet 作业记录表
dp_production_fields = {
	:work_time                   => :timestamp,
	:done_time                   => :timestamp,
	:status_code                 => :string,
	:target_thickness            => :string,
	:lot_no                      => :string,
	:defect_code                 => :string,
	:defect_qty                  => :string,
	:remark                      => :string,
	:repair_adjust_or_change_mat => :string,
	:check_item                  => :string,
}
dp_production_detail_fields = {
	:items => ["Wafer Thickness (是否pass)","Visual Inspection (是否pass)"],
	:result                                => :boolean,
	:confirm_by                            => :string,
}
generate_form 'FOP_PRD', 'DPBackGrindingProd',
	(fop_common_production_fields.merge dp_production_fields.merge common_fields), dp_production_detail_fields


# DOC#: 3745-02-40004 DP(Wafer Saw) DP_Production_log_sheet 作业记录表
dp_ws_production_fields = {
	:work_time                   => :timestamp,
	:done_time                   => :timestamp,
	:status_code                 => :string,
	:device_thickness            => :string,
	:lot_no                      => :string,
	:defect_code                 => :string,
	:defect_qty                  => :string,
	:remark                      => :string,
	:repair_adjust_or_change_mat => :string,
}
dp_ws_production_detail_fields = {
	:items => ["Kerf width","Inspection code"],
	:result_1                              => :string,
	:result_2                              => :string,
	:result_3                              => :string,
	:result_4                              => :string,
	:confirm                               => :string,
}
generate_form 'FOP_PRD', 'DPWaferSawProd',
	(fop_common_production_fields.merge dp_ws_production_fields.merge common_fields),dp_ws_production_detail_fields


# DOC#:3745-02-40008 SAW刀信息记录
#saw_blade_relace_and_recycle_fields = {
#  :used_length        => :string,
#  :remaind_length     => :string,
#  :reason_for_replace => :string,
#  :remark             => :string,
#}
#generate_form 'FOP_PRD', 'SawBladeRelaceAndRecycle',
#	(saw_blade_relace_and_recycle_fields.merge common_fields)


# DOC#: 3745-02-40014 DP Controller Wafer 交接记录表
#dp_controller_wafter_handover_fields = {
#	:lot_no            => :string,
#	:wafer_lot_no      => :string,
#	:wafer_qty         => :integer,
#	:placed_position   => :string,
#	:hand_over_confirm => :string,
#	:revcie_confirm    => :string,
#	:op_id             => :string,
#}
#generate_form 'FOP_PRD', 'DPCtlWaferHandover',
#	(dp_controller_wafter_handover_fields.merge common_fields)


# DOC# 3745-02-40007 DP 2VM Production log sheet作业记录表
dp_2vm_Production_log_sheet_fields = {
	:work_time            => :timestamp,
	:done_time            => :timestamp,
	:device_no            => :string,
	:lot_no               => :string,
	:wafer_in_qty         => :string,
	:wafer_out_qty        => :string,
	:die_qty_lot          => :string,
	:inspecttion_recorder => :string,
	:cutting_depth        => :float,
	:defect_code          => :string,
	:defect_qty           => :string,
	:remark               => :string,
}
generate_form 'FOP_PRD', 'DP2VMProductionLog',
	(dp_2vm_Production_log_sheet_fields.merge common_fields)


# DOC# 3745-02-50004 DA Production log sheet作业记录表
die_attach_production_fields = {
	:work_time   => :timestamp,
	:status_code => :string,
	:lot_no      => :string,
	:reject_code => :string,
	:remark      => :string,
	:check_type  => :string,
	:device      => :string,
	:confirm_by  => :string,
}
die_attach_production_detail_fields = {
	:items => ["低倍显微镜目检结果 Visual Inspection","芯片偏移 Die Placement (≤ ±25µm)","芯片旋转 Die Rotation (memory ≤ 20um  CTL/CB≤15um)","芯片倾斜 Die tilt (≤50µm )","叠片高度 Stack height , 标准参见DA positrol guide line"],
	:x_1 => :float,
	:y_1 => :float,
	:x_2 => :float,
	:y_2 => :float,
	:x_3 => :float,
	:y_3 => :float,
	:x_4 => :float,
	:y_4 => :float,
	:x_5 => :float,
	:y_5 => :float,
}
generate_form 'FOP_PRD', 'DieAttachProduction',
	(die_attach_production_fields.merge common_fields), die_attach_production_detail_fields


# DOC#  3745-02-50008 DA(Oven Cure) Production log sheet 作业记录表
da_oven_cure_production_fields = {
	:machine_no                => :string,
	:status_code               => :string,
	:oven_type                 => :string,
	:program_no                => :string,
	:begin_time                => :timestamp,
	:cure_profile_check_result => :string,
	:remark                    => :string,
}
generate_form 'FOP_PRD', 'DA-OvenCureProduction',
	(fop_common_production_fields.merge da_oven_cure_production_fields.merge common_fields)


# DOC# 3745-02-20021 DA改机通知单
#wiikey_requisition_fields = {
#	:machine_no                   => :string,
#	:wiikey_after_pn_standard_uph => :integer,
#	:wiikey_after_pn_reality_uph  => :integer,
#	:original_product_device      => :string,
#	:later_product_device         => :string,
#	:plan_wiikey_time             => :timestamp,
#	:really_wiikey_time           => :timestamp,
#	:rms_turn_on                  => :string,
#	:sub_parting_strip            => :string,
#	:prodution_applicant          => :string,
#}
#generate_form 'FOP_PRD', 'WiiKeyRequisition',
#	(wiikey_requisition_fields.merge common_fields)


# DOC# 3745-02-60004 Plasma_production_Log plasma 作业记录表
plasma_production_fields = {
	:start_end_time => :timestamp,
	:employee_id    => :string,
	:status_code    => :string,
	:lot_no         => :string,
	:program_no     => :string,
	:contact_angle  => :string,
	:remark         => :string,
}
generate_form 'FOP_PRD', 'PlasmaProduction',
	(plasma_production_fields.merge common_fields)


# DOC# 3745-02-70004 WB_production_Log_Rev 7 WB测数据表单
wb_production_fields = {
	:work_time               => :string,
	:machine_no              => :string,
	:status_code             => :string,
	:device_no               => :string,
	:inspection_recorder     => :string,
	:bonding_diagram_confirm => :string,
}
wb_production_detail_fields = {
	:items => ["焊线图确认 bonding_diagram_confirm","目检 visual_inspection","各层弧高测量 loop_height_per_layer(um)","焊球大小 ball_size(um)","总弧高测量 Total_loop_height, 标准参见wb positrol guide line"],
  :result               => :string,
  :confirm_by				    => :string,
}
generate_form 'FOP_PRD', 'WbProductionLog',
	(wb_production_fields.merge common_fields), wb_production_detail_fields


# DOC# 3745-02-70007 3VM 3rd_optical_production_Log 3VM作业记录表
the_3vm_optical_production_fields = {
	:device_no           => :string,
	:lot_no              => :string,
	:in_qty              => :integer,
	:out_qty             => :integer,
	:inspection_recorder => :string,
	:remark              => :string,
}
generate_form 'FOP_PRD', 'The3VMOpticalProd',
	(fop_common_production_fields.merge the_3vm_optical_production_fields.merge common_fields)


# DOC# 3746-02-10004 Mold_Production_Log_Sheet
mold_production_log_fields = {
	:work_time                  => :string,
	:status_code                => :string,
	:device_no                  => :string,
	:lot_no                     => :string,
	:peeling_test               => :string,
	:in_qty                     => :string,
	:out_qty                    => :string,
	:inspection_recorder        => :string,
	:molding_program_confirm    => :string,
	:top_mold_chase_temp_check  => :string,
	:btrn_mold_chase_temp_check => :string,
	:internal_void_check        => :string,
	:peeling_test               => :string,
	:wire_sweep_check           => :string,
	:confirm_by                 => :string,
}
generate_form 'FOP_PRD', 'MoldProduction',
	(mold_production_log_fields.merge common_fields)
