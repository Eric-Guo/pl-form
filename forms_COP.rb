# encoding: UTF-8

# Common Production Fields can be merge in production log form
cop_common_production_fields = {
	:status_code => :string,
	:device      => :string,
	:lot_no      => :string,
	:reject_code => :string,
	:remark      => :string,
}

# DOC# 3755-02-00101 	COP FVI Rework Form
cop_rework_form_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_PRD', 'CopFviReworkForm',
	(cop_rework_form_fields.merge common_fields)

# DOC# 3755-02-11001	Production Log Sheet(Tray Ink mark)
tray_ink_mark_production_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_PRD', 'TrayInkMarkProduction',
	(tray_ink_mark_production_fields.merge common_fields)

# DOC# 3755-02-11005	Cosmetic_Marking_Production_Log_Sheet_R1
cosmetic_marking_production_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_PRD', 'CosmeticMarkingProduction',
	(cosmetic_marking_production_fields.merge common_fields)

# DOC# 3755-02-12001	Production Log Sheet(Compound Black TOP)
compound_black_top_production_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_PRD', 'CompoundBlackTopProduction',
	(compound_black_top_production_fields.merge common_fields)

# DOC# 3755-02-20004	Production Log Sheet (welding)
welding_production_fields = {
	:status_code         => :string, # 机台状态一律用这个，会生成统一下拉框
	:product_type        => :string,
	:device              => :string,
	:lot_no              => :string,
	:in_qty              => :integer,
	:out_qty             => :integer,
	:reject_code         => :string,
	:shaking_test_record => :string,
	:remark              => :string,
}
welding_production_detail_fields = {
	:items => ['Air pressure  气压','Energy Force 焊接能量','Amplitude %  振幅','Velocity 焊头下降速度','Hold Time 保持时间','Trig Force 触发压力','上盖P/N(模号&穴号）','下盖P/N(模号&穴号）','Visual Inspection外观检查','Card dimension卡的尺寸','switch force&pull force开关力和拉力','Shaking Test摇晃测试(仅对于Daxter产品)'],
	:result => :string,
}
generate_form 'COP_PRD', 'WeldingProduction',
	(welding_production_fields.merge common_fields), welding_production_detail_fields

# DOC# 3755-02-50004	Production Log Sheet ( card assembly laser mark)
card_assembly_laser_mark_production_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_PRD', 'CardAssemblyLaserMarkProduction',
	(card_assembly_laser_mark_production_fields.merge common_fields)

# DOC# 3755-02-60004	Production Log Sheet (SD label)
sd_label_production_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_PRD', 'SdLabelProduction',
	(sd_label_production_fields.merge common_fields)

# DOC# 3755-02-60011	Prodcution Log Sheet ( Card FVI)
card_fvi_production_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_PRD', 'CardFviProduction',
	(card_fvi_production_fields.merge common_fields)


# DOC# 3755-02-60029 Production Log Sheet (Mask Label)
mask_label_production_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_PRD', 'MaskLabelProduction',
	(mask_label_production_fields.merge common_fields)


# DOC# 3755-02-60041 	FVI Production log sheet
fvi_production_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_PRD', 'FviProduction',
	(fvi_production_fields.merge common_fields)


# DOC# 3755-02-70012	Prodcution Log Sheet (Packing)
packing_production_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_PRD', 'PackingProduction',
	(packing_production_fields.merge common_fields)

# DOC# 3755-02-70026	Production Log Sheet(Jewel case packing)
jewel_case_packing_production_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_PRD', 'JewelCasePackingProduction',
	(jewel_case_packing_production_fields.merge common_fields)

# DOC# 3755-02-90011	Production Log Sheet ( Ink Masking)
ink_masking_production_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_PRD', 'InkMaskingProduction',
	(ink_masking_production_fields.merge common_fields)

# DOC# 3755-02-60016	Production Log Sheet (Mask Label Bake)
mask_label_bake_production_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_PRD', 'MaskLabelBakeProduction',
	(mask_label_bake_production_fields.merge common_fields)

# DOC# 3751-02-10011	Auto_Welding_Equipment_Half-Yearly_PM
auto_welding_equipment_half_yearly_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'AutoWeldingEquipmentHalfYearlyPm',
	(auto_welding_equipment_half_yearly_pm_fields.merge common_fields)

