# encoding: UTF-8

# Common Production Fields can be merge in production log form
kgd_common_production_fields = {
	:equipment_no  => :string,
	:date          => :date,
	:shift         => :string,
	:op_id         => :string,
	:wafer_part_no => :string,
	:mes_lot_no    => :string,
	:wafer_id      => :string,
}

# DOC# 3983-02-00003	 SDSS KGD Testing Production Log Sheet
sdss_kgd_testing_production_fields = {
	:program                 => :string,
	:tempreature             => :integer,
	:over_drive_um           => :integer,
	:start_time              => :timestamp,
	:end_time                => :timestamp,
	:probe_mark_check_passed => :boolean,
	:kgd_machine_status      => :string,
	:remark                  => :string,
}
generate_form 'KGD_PRD', 'KgdTestingProduction',
	(kgd_common_production_fields.merge sdss_kgd_testing_production_fields.merge common_fields)

# DOC# KGD test	3983-02-00004	 SDSS KGD Material Loan Record
sdss_kgd_material_loan_fields = {
    :date            => :date,
    :shift           => :string,
    :operator_id     => :string,
	:requestor_time  => :timestamp,
    :reture_date     => :timestamp,
    :mes_lot_no      => :string,
    :wafer_lot_no    => :string,
    :wafer_part_no   => :string,
    :purpose         => :string,
    :remark          => :string,
}
generate_form 'KGD_PRD', 'KgdMaterialLoan',
	(sdss_kgd_material_loan_fields.merge common_fields)

# DOC# 3983-02-00005	 SDSS KGD Wafer Abnormal Hold Sheet
sdss_kgd_wafer_abnormal_hold_fields = {
	:profile_check => :string,
	:in_time       => :timestamp,
	:out_time      => :timestamp,
}
generate_form 'KGD_PRD', 'KgdWaferAbnormalHold',
	(sdss_kgd_wafer_abnormal_hold_fields.merge common_fields)

# DOC# 3983-02-00006	 SDSS KGD Return Wafer Record
sdss_kgd_return_wafer_fields = {
    :date          => :date,
	:shift         => :string,
	:operator_id   => :string,
    :mes_lot_no    => :string,
    :wafer_lot_no  => :string,
    :Wafer_part_no => :string,
    :qty           => :string,
    :wafer_bank    => :string,
    :return_date   => :date,
    :return_shift  => :string,
    :receiving_op  => :string,
    :remark        => :string,

}
generate_form 'KGD_PRD', 'KgdReturnWafer',
	(sdss_kgd_return_wafer_fields.merge common_fields)

# DOC# 3983-02-00007	SDSS KGD MRB Material Track Rrecord
sdss_kgd_mrb_material_track_fields = {
    :shift             => :string,
    :wafer_lot_no      => :string,
    :mes_lot_no        => :string,
    :mrb_no            => :string,
    :received_qty      => :string,
    :defect_qty        => :string,
    :receiving_date    => :date,
    :due_date          => :date,
    :owner             => :string,
    :issue_description => :string,
    :disposition       => :string,
    :remark            => :string,
}
generate_form 'KGD_PRD', 'KgdMrbMaterialTrack',
	(sdss_kgd_mrb_material_track_fields.merge common_fields)

# DOC# 3983-02-00013	 SDSS KGD Borrowing Machine Form
sdss_kgd_borrowing_machine_form_fields = {
    :applicant_name                 => :string,
    :employee_no                    => :string,
    :dept                           => :string,
    :ext                            => :string,
    :date                           => :date,
    :tester_prober                  => :string,
    :other                          => :string,
    :borrow_michine_no              => :string,
    :part_no                        => :string,
    :technology                     => :string,
    :subject                        => :string,
    :lot_no                         => :string,
    :test_program_name              => :string,
    :requirement                    => :string,
    :remark                         => :string,
    :appliant_signature             => :string,
    :in_time                        => :timestamp,
    :out_time                       => :timestamp,
    :total_time                     => :timestamp,
    :engineer_singnature            => :string,
    :production_line_singnature     => :string,
    :prod_line_check_machine_status => :string,
    :eng_comment                    => :string,
    :mfg_singnature                 => :string,
    :eng_singnature                 => :string,
}
generate_form 'KGD_PRD', 'KgdBorrowingMachineForm',
	(sdss_kgd_borrowing_machine_form_fields.merge common_fields)

