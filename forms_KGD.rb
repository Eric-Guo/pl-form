# encoding: UTF-8

# DOC# 3983-02-00003	 SDSS KGD Testing Production Log Sheet
sdss_kgd_testing_production_fields = {
	:profile_check => :string,
	:in_time       => :timestamp,
	:out_time      => :timestamp,
}
generate_form 'KGD_PRD', 'SdssKgdTestingProduction',
	(common_production_fields.merge sdss_kgd_testing_production_fields.merge common_fields)

# DOC# KGD test	3983-02-00004	 SDSS KGD Material Loan Record
sdss_kgd_material_loan_fields = {
	:profile_check => :string,
	:in_time       => :timestamp,
	:out_time      => :timestamp,
}
generate_form 'KGD_PRD', 'SdssKgdMaterialLoan',
	(sdss_kgd_material_loan_fields.merge common_fields)

# DOC# 3983-02-00005	 SDSS KGD Wafer Abnormal Hold Sheet
sdss_kgd_wafer_abnormal_hold_fields = {
	:profile_check => :string,
	:in_time       => :timestamp,
	:out_time      => :timestamp,
}
generate_form 'KGD_PRD', 'SdssKgdWaferAbnormalHold',
	(sdss_kgd_wafer_abnormal_hold_fields.merge common_fields)

# DOC# 3983-02-00006	 SDSS KGD Return Wafer Record
sdss_kgd_return_wafer_fields = {
    :profile_check => :string,
	:in_time       => :timestamp,
	:out_time      => :timestamp,
}
generate_form 'KGD_PRD', 'SdssKgdReturnWafer',
	(sdss_kgd_return_wafer_fields.merge common_fields)

# DOC# 3983-02-00007	SDSS KGD MRB Material Track Rrecord
sdss_kgd_mrb_material_track_fields = {
    :profile_check => :string,
	:in_time       => :timestamp,
	:out_time      => :timestamp,
}
generate_form 'KGD_PRD', 'SdssKgdMrbMaterialTrack',
	(sdss_kgd_mrb_material_track_fields.merge common_fields)

# DOC# 3983-02-00013	 SDSS KGD Borrowing Machine Form
sdss_kgd_borrowing_machine_form_fields = {
    :profile_check => :string,
	:in_time       => :timestamp,
	:out_time      => :timestamp,
}
generate_form 'KGD_PRD', 'SdssKgdBorrowingMachineForm',
	(sdss_kgd_borrowing_machine_form_fields.merge common_fields)

# DOC# 3983-02-00015	SDSS KGD Wafer Vacuum Packing Machine first sample affirm record (晶圆真空包装机首件确认记录)
sdss_kgd_wafer_vacuum_packing_machine_first_sample_affirm_fields = {
    :profile_check => :string,
	:in_time       => :timestamp,
	:out_time      => :timestamp,
}
generate_form 'KGD_PRD', 'SdssKgdWaferVacuumPackingMachineFirstSampleAffirm',
	(sdss_kgd_wafer_vacuum_packing_machine_first_sample_affirm_fields.merge common_fields)

# DOC# 3983-02-00017	SDSS KGD N2 Cabinet humidity record
sdss_kgd_n2_cabinet_humidity_fields = {
    :profile_check => :string,
	:in_time       => :timestamp,
	:out_time      => :timestamp,
}
generate_form 'KGD_PRD', 'SdssKgdN2CabinetHumidity',
	(sdss_kgd_n2_cabinet_humidity_fields.merge common_fields)

# DOC# 3983-02-00025	 SDSS KGD wafer vacuum bag use record
sdss_kgd_wafer_vacuum_bag_use_fields = {
    :profile_check => :string,
	:in_time       => :timestamp,
	:out_time      => :timestamp,
}
generate_form 'KGD_PRD', 'SdssKgdWaferVacuumBagUse',
	(sdss_kgd_wafer_vacuum_bag_use_fields.merge common_fields)

# DOC# 3712-02-00049	 QDN format
quality_deviation_notice_format_fields = {
    :profile_check => :string,
	:in_time       => :timestamp,
	:out_time      => :timestamp,
}
generate_form 'KGD_PRD', 'QualityDeviationNoticeFormat',
	(quality_deviation_notice_format_fields.merge common_fields)