# DOC# 3751-02-30036	Auto_Welding_Equipment_Weekly & Monthly_PM
card_assembly_auto_welding_equipment_weekly_and_monthly_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'CardAssemblyAutoWeldingEquipmentWeeklyAndMonthlyPm',
	(card_assembly_auto_welding_equipment_weekly_and_monthly_pm_fields.merge common_fields)

# DOC# 3751-02-30060	Auto_Welder_Machine_Shiftly_Check_Record
auto_welding_equipment_shiftly_check_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'AutoWeldingEquipmentShiftlyCheck',
	(auto_welding_equipment_shiftly_check_fields.merge common_fields)

# DOC# 3751-02-30021	Manual Welding Equipment Half-Yearly PM
manual_auto_welding_equipment_half_yearly_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'ManualAutoWeldingEquipmentHalfYearlyPm',
	(manual_auto_welding_equipment_half_yearly_pm_fields.merge common_fields)

# DOC# 3751-02-30037	Manual Welding Equipment Monthly PM
manual_welding_equipment_monthly_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'ManualWeldingEquipmentMonthlyPm',
	(manual_welding_equipment_monthly_pm_fields.merge common_fields)

# DOC# 3751-02-30059	Manual Welding Machine Shiftly Check Record
manual_welding_machine_shiftly_check_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'ManualWeldingMachineShiftlyCheck',
	(manual_welding_machine_shiftly_check_fields.merge common_fields)

# DOC# 3751-02-30119	De-Lid_Equipment_Month & half-Yearly_PM_Record
de_lid_equipment_month_and_half_yearly_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'DeLidEquipmentMonthaAndHalfYearlyPm',
	(de_lid_equipment_month_and_half_yearly_pm_fields.merge common_fields)

# DOC# 3751-02-30120	De-Lid_Machine_Shiftly_Check_Record
de_lid_machine_shiftly_check_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'DeLidMachineShiftlyCheck',
	(de_lid_machine_shiftly_check_fields.merge common_fields)

# DOC# 3751-02-30016	Bottom_Lid_Marking_Equipment_Half-Yearly_PM
bottom_lid_marking_equipment_half_yearly_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'BottomLidMarkingEquipmentHalfYearlyPm',
	(bottom_lid_marking_equipment_half_yearly_pm_fields.merge common_fields)

# DOC# 3751-02-30044	Bottom_Lid_Marking_Equipment_Weekly & Monthly_PM
bottom_lid_marking_equipment_weekly_and_monthly_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'BottomLidMarkingEquipmentWeeklyAndMonthlyPm',
	(bottom_lid_marking_equipment_weekly_and_monthly_pm_fields.merge common_fields)

# DOC# 3751-02-30061	 Bottom Lid Marking Machine Shiftly Check Record
bottom_lid_marking_machine_shiftly_check_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'BottomLidMarkingMachineShiftlyCheck',
	(bottom_lid_marking_machine_shiftly_check_fields.merge common_fields)

# DOC# 3751-02-30076	Dry Cabinet Monthly And Half-Yearly PM Record
dry_cabinet_monthly_and_half_yearly_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'DryCabinetMonthlyAndHalfYearlyPm',
	(dry_cabinet_monthly_and_half_yearly_pm_fields.merge common_fields)

# DOC# 3751-02-30073	Force Tester Equipment Monthly And Half-Yearly PM Record
force_tester_equipment_monthly_and_half_yearly_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'ForceTesterEquipmentMonthlyAndHalfYearlyPm',
	(force_tester_equipment_monthly_and_half_yearly_pm_fields.merge common_fields)

# DOC# 3751-02-30042	Card Assembly ICOS Equipment Monthly And Half-Yearly PM Record
card_assembly_icos_equipment_monthly_and_half_yearly_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'CardAssemblyIcosEquipmentMonthlyAndHalfYearlyPm',
	(card_assembly_icos_equipment_monthly_and_half_yearly_pm_fields.merge common_fields)

# DOC# 3751-02-30058	AOI Machine Shiftly Check Record
aoi_machine_shiftly_check_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'AoiMachineShiftlyCheckSTI_Shiftly_Check',
	(aoi_machine_shiftly_check_fields.merge common_fields)

# DOC# 3751-02-30077	STI_Shiftly_Check_Record
sti_shiftly_check_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'StiShiftlyCheck',
	(sti_shiftly_check_fields.merge common_fields)

# DOC# 3751-02-30117	STI_Equipment_Monthly_And_Half-Yearly_PM_Record
sti_hexa_equipment_monthly_and_half_yearly_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'StiHexaEquipmentMonthlyAndHalfYearlyPm',
    (sti_hexa_equipment_monthly_and_half_yearly_pm_fields.merge common_fields)