# DOC# 3983-02-00015	SDSS KGD Wafer Vacuum Packing Machine first sample affirm record (晶圆真空包装机首件确认记录)
sdss_kgd_wafer_vacuum_packing_machine_first_sample_affirm_fields = {
    :machine_no                  => :string,
    :date                        => :date,
    :shift                       => :string,
    :operator_id                 => :string,
    :vacuum_time_vacuum_pressure => :float,
    :sealing_time                => :float,
    :cooling_time                => :float,
    :tech_signature              => :string,
    :qc_signature                => :string,
    :first_lot_affirm_passed     => :boolean,
    :remark                      => :string,
}
generate_form 'KGD_PRD', 'WaferVacuumPackFirstLot',
	(sdss_kgd_wafer_vacuum_packing_machine_first_sample_affirm_fields.merge common_fields)

# DOC# 3983-02-00017	SDSS KGD N2 Cabinet humidity record
sdss_kgd_n2_cabinet_humidity_fields = {
    :machine_no             => :string,
    :date                   => :date,
    :shift                  => :string,
    :op_id                  => :string,
    :setup_humidity         => :string,
    :actual_humidity        => :string,
    :check_result           => :boolean,
    :n2_valve_status_opened => :boolean,
    :time                   => :timestamp,
    :pressurize             => :boolean,
}
generate_form 'KGD_PRD', 'KgdN2CabinetHumidity',
	(sdss_kgd_n2_cabinet_humidity_fields.merge common_fields)

# DOC# 3983-02-00021	  SDSS KGD Wafer Sorter Production log sheet (cherry pick)
sdss_kgd_wafer_sorter_production_log_sheet_fields = {
    :machine_no                    => :string,
    :date                          => :date,
    :shift                         => :string,
    :op_id                         => :string,
    :wafer_lot_no                  => :string,
    :wafer_qty                     => :string,
    :die_qty                       => :string,
    :start_time                    => :timestamp,
    :iqc_result_passed             => :boolean,
    :cherry_picking__result_passed => :boolean,
    :remark                        => :string,
}
generate_form 'KGD_PRD', 'KgdWaferSorterProd',
	(sdss_kgd_wafer_sorter_production_log_sheet_fields.merge common_fields)

# DOC# 3983-02-00025	 SDSS KGD wafer vacuum bag use record
sdss_kgd_wafer_vacuum_bag_use_fields = {
    :date                        => :date,
    :shift                       => :string,
    :wafer_bank_leakage_used_qty => :string,
    :fg_leakage_used_qty         => :string,
    :shipment_used_qty           => :string,
    :vacuum_bag_failed_qty       => :string,
    :first_sample_used_qty       => :string,
    :others_used_qty             => :string,
    :total_used_qty              => :string,
    :issue_request_qty_from_wh   => :string,
    :last_shift_residual_qty     => :string,
    :this_shift_residual_qty     => :string,
}
generate_form 'KGD_PRD', 'KgdWaferVacuumBagUse',
	(sdss_kgd_wafer_vacuum_bag_use_fields.merge common_fields)

# DOC# 3712-02-00049	 QDN format
quality_deviation_notice_format_fields = {
    :quality_deviation_notice       => :string,
    :date                           => :date,
    :time                           => :timestamp,
    :qdn_no                         => :string,
    :issued_b                       => :string,
    :to                             => :string,
    :cc_to                          => :string,
    :category_of_deviation          => :string,
    :process_monitor                => :string,
    :machine_buy_off                => :string,
    :qc_gate                        => :string,
    :spec_control                   => :string,
    :low_yield                      => :string,
    :other                          => :string,
    :machine_type                   => :string,
    :machine_no                     => :string,
    :packgae                        => :string,
    :device_type                    => :string,
    :lot_no                         => :string,
    :description_of_deviation       => :string,
    :defect_code                    => :string,
    :potentially_affected_products  => :string,
    :packgae                        => :string,
    :schedule_numbers               => :string,
    :containment_action             => :string,
    :hold_affected_lots             => :string,
    :shut_down_affected_machines    => :string,
    :others                         => :string,
    :mfg_leader_ipqc_leader         => :string,
    :root_cause_analysis            => :string,
    :analyzed_by                    => :string,
    :date                           => :date,
    :time                           => :timestamp,
    :corrective_action              => :string,
    :provided_by                    => :string,
    :date                           => :date,
    :time                           => :timestamp,
    :verification                   => :string,
    :qc_inspection_qc               => :string,
    :prod_dispositon_ipqc_lead_mqe  => :string,
    :release_base_of_qc_buy_off_res => :string,
    :hold_affect_and_suspect_lots   => :string,
    :ipqc_leader_mqe                => :string,
    :mrb_disponsition_mrb           => :string,
    :mrb_no                         => :string,
    :mfg_eng                        => :string,
    :pe_eng                         => :string,
    :qc_eng                         => :string,
}
generate_form 'KGD_PRD','QualityDeviationNotice',
	(quality_deviation_notice_format_fields.merge common_fields)