# DOC# 3724-02-10044	 KGD_Wafer_Receiver_Form
kgd_wafer_receiver_form_fields = {
    :profile_check => :string,
	:in_time       => :timestamp,
	:out_time      => :timestamp,
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

# DOC# 3983-02-000021	 SDSS KGD Wafer Sorter Production Log sheet (Cherry pick记录表单)
sdss_kgd_wafer_sorter_production_fields = {
    :profile_check => :string,
	:in_time       => :timestamp,
	:out_time      => :timestamp,
}
generate_form 'KGD_PRD', 'SdssKgdWaferSorterProduction',
    (common_production_fields.merge sdss_kgd_wafer_sorter_production_fields.merge common_fields)

# DOC# 3985-02-00006	 KGD_Enginner_lot_N2_Cabinet_Record(KGD工程批氮气柜记录表)
kgd_enginner_lot_n2_cabinet_fields = {
    :profile_check => :string,
	:in_time       => :timestamp,
	:out_time      => :timestamp,
}
generate_form 'KGD_PRD', 'KgdEnginnerLotN2Cabinet',
    (kgd_enginner_lot_n2_cabinet_fields.merge common_fields)

# DOC# 3981-02-30005	 SDSS_KGD_Equipment_Down_Time_Record(设备维修表单)
sdss_kgd_equipment_down_time_fields = {
    :profile_check => :string,
	:in_time       => :timestamp,
	:out_time      => :timestamp,
}
generate_form 'KGD_EQP', 'SdssKgdEquipmentDownTime',
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
generate_form 'KGD_EQP', 'SdssKgdMicroscopeEquipmentHalfYearPm',
    (sdss_kgd_microscope_equipment_half_year_pm_fields.merge common_fields)

# DOC# 3981-02-30013	 KGD vacuum packaging machine Monthly PM Record(真空包装机月保养表单)
kgd_vacuum_packaging_machine_monthly_pm_fields = {
    :profile_check => :string,
	:in_time       => :timestamp,
	:out_time      => :timestamp,
}
generate_form 'KGD_EQP', 'KgdVacuumPackagingMachineMonthlyPm',
    (kgd_vacuum_packaging_machine_monthly_pm_fields.merge common_fields)

# DOC# 3981-02-30016 	 SDSS KGD wafer sorter PM Record(Cherry pcik 机台保养表单)
sdss_kgd_wafer_sorter_pm_fields = {
    :profile_check => :string,
	:in_time       => :timestamp,
	:out_time      => :timestamp,
}
generate_form 'KGD_EQP', 'SdssKgdWaferSorterPm',
    (sdss_kgd_wafer_sorter_pm_fields.merge common_fields)

# DOC# 3981-02-30025 	 SDSS KGD Dynatech wafer pack unpack shift check record(导料机开班检查记录表)
sdss_kgd_dynatech_wafer_pack_unpack_shift_check_fields = {
    :profile_check => :string,
	:in_time       => :timestamp,
	:out_time      => :timestamp,
}
generate_form 'KGD_EQP', 'SdssKgdDynatechWaferPackUnpackShiftCheck',
    (sdss_kgd_dynatech_wafer_pack_unpack_shift_check_fields.merge common_fields)

# DOC# 3981-02-30026 	 SDSS KGD Dynatech wafer pack unpack PM record(导料机保养表单)
sdss_kgd_dynatech_wafer_pack_unpack_pm_fields = {
    :profile_check => :string,
	:in_time       => :timestamp,
	:out_time      => :timestamp,
}
generate_form 'KGD_EQP', 'SdssKgdDynatechWaferPackUnpackPm',
    (sdss_kgd_dynatech_wafer_pack_unpack_pm_fields.merge common_fields)

# DOC# 3981-02-30006 	 Accretech UF3000EX Wafer Prober Monthly&Half Year PM Record(UF3000EX probe 月/年保养表单)
accretech_uf3000ex_wafer_prober_monthly_and_half_year_pm_fields = {
    :profile_check => :string,
	:in_time       => :timestamp,
	:out_time      => :timestamp,
}
generate_form 'KGD_EQP', 'AccretechUf3000exWaferProberMonthlyAndHalfYearPm',
    (accretech_uf3000ex_wafer_prober_monthly_and_half_year_pm_fields.merge common_fields)

# DOC# 3981-02-30007 	 Innotech SI-300S Wafer Tester Monthly&Half Year PM Record (SI300S Tester 月/年保养表单)
innotech_si300s_wafer_tester_monthly_and_half_year_pm_fields = {
    :profile_check => :string,
	:in_time       => :timestamp,
	:out_time      => :timestamp,
}
generate_form 'KGD_EQP', 'InnotechSi300sWaferTesterMonthlyAndHalfYearPm',
    (innotech_si300s_wafer_tester_monthly_and_half_year_pm_fields.merge common_fields)

# DOC# 3981-02-30008 	 JEM Probe Card Monthly&Half Year PM Record(探针卡月/年保养表单)
jem_probe_card_monthly_and_half_year_pm_fields = {
    :profile_check => :string,
	:in_time       => :timestamp,
	:out_time      => :timestamp,
}
generate_form 'KGD_EQP', 'JemProbeCardMonthlyAndHalfYearPm',
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
generate_form 'KGD_EQP', 'TelPrecioWaferProberMonthlyAndHalfYearPm',
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
generate_form 'KGD_EQP', 'KgdIrReflowOvenSystemShiftlyCheck',
    (kgd_ir_reflow_oven_system_shiftly_check_fields.merge common_fields)

# DOC# 3981-02-30022 	 KGD_IR_Reflow_Oven_monthly&yearly_PM_record(IR-Reflow烤箱月/年保养表单)
kgd_ir_reflow_oven_monthly_and_yearly_pm_fields = {
    :profile_check => :string,
	:in_time       => :timestamp,
	:out_time      => :timestamp,
}
generate_form 'KGD_EQP', 'KgdIrReflowOvenMonthlyAndYearlyPm',
    (kgd_ir_reflow_oven_monthly_and_yearly_pm_fields.merge common_fields)

# DOC# 3983-02-00018 	SDSS KGD Wafer Bank cycle count report
sdss_kgd_wafer_bank_cycle_count_fields = {
    :profile_check => :string,
	:in_time       => :timestamp,
	:out_time      => :timestamp,
}
generate_form 'KGD_PRD', 'SdssKgdWaferBankCycleCount',
    (sdss_kgd_wafer_bank_cycle_count_fields.merge common_fields)

# DOC# 3724-02-10007	Material Request Sheet
material_transfer_issue_request_form_fields = {
    :profile_check => :string,
	:in_time       => :timestamp,
	:out_time      => :timestamp,
}
generate_form 'KGD_PRD', 'MaterialTransferIssueRequest',
    (material_transfer_issue_request_form_fields.merge common_fields)