# DOC# 3751-02-30028	 Oven Equipment Monthly And Half-Yearly PM Record
oven_equipment_monthly_and_half_yearly_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'OvenEquipmentMonthlyAndHalfYearlyPm',
	(oven_equipment_monthly_and_half_yearly_pm_fields.merge common_fields)

# DOC# 3751-02-30057	Oven_Machine_Shiftly_Check_Record
oven_machine_shiftly_check_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'OvenMachineShiftlyCheck',
	(oven_machine_shiftly_check_fields.merge common_fields)

# DOC# 3751-02-30112	Vacuum_Oven_Monthly_And_Half-Yearly_PM_Record
vacuum_oven_monthly_and_half_yearly_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'VacuumOvenMonthlyAndHalfYearlyPm',
	(vacuum_oven_monthly_and_half_yearly_pm_fields.merge common_fields)

# DOC# 3751-02-30113	Vacuum_oven_Shiftly_Check_Record
vacuum_oven_shiftly_check_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'VacuumOvenShiftlyCheck',
	(vacuum_oven_shiftly_check_fields.merge common_fields)

# DOC# 3751-02-30103	Mimaki Ink Jet Machine Shiftly Check Record
mimaki_ink_jet_machine_shiftly_check_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'MimakiInkJetMachineShiftlyCheck',
	(mimaki_ink_jet_machine_shiftly_check_fields.merge common_fields)

# DOC# 3751-02-30104	Mimaki Ink Jet Machine Weekly & Monthly PM Record
mimaki_ink_jet_machine_Weekly_and_monthly_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'MimakiInkJetMachineWeeklyAndMonthlyPm',
	(mimaki_ink_jet_machine_Weekly_and_monthly_pm_fields.merge common_fields)

# DOC# 3751-02-30105	Mimaki Ink Jet Machine Half-Yearly PM Record
mimaki_ink_jet_machine_half_yearly_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'MimakiInkJetMachineHalfYearlyPm',
	(mimaki_ink_jet_machine_half_yearly_pm_fields.merge common_fields)

# DOC# 3751-02-30100	 Microdot 930 With Dimatix Print Head Equipment Weekly & Monthly PM Record
microdot_930_with_dimatix_equipment_weekly_and_monthly_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'Microdot930WithDimatixEquipmentWeeklyAndMonthlyPm',
	(microdot_930_with_dimatix_equipment_weekly_and_monthly_pm_fields.merge common_fields)

# DOC# 3751-02-30101	Microdot 930 With Dimatix Print Head Equipment Half-Yearly PM Record
microdot_930_with_dimatix_equipment_half_yearly_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'Microdot930WithDimatixEquipmentHalfYearlyPm',
	(microdot_930_with_dimatix_equipment_half_yearly_pm_fields.merge common_fields)

# DOC# 3751-02-30102	Microdot 930 With Dimatix Print Head Equipment Shiftly Check Record
microdot_930_with_dimatix_equipment_shiftly_check_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'Microdot930WithDimatixEquipmentShiftlyCheck',
	(microdot_930_with_dimatix_equipment_shiftly_check_fields.merge common_fields)

# DOC# 3751-02-30032	Microdot 915 Equipment Weekly & Monthly PM Record
microdot_915_equipment_weekly_and_monthly_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'Microdot915EquipmentWeeklyAndMonthlyPm',
	(microdot_915_equipment_weekly_and_monthly_pm_fields.merge common_fields)

# DOC# 3751-02-30033	 Microdot 915 Equipment Half-Yearly PM Record
 microdot_915_equipment_half_yearly_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'Microdot915EquipmentHalfYearlyPm',
	(microdot_915_equipment_half_yearly_pm_fields.merge common_fields)

# DOC# 3751-02-30053	 Microdot 915 Machine Shiftly Check Record
microdot_915_machine_shiftly_check_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'Microdot915MachineShiftlyCheck',
	(microdot_915_machine_shiftly_check_fields.merge common_fields)

# DOC# 3751-02-30048	Microdot 930 Equipment Weekly & Monthly PM Record
microdot_930_equipment_weekly_and_monthly_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'Microdot930EquipmentWeeklyAndMonthlyPm',
	(microdot_930_equipment_weekly_and_monthly_pm_fields.merge common_fields)