# DOC# 3724-02-10044	 KGD_Wafer_Receiver_Form
kgd_wafer_receiver_form_fields = {
    :part_no_bin00 => :string,
    :batch_no      => :string,
    :lot_no        => :string,
    :pcs           => :string,
    :qty           => :string,
    :remark        => :string,
    :part_no_binaa => :string,
    :pcs           => :string,
    :remark        => :string,
}
generate_form 'KGD_PRD', 'KgdWaferReceiverForm',
	(kgd_wafer_receiver_form_fields.merge common_fields)

# DOC# 3981-02-30024	KGD Equipment Conversion Checklist(改机单)
kgd_equipment_conversion_fields = {
    :profile_check => :string,
	:in_time       => :timestamp,
	:out_time      => :timestamp,
}
generate_form 'KGD_PRD', 'KgdEquipmentConversion',
	(kgd_equipment_conversion_fields.merge common_fields)

# DOC# 3985-02-00006	 KGD_Enginner_lot_N2_Cabinet_Record(KGD工程批氮气柜记录表)
kgd_enginner_lot_n2_cabinet_fields = {
    :no                          => :string,
    :date                        => :date,
    :shite                       => :string,
    :part_no                     => :string,
    :relate_member               => :string,
    :lot_no                      => :string,
    :wafer_qty                   => :string,
    :work_status                 => :string,
    :reture_to_the_relate_member => :string,
}
generate_form 'KGD_PRD', 'KgdEnginnerLotN2Cab',
    (kgd_enginner_lot_n2_cabinet_fields.merge common_fields)

# DOC# 3981-02-30005	 SDSS_KGD_Equipment_Down_Time_Record(设备维修表单)
sdss_kgd_equipment_down_time_fields = {
    :profile_check => :string,
	:in_time       => :timestamp,
	:out_time      => :timestamp,
}
generate_form 'KGD_EQP', 'KgdEquipmentDownTime',
    (sdss_kgd_equipment_down_time_fields.merge common_fields)

# DOC# 3981-02-30009	KGD Equipment Shift Check Record(开班检查表单)
kgd_equipment_shift_check_fields = {
    :profile_check => :string,
	:in_time       => :timestamp,
	:out_time      => :timestamp,
}
generate_form 'KGD_EQP', 'KgdEquipmentShiftCheck',
    (kgd_equipment_shift_check_fields.merge common_fields)

# DOC# 3981-02-30011	 KGD Exchange parts record(备件更换表单)
kgd_exchange_parts_fields = {
    :profile_check => :string,
	:in_time       => :timestamp,
	:out_time      => :timestamp,
}
generate_form 'KGD_EQP', 'KgdExchangePart',
    (kgd_exchange_parts_fields.merge common_fields)

# DOC# 3981-02-30012	 SDSS KGD Microscope Equipment Half year PM RECORD(显微镜维护表单)
sdss_kgd_microscope_equipment_half_year_pm_fields = {
    :profile_check => :string,
	:in_time       => :timestamp,
	:out_time      => :timestamp,
}
generate_form 'KGD_EQP', 'KgdMicroscopeEqpPm',
    (sdss_kgd_microscope_equipment_half_year_pm_fields.merge common_fields)

# DOC# 3981-02-30013	 KGD vacuum packaging machine Monthly PM Record(真空包装机月保养表单)
kgd_vacuum_packaging_machine_monthly_pm_fields = {
    :profile_check => :string,
	:in_time       => :timestamp,
	:out_time      => :timestamp,
}
generate_form 'KGD_EQP', 'KgdVacuumPackMachinePm',
    (kgd_vacuum_packaging_machine_monthly_pm_fields.merge common_fields)

# DOC# 3981-02-30016 	 SDSS KGD wafer sorter PM Record(Cherry pcik 机台保养表单)
sdss_kgd_wafer_sorter_pm_fields = {
    :profile_check => :string,
	:in_time       => :timestamp,
	:out_time      => :timestamp,
}
generate_form 'KGD_EQP', 'KgdWaferSorterPm',
    (sdss_kgd_wafer_sorter_pm_fields.merge common_fields)

# DOC# 3981-02-30025 	 SDSS KGD Dynatech wafer pack unpack shift check record(导料机开班检查记录表)
sdss_kgd_dynatech_wafer_pack_unpack_shift_check_fields = {
    :profile_check => :string,
	:in_time       => :timestamp,
	:out_time      => :timestamp,
}
generate_form 'KGD_EQP', 'DynaWaferPackUnpackChk',
    (sdss_kgd_dynatech_wafer_pack_unpack_shift_check_fields.merge common_fields)

# DOC# 3981-02-30026 	 SDSS KGD Dynatech wafer pack unpack PM record(导料机保养表单)
sdss_kgd_dynatech_wafer_pack_unpack_pm_fields = {
    :profile_check => :string,
	:in_time       => :timestamp,
	:out_time      => :timestamp,
}
generate_form 'KGD_EQP', 'DynaWaferPackUnpackPm',
    (sdss_kgd_dynatech_wafer_pack_unpack_pm_fields.merge common_fields)