# DOC# 3751-02-30049	 Microdot 930 Equipment Half-Yearly PM Record
microdot_930_equipment_half_yearly_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'Microdot930EquipmentHalfYearlyPm',
	(microdot_930_equipment_half_yearly_pm_fields.merge common_fields)

# DOC# 3751-02-30054	 Microdot 930 Machine Shiftly Check Record
microdot_930_machine_shiftly_check_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'Microdot930MachineShiftlyCheck',
	(microdot_930_machine_shiftly_check_fields.merge common_fields)

# DOC# 3741-02-30030	Plasma Equipment Quarterly PM Record
plasma_equipment_quarterly_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'PlasmaEquipmentQuarterlyPm',
	(plasma_equipment_quarterly_pm_fields.merge common_fields)

# DOC# 3741-02-30070	Plasma Equipment Shiftly Check Record
plasma_equipment_shiftly_check_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'PlasmaEquipmentShiftlyCheck',
	(plasma_equipment_shiftly_check_fields.merge common_fields)

# DOC# 3751-02-30078	Card Assembly Auto Silk Screen Half-Yearly PM Record
card_assembly_auto_silk_screen_half_yearly_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'CardAssemblyAutoSilkScreenHalfYearlyPm',
	(card_assembly_auto_silk_screen_half_yearly_pm_fields.merge common_fields)

# DOC# 3751-02-30079	Card Assembly Auto silk screen weekly & monthly PM record
card_assembly_auto_silk_screen_weekly_and_monthly_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'CardAssemblyAutoSilkScreenWeeklyAndMonthlyPm',
	(card_assembly_auto_silk_screen_weekly_and_monthly_pm_fields.merge common_fields)

# DOC# 3751-02-30080	 Card Assembly Auto Silk Screen Shiftly Check Record
card_assembly_auto_silk_screen_shiftly_check_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'CardAssemblyAutoSilkScreenShiftlyCheck',
	(card_assembly_auto_silk_screen_shiftly_check_fields.merge common_fields)

# DOC# 3751-02-30034	 UV Oven Equipment Weekly & Monthly PM Record
 uv_oven_equipment_weekly_and_monthly_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'UvOvenEquipmentWeeklyAndMonthlyPm',
	(uv_oven_equipment_weekly_and_monthly_pm_fields.merge common_fields)

# DOC# 3751-02-30035	UV Oven Equipment Half-Yearly PM Record
uv_oven_equipment_half_yearly_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'UvOvenEquipmentHalfYearlyPm',
	(uv_oven_equipment_half_yearly_pm_fields.merge common_fields)

# DOC# 3751-02-30055	UV Oven Machine Shiftly Check Record
uv_oven_machine_shiftly_check_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'UvOvenMachineShiftlyCheck',
	(uv_oven_machine_shiftly_check_fields.merge common_fields)

# DOC# 3751-02-30050	Auto_Jewel_Case_Machine_Weekly_And_Monthly_PM_Record
auto_jewel_case_machine_weekly_and_monthly_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'AutoJewelCaseMachineWeeklyAndMonthlyPm',
	(auto_jewel_case_machine_weekly_and_monthly_pm_fields.merge common_fields)

# DOC# 3751-02-30051	Auto_Jewel_Case_Packing_Machine_Half-Yearly_PM_Record
auto_jewel_case_packing_machine_half_yearly_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'AutoJewelCasePackingMachineHalfYearlyPm',
	(auto_jewel_case_packing_machine_half_yearly_pm_fields.merge common_fields)

# DOC# 3751-02-30062	Auto_j-case_Machine_Shiftly_Check_Record
auto_jewel_case_machine_shiftly_check_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'AutoJewelCaseMachineShiftlyCheck',
	(auto_jewel_case_machine_shiftly_check_fields.merge common_fields)

# DOC# 3751-02-30106	Card Assembly J-case Label Machine Shiftly Check Record
card_assembly_jewel_case_label_machine_shiftly_check_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'CardAssemblyJewelCaseLabelMachineShiftlyCheck',
	(card_assembly_jewel_case_label_machine_shiftly_check_fields.merge common_fields)

# DOC# 3751-02-30107	Card Assembly J-case Label Machine Monthly PM Record
card_assembly_jewel_case_label_machine_monthly_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'CardAssemblyJewelCaseLabelMachineMonthlyPm',
	(card_assembly_jewel_case_label_machine_monthly_pm_fields.merge common_fields)

# DOC# 3751-02-30108	Card Assembly J-case Label Machine Half-Yearly PM Record
card_assembly_jewel_case_label_machine_half_yearly_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'CardAssemblyJewelCaseLabelMachineHalfYearlyPm',
	(card_assembly_jewel_case_label_machine_half_yearly_pm_fields.merge common_fields)

# DOC# 3751-02-30052	Packing_Equipment_Half-Yearly_PM_Record
packing_equipment_half_yearly_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'PackingEquipmentHalfYearlyPm',
	(packing_equipment_half_yearly_pm_fields.merge common_fields)

# DOC# 3751-02-30064	Packing_Machine_Shiftly_Check_Record
packing_machine_shiftly_check_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'PackingMachineShiftlyCheck',
	(packing_machine_shiftly_check_fields.merge common_fields)

# DOC# 3751-02-30048	Card Assembly Pull Strength Test Equipment Monthly&Half-Yearly PM Record
card_assembly_pull_strength_test_equipment_monthly_and_half_yearly_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'CardAssemblyPullStrengthTestEquipmentMonthlyAndHalfYearlyPm',
	(card_assembly_pull_strength_test_equipment_monthly_and_half_yearly_pm_fields.merge common_fields)

# DOC# 3751-02-30047	Card Assembly Switch Force Test Equipment Monthly & Half-Yearly PM Record
card_assembly_switch_force_test_equipment_monthly_and_half_yearly_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'CardAssemblySwitchForceTestEquipmentMonthlyAndHalfYearlyPm',
	(card_assembly_switch_force_test_equipment_monthly_and_half_yearly_pm_fields.merge common_fields)

# DOC# 3751-02-30110	Card Assembly Engraver Equipment Machine Shift Check Record
card_assembly_engraver_equipment_machine_shift_check_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'CardAssemblyEngraverEquipmentMachineShiftCheck',
	(card_assembly_engraver_equipment_machine_shift_check_fields.merge common_fields)

# DOC# 3751-02-30109	Engraver Equipment Monthly & Half-Yearly PM Record
	engraver_equipment_monthly_and_half_yearly_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'EngraverEquipmentMonthlyAndHalfYearlyPm',
	(engraver_equipment_monthly_and_half_yearly_pm_fields.merge common_fields)

# DOC# 3751-02-30081	Card Assembly H2 Burn Half-Yearly PM Record
card_assembly_h2_burn_half_yearly_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'CardAssemblyH2BurnHalfYearlyPm',
	(card_assembly_h2_burn_half_yearly_pm_fields.merge common_fields)

# DOC# 3751-02-30082	Card_Assembly_H2_Burn_Machine_Shiftly_Check_Record
card_assembly_h2_burn_machine_shiftly_check_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'CardAssemblyH2BurnMachineShiftlyCheck',
    (card_assembly_h2_burn_machine_shiftly_check_fields.merge common_fields)

# DOC# 3751-02-30083	Card Assembly H2 Burn Weekly & Monthly PM Record
card_assembly_h2_burn_weekly_and_monthly_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'CardAssemblyH2BurnWeeklyAndMonthlyPm',
	(card_assembly_h2_burn_weekly_and_monthly_pm_fields.merge common_fields)

# DOC# 3751-02-30069	Card Assembly ON TRAY INK MARK Monthly PM Record
card_assembly_on_tray_ink_mark_monthly_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'CardAssemblyOnTrayInkMarkMonthlyPm',
	(card_assembly_on_tray_ink_mark_monthly_pm_fields.merge common_fields)

# DOC# 3751-02-30070	Card Assembly ON TRAY INK MARK Equipment Half-Yearly PM Record
card_assembly_on_tray_ink_mark_equipment_half_yearly_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'CardAssemblyOnTrayInkMarkEquipmentHalfYearlyPm',
	(card_assembly_on_tray_ink_mark_equipment_half_yearly_pm_fields.merge common_fields)

# DOC# 3751-02-30096	Card_Assembly_Tray_Ink_Mark_Shiftly_Check_Record
card_assembly_tray_ink_mark_shiftly_check_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'CardAssemblyTrayInkMarkShiftlyCheck',
	(card_assembly_tray_ink_mark_shiftly_check_fields.merge common_fields)

# DOC# 3751-02-30114	 Manual J-case Label Equipment Half-Yearly PM Record
manual_jewel_case_label_equipment_half_yearly_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'ManualJewelCaseLabelEquipmentHalfYearlyPm',
	(manual_jewel_case_label_equipment_half_yearly_pm_fields.merge common_fields)