# DOC# 3981-02-30006 	 Accretech UF3000EX Wafer Prober Monthly&Half Year PM Record(UF3000EX probe 月/年保养表单)
accretech_uf3000ex_wafer_prober_monthly_and_half_year_pm_fields = {
    :profile_check => :string,
	:in_time       => :timestamp,
	:out_time      => :timestamp,
}
generate_form 'KGD_EQP', 'AccreUf3000exWaferProberPm',
    (accretech_uf3000ex_wafer_prober_monthly_and_half_year_pm_fields.merge common_fields)

# DOC# 3981-02-30007 	 Innotech SI-300S Wafer Tester Monthly&Half Year PM Record (SI300S Tester 月/年保养表单)
innotech_si300s_wafer_tester_monthly_and_half_year_pm_fields = {
    :profile_check => :string,
	:in_time       => :timestamp,
	:out_time      => :timestamp,
}
generate_form 'KGD_EQP', 'InnoSi300sWaferTesterPm',
    (innotech_si300s_wafer_tester_monthly_and_half_year_pm_fields.merge common_fields)

# DOC# 3981-02-30008 	 JEM Probe Card Monthly&Half Year PM Record(探针卡月/年保养表单)
jem_probe_card_monthly_and_half_year_pm_fields = {
    :profile_check => :string,
	:in_time       => :timestamp,
	:out_time      => :timestamp,
}
generate_form 'KGD_EQP', 'JemProbeCardPm',
    (jem_probe_card_monthly_and_half_year_pm_fields.merge common_fields)

# DOC# 3981-02-30014 	 FOUP Cleaning Record(FOUP清洁记录表)
foup_cleaning_fields = {
    :profile_check => :string,
	:in_time       => :timestamp,
	:out_time      => :timestamp,
}
generate_form 'KGD_EQP', 'FoupCleaning',
    (foup_cleaning_fields.merge common_fields)

# DOC# 3981-02-30015 	 TEL Precio Wafer prober Monthly&Half Year PM Record(Precio probe 月/年保养表单)
tel_precio_wafer_prober_monthly_and_half_year_pm_fields = {
    :profile_check => :string,
	:in_time       => :timestamp,
	:out_time      => :timestamp,
}
generate_form 'KGD_EQP', 'TelPrecioWaferProberPm',
    (tel_precio_wafer_prober_monthly_and_half_year_pm_fields.merge common_fields)

# DOC# 3981-02-30017 	 KGD PROBE CARD buy-off report(Probe 验收报告)
kgd_probe_card_buy_off_fields = {
    :profile_check => :string,
	:in_time       => :timestamp,
	:out_time      => :timestamp,
}
generate_form 'KGD_EQP', 'KgdProbeCardBuyOff',
    (kgd_probe_card_buy_off_fields.merge common_fields)

# DOC# 3981-02-30021 	 KGD_IR_reflow_oven_system_shiftly_check_record (IR-Reflow 烤箱开班记录表单)
kgd_ir_reflow_oven_system_shiftly_check_fields = {
    :profile_check => :string,
	:in_time       => :timestamp,
	:out_time      => :timestamp,
}
generate_form 'KGD_EQP', 'KgdIrReflowOvenShiftChk',
    (kgd_ir_reflow_oven_system_shiftly_check_fields.merge common_fields)

# DOC# 3981-02-30022 	 KGD_IR_Reflow_Oven_monthly&yearly_PM_record(IR-Reflow烤箱月/年保养表单)
kgd_ir_reflow_oven_monthly_and_yearly_pm_fields = {
    :profile_check => :string,
	:in_time       => :timestamp,
	:out_time      => :timestamp,
}
generate_form 'KGD_EQP', 'KgdIrReflowOvenPm',
    (kgd_ir_reflow_oven_monthly_and_yearly_pm_fields.merge common_fields)

# DOC# 3983-02-00018 	SDSS KGD Wafer Bank cycle count report
sdss_kgd_wafer_bank_cycle_count_fields = {
    :profile_check => :string,
	:in_time       => :timestamp,
	:out_time      => :timestamp,
}
generate_form 'KGD_PRD', 'KgdWaferBankCycleCount',
    (sdss_kgd_wafer_bank_cycle_count_fields.merge common_fields)

# DOC# 3724-02-10007	Material Request Sheet
material_transfer_issue_request_form_fields = {
    :profile_check => :string,
	:in_time       => :timestamp,
	:out_time      => :timestamp,
}
generate_form 'KGD_PRD', 'MaterialTransferIssue',
    (material_transfer_issue_request_form_fields.merge common_fields)