# DOC# 3751-02-30115	Manual J-Case Label Machine Shiftly Check Record
manual_jewel_case_label_machine_shiftly_check_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'ManualJewelCaseLabelMachineShiftlyCheck',
	(manual_jewel_case_label_machine_shiftly_check_fields.merge common_fields)

# DOC# 3751-02-30116	Manual J-Case Label Machine Weekly & Monthly PM Record
manual_jewel_case_label_machine_weekly_and_monthly_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'ManualJewelCaseLabelMachineWeeklyAndMonthlyPm',
	(manual_jewel_case_label_machine_weekly_and_monthly_pm_fields.merge common_fields)

# DOC# 3751-02-30087	Manual SD Label Equipment Shiftly Check Record
manual_sd_label_equipment_shiftly_check_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'ManualSdLabelEquipmentShiftlyCheck',
	(manual_sd_label_equipment_shiftly_check_fields.merge common_fields)

# DOC# 3751-02-30088	 Manual SD Label Machine Weekly & Monthly PM Record
manual_sd_label_machine_weekly_and_monthly_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'ManualSdLabelMachineWeeklyAndMonthlyPm',
	(manual_sd_label_machine_weekly_and_monthly_pm_fields.merge common_fields)

# DOC# 3751-02-30089	 Manual SD Label Equipment Half-Yearly PM Record
manual_sd_label_equipment_half_yearly_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'ManualSdLabelEquipmentHalfYearlyPm',
	(manual_sd_label_equipment_half_yearly_pm_fields.merge common_fields)

# DOC# 3751-02-30040	 Auto Mask Label Attach Equipment Weekly & Monthly PM Record
auto_mask_label_attach_equipment_weekly_and_monthly_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'AutoMaskLabelAttachEquipmentWeeklyAndMonthlyPm',
	(auto_mask_label_attach_equipment_weekly_and_monthly_pm_fields.merge common_fields)

# DOC# 3751-02-30041	Auto Mask Label Attach Equipment Half-Yearly PM Record
auto_mask_label_attach_equipment_half_yearly_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'AutoMaskLabelAttachEquipmentHalfYearlyPm',
	(auto_mask_label_attach_equipment_half_yearly_pm_fields.merge common_fields)

# DOC# 3751-02-30056	Auto Mask Label Machine Shiftly Check Record
auto_mask_label_machine_shiftly_check_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'AutoMaskLabelMachineShiftlyCheck',
	(auto_mask_label_machine_shiftly_check_fields.merge common_fields)

# DOC# 3751-02-30091	Nautilus SD Label Equipment Shiftly Check Record
nautilus_sd_label_equipment_shiftly_check_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'NautilusSdLabelEquipmentShiftlyCheck',
	(nautilus_sd_label_equipment_shiftly_check_fields.merge common_fields)

# DOC# 3751-02-30092	Nautilus SD Label Attach Equipment Half-Yearly PM Record
nautilus_sd_label_attach_equipment_half_yearly_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'NautilusSdLabelAttachEquipmentHalfYearlyPm',
	(nautilus_sd_label_attach_equipment_half_yearly_pm_fields.merge common_fields)

# DOC# 3751-02-30090	Nautilus SD Label Attach Equipment Weekly & Monthly PM Record
nautilus_sd_label_attach_equipment_weekly_and_monthly_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'NautilusSdLabelAttachEquipmentWeeklyAndMonthlyPm',
	(nautilus_sd_label_attach_equipment_weekly_and_monthly_pm_fields.merge common_fields)

# DOC# 3751-02-30020	SD Label Attach Equipment Half-Yearly PM Record
sd_label_attach_equipment_half_yearly_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'SdLabelAttachEquipmentHalfYearlyPm',
	(sd_label_attach_equipment_half_yearly_pm_fields.merge common_fields)

# DOC# 3751-02-30045	SD Label Attach Equipment Weekly & Monthly PM record
sd_label_attach_equipment_weekly_and_monthly_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'SdLabelAttachEquipmentWeeklyAndMonthlyPm',
	(sd_label_attach_equipment_weekly_and_monthly_pm_fields.merge common_fields)

# DOC# 3751-02-30063	 SD Label Machine Shiftly Check Record
sd_label_machine_shiftly_check_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'COP_EQP', 'SdLabelMachineShiftlyCheck',
	(sd_label_machine_shiftly_check_fields.merge common_fields)


