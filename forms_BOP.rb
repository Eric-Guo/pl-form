# encoding: UTF-8

# DOC# 3746-02-10008 PMC Production log sheet 作业记录表
pmc_production_log_fields = {
	:profile_check => :string,
	:in_time       => :timestamp,
	:out_time      => :timestamp,
}
generate_form 'BOP_PRD', 'PmcProduction',
	(common_production_fields.merge pmc_production_log_fields.merge common_fields)


# DOC# 3746-02-10012 Ink Oven Cure Production Log Sheet
ink_oven_cure_production_fields = {
	:profile_check => :string,
	:in_time       => :timestamp,
	:out_time      => :timestamp,
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
substrate_laser_mark_production_fields = {
	:laser_power        => :float,
	:laser_depth        => :float,
	:position_demension => :string,
	:confirm_by         => :string,
}
generate_form 'BOP_PRD', 'SubstrateLaserMarkProduction',
	(common_production_fields.merge substrate_laser_mark_production_fields.merge common_fields)


# DOC# 3746-02-20033	Substrate Ink Mark Production Log Sheet
substrate_ink_mark_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
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
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'BOP_PRD', 'InkMarkProduction',
	(common_production_fields.merge ink_mark_production_log_fields.merge common_fields)


# DOC# 3746-02-30004	Laser cut production
laser_cut_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'BOP_PRD', 'LaserCutProduction',
	(common_production_fields.merge laser_cut_production_log_fields.merge common_fields)

# DOC# 3746-02-40004	Saw singulation production
saw_singulation_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'BOP_PRD', 'SawSingulationProduction',
	(common_production_fields.merge saw_singulation_production_log_fields.merge common_fields)

# DOC# 3746-02-90010	SDSS_T-scan_production
t_scan_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'BOP_PRD', 'T_scanProduction',
	(common_production_fields.merge t_scan_production_log_fields.merge common_fields)

# DOC# 3746-02-60001	AOI production
aoi_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'BOP_PRD', 'AoiProduction',
	(common_production_fields.merge aoi_production_log_fields.merge common_fields)

# DOC# 3746-02-90003	SDSS Solder ball attach production
ba_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'BOP_PRD', 'BaProduction',
	(common_production_fields.merge ba_production_log_fields.merge common_fields)

# DOC# 3746-02-90016	SDSS_OSP_pre-clean_production_log
osp_pre_clean_production_log_fields = {
	:recipe        => :string,
	:defect        => :string,
	:defect_qty    => :integer,
	:reflow_recipe => :string,
	:flux_type     => :string,
	:flux_lot_no   => :string,
}
generate_form 'BOP_PRD', 'OspPreCleanProduction',
	(common_production_fields.merge osp_pre_clean_production_log_fields.merge common_fields)

# DOC# 3746-02-90013	SDSS_IR_Reflow_production_log
ir_reflow_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'BOP_PRD', 'IrReflowProduction',
	(common_production_fields.merge ir_reflow_production_log_fields.merge common_fields)

# DOC# 3742-02-30066	Package Saw shift check Record
package_saw_shift_check_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'BOP_EQP', 'PackageSawShiftCheck',
	(common_production_fields.merge package_saw_shift_check_fields.merge common_fields)

# DOC# 3746-02-40003	SGN Positrol log
sgn_positrol_log_fields = {
	:profile_check  => :string,
	:in_time     => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'BOP_EQP', 'SgnPositrolLog',
	(common_production_fields.merge sgn_positrol_log_fields.merge common_fields)

# DOC# 3746-02-30053	Conversion Kit Change Record Sheet 改机记录表
conversion_kit_change_record_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'BOP_EQP', 'SgnConversionKitChangeLog',
	(common_production_fields.merge conversion_kit_change_record_fields.merge common_fields)

# DOC# 3746-02-40006	saw singulation blade change record sheet
saw_singulation_blade_change_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'BOP_EQP', 'SawSingulationBladeChangeLog',
	(common_production_fields.merge saw_singulation_blade_change_fields.merge common_fields)

# DOC# 3742-02-30030	PM Monthly & Half year record
sgn_pm_monthly_half_year_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'BOP_EQP', 'SgnPmMonthlyHalfYearLog',
	(common_production_fields.merge sgn_pm_monthly_half_year_fields.merge common_fields)

# DOC# 3742-02-30058	Oven shift check Record
oven_shift_check_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'BOP_EQP', 'OvenShiftCheckLog',
	(oven_shift_check_production_log_fields.merge common_fields)

# DOC# 3742-02-30088	Oven Weekly PM Record
oven_weekly_pm_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'BOP_EQP', 'OvenWeeklyPmLog',
	(oven_weekly_pm_production_log_fields.merge common_fields)

# DOC# 3746-02-10007 & 3746-02-10011	Oven Positrol log
oven_positrol_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'BOP_EQP', 'OvenProduction',
	(common_production_fields.merge oven_positrol_log_fields.merge common_fields)

# DOC# 3742-02-30074	PM Monthly & Half year record
oven_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'BOP_EQP', 'OvenMonthlyPmAndHalfYear',
	(common_production_fields.merge oven_production_log_fields.merge common_fields)

# DOC# 3742-02-30038	Engraver Equipment Monthly&Half yearly PM Record
engraver_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'BOP_EQP', 'EngraverProduction',
	(common_production_fields.merge engraver_production_log_fields.merge common_fields)

# DOC# 3742-02-30061	Ink Mark shift check Record
ink_mark_shift_check_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'BOP_EQP', 'InkMarkShiftCheckLog',
	(ink_mark_shift_check_fields.merge common_fields)

# DOC# 3742-02-20008	Positrol log
ink_mark_positrol_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'BOP_EQP', 'InkMarkPositrolLog',
	(common_production_fields.merge ink_mark_positrol_log_fields.merge common_fields)

# DOC# 3742-02-30035	PM Monthly & Half year record
ink_mark_pm_monthly_half_year_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'BOP_EQP', 'InkMarkPmMonthlyHalfYearRecord',
	(ink_mark_pm_monthly_half_year_fields.merge common_fields)

# DOC# 3742-02-30062	Laser Mark shift check Record
laser_mark_shift_check_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'BOP_EQP', 'LaserMarkShiftCheck',
	(common_production_fields.merge laser_mark_shift_check_fields.merge common_fields)


# DOC# 3742-02-30081	Laser Marking Dust weekly PM record
laser_mark_dust_weekly_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'BOP_EQP', 'LaserMarkDustWeeklyPm',
	(common_production_fields.merge laser_mark_dust_weekly_pm_fields.merge common_fields)

# DOC# 3746-02-20003	Laser Mark Positrol log
laser_mark_positrol_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'BOP_EQP', 'LaserMarkProduction',
	(common_production_fields.merge laser_mark_positrol_log_fields.merge common_fields)

# DOC# 3742-02-30019	PM Monthly & Half year record
laser_mark_pm_monthly_half_year_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'BOP_EQP', 'LaserMarkPmHalfYear',
	(common_production_fields.merge laser_mark_pm_monthly_half_year_fields.merge common_fields)

# DOC# 3742-02-30059	Laser Cut shift check record
laser_cut_shift_check_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'BOP_EQP', 'LaserCutShiftCheck',
	(common_production_fields.merge laser_cut_shift_check_fields.merge common_fields)

# DOC# 3742-02-30003	Positrol log
laser_cut_positrol_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'BOP_EQP', 'LaserCutPositrolLog',
	(common_production_fields.merge laser_cut_positrol_log_fields.merge common_fields)

# DOC# 3742-02-30054	Laser Cut Conversion Kit Change Record Sheet 改机记录表
laser_cut_conversion_kit_change_fields = {
	:device_type => :string,
	:manufacture_serial_no => :string,
	:owner => :string,
}
generate_form 'BOP_EQP', 'LaserCutConversionKitChange',
	(laser_cut_conversion_kit_change_fields.merge common_fields)

# DOC# 3742-02-30080	tooling_PM_&_power_check_track_list
laser_cut_tooling_pm_power_check_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'BOP_EQP', 'LaserCutToolingPmPowerCheck',
	(common_production_fields.merge laser_cut_tooling_pm_power_check_fields.merge common_fields)

# DOC# －－－	clean filter check list
laser_cut_clean_filter_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'BOP_EQP', 'LaserCutCleanFilter',
	(common_production_fields.merge laser_cut_clean_filter_fields.merge common_fields)

# DOC# 3742-02-30028	PM Monthly & Half year record
laser_cut_pm_monthly_half_year_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'BOP_EQP', 'LaserCutPmMonthlyHalfYear',
	(common_production_fields.merge laser_cut_pm_monthly_half_year_fields.merge common_fields)

# DOC# 3746-02-90001	B/A Positrol log
sba_positrol_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'BOP_EQP', 'SbaPositrolLog',
	(common_production_fields.merge sba_positrol_log_fields.merge common_fields)

# DOC# 3746-02-60014	IR Reflow Positrol log
sba_ir_reflow_positrol_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'BOP_EQP', 'SbaIrReflowPositrolLog',
	(common_production_fields.merge sba_ir_reflow_positrol_log_fields.merge common_fields)

# DOC# 3742-02-30063	Ball Attach Shift Check Record
sba_ball_attach_shift_check_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'BOP_EQP', 'SbaBallAttachShiftCheck',
	(common_production_fields.merge sba_ball_attach_shift_check_fields.merge common_fields)

# DOC# 3742-02-30065	Aqueous Cleaner Shift Check Record
sba_aqueous_cleaner_shift_check_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'BOP_EQP', 'SbaAqueousCleanerShiftCheck',
	(common_production_fields.merge sba_aqueous_cleaner_shift_check_fields.merge common_fields)

# DOC# 3742-02-30064	Oven Reflow Shift Check Record
over_reflow_shift_check_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'BOP_EQP', 'SbaOvenReflowShiftCheck',
	(common_production_fields.merge over_reflow_shift_check_fields.merge common_fields)

# DOC# 3742-02-30055	Conversion Kit Change Record Sheet 改机记录表
sba_conversion_kit_change_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'BOP_EQP', 'SbaConversionKitChangeLog',
	(common_production_fields.merge sba_conversion_kit_change_fields.merge common_fields)

# DOC# 3742-02-30075	Auto tool clean track list
auto_tool_clean_track_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'BOP_EQP', 'AutoToolCleanTrack',
	(common_production_fields.merge auto_tool_clean_track_fields.merge common_fields)

# DOC# 3742-02-30076	Oven reflow change device record list
oven_reflow_change_device_production_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'BOP_EQP', 'OverReflowChangeDevice',
	(common_production_fields.merge oven_reflow_change_device_production_log_fields.merge common_fields)

# DOC# 3742-02-30046	SBA ball attach Monthly&Half yearly PM Record
ball_attach_monthly_half_yearly_pm_production_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'BOP_EQP', 'BallAttachMonthlyHalfYearlyPm',
	(common_production_fields.merge ball_attach_monthly_half_yearly_pm_production_fields.merge common_fields)

# DOC# 3742-02-30048	SBA reflow oven Equipment Monthly&Half yearly PM Record
reflow_oven_equipment_monthly_half_yearly_pm_production_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'BOP_EQP', 'SbaReflowOvenEquipmentPm',
	(common_production_fields.merge reflow_oven_equipment_monthly_half_yearly_pm_production_fields.merge common_fields)

# DOC# 3742-02-30049	SBA water cleaner Equipment Monthly&Half yearly PM Record
sba_wafer_cleaner_equipment_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'BOP_EQP', 'SbaWaferCleanerEquipmentPm',
	(common_production_fields.merge sba_wafer_cleaner_equipment_pm_fields.merge common_fields)

# DOC# 3742-02-30047	SBA shuttle Equipment Monthly&Half yearly PM Record
sba_shuttle_equipment_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'BOP_EQP', 'SbaShuttleEquipmentPm',
	(common_production_fields.merge sba_shuttle_equipment_pm_fields.merge common_fields)

# DOC# 3742-02-30070	Onloader and unloader for Pre-clean Monthly & Half yearly PM Record
sba_onloader_unloader_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'BOP_EQP', 'SbaOnloaderAndUnloaderPm',
	(common_production_fields.merge sba_onloader_unloader_pm_fields.merge common_fields)

# DOC# 3742-02-30060	Ultrasonic Cleaner Shift Check Record
ultrasonic_cleaner_shift_check_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'BOP_EQP', 'UltrasonicCleanerShiftCheck',
	(common_production_fields.merge ultrasonic_cleaner_shift_check_fields.merge common_fields)

# DOC# 3746-02-50003	Positrol log
ultrasonic_cleaner_positrol_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'BOP_EQP', 'UltrasonicCleanerPositrolLog',
	(common_production_fields.merge ultrasonic_cleaner_positrol_log_fields.merge common_fields)

# DOC# 3742-02-30022   PM Weekly record
ultrasonic_cleaner_weekly_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'BOP_EQP', 'UltrasonicCleanerPmWeekly',
	(common_production_fields.merge ultrasonic_cleaner_weekly_pm_fields.merge common_fields)

# DOC# 3746-02-30022	Ultrasonic Cleaning  Equipment change solvent PM Record
ultrasonic_cleaner_equipment_change_solvent_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'BOP_EQP', 'UltrasonicCleanerEquipmentChangeSolvent',
	(common_production_fields.merge ultrasonic_cleaner_equipment_change_solvent_pm_fields.merge common_fields)

# DOC# 3742-02-30023	PM Monthly & Half year record
ultrasonic_cleaner_monthly_half_year_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'BOP_EQP', 'UltrasonicCleanerMonthlyHalfYearPm',
	(common_production_fields.merge ultrasonic_cleaner_monthly_half_year_pm_fields.merge common_fields)

# DOC# 3746-02-00020	ICOS Shift Check Record
icos_shift_check_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'BOP_EQP', 'IcosShiftCheck',
	(common_production_fields.merge icos_shift_check_fields.merge common_fields)

# DOC# 3746-02-60002	ICOS Positrol log
icos_positrol_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'BOP_EQP', 'IcosPositrolLog',
	(common_production_fields.merge icos_positrol_fields.merge common_fields)

# DOC# 3742-02-30056	PM Monthly & Half year record
icos_monthly_half_year_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'BOP_EQP', 'IcosMonthlyHalfYearRecord',
	(common_production_fields.merge icos_monthly_half_year_pm_fields.merge common_fields)

# DOC# 3742-02-30077	PM Monthly & Half year record
t_scan_monthly_half_year_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'BOP_EQP', 'TScanMonthlyHalfYear',
	(common_production_fields.merge t_scan_monthly_half_year_pm_fields.merge common_fields)

# DOC# 3742-02-30077	Quarterly PM record
t_scan_quarterly_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'BOP_EQP', 'TScanQuarterlyPm',
	(common_production_fields.merge t_scan_quarterly_pm_fields.merge common_fields)

# DOC# 3742-02-30079	change water tracking record - weekly
t_scan_change_water_tracking_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'BOP_EQP', 'TScanChangeWaferTracking',
	(common_production_fields.merge t_scan_change_water_tracking_fields.merge common_fields)

# DOC# 3746-02-60002	Positrol log
sti_positrol_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'BOP_EQP', 'StiPositrolLog',
	(common_production_fields.merge sti_positrol_log_fields.merge common_fields)

# DOC# 3742-02-30072	PM Weekly record
sti_weekly_record_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'BOP_EQP', 'StiWeeklyRecord',
	(common_production_fields.merge sti_weekly_record_fields.merge common_fields)

# DOC# 3742-02-30071	PM Monthly & Half year record
sti_monthly_half_year_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'BOP_EQP', 'StiMonthlyHalfYearPm',
	(common_production_fields.merge sti_monthly_half_year_pm_fields.merge common_fields)

# DOC# 3742-02-30073	Shift Check Record
sti_shift_check_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'BOP_EQP', 'StiShiftCheck',
	(common_production_fields.merge sti_shift_check_fields.merge common_fields)

# DOC# 3746-02-20019	UV Ink Cure Positrol log
uv_ink_cure_positrol_log_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'BOP_EQP', 'UvInkCurePositrol',
	(common_production_fields.merge uv_ink_cure_positrol_log_fields.merge common_fields)


# DOC# 3742-02-30078	PM Monthly & Half year record
uv_ink_cure_month_half_year_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'BOP_EQP', 'UvInkCureMonthlyHalfYear',
	(common_production_fields.merge uv_ink_cure_month_half_year_pm_fields.merge common_fields)

# DOC# 3742-02-30082	PM Monthly & Half year record
punch_cure_monthly_half_year_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'BOP_EQP', 'PunchMonthlyHalfYear',
	(punch_cure_monthly_half_year_pm_fields.merge common_fields)

# DOC# 3742-02-30087	Tray Cleanning shift check Record
tray_cleanning_shift_check_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'BOP_EQP', 'TrayCleanningShiftCheck',
	(tray_cleanning_shift_check_fields.merge common_fields)

# DOC# 3742-02-30085	Tray Cleaning  Equipment change  water PM Record
tray_cleaning_equipment_change_wafer_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'BOP_EQP', 'TrayCleaningEquipmentChangeWaferPm',
	(tray_cleaning_equipment_change_wafer_pm_fields.merge common_fields)

# DOC# 3742-02-30086	PM Monthly & Half year record
tray_cleaning_equipment_monthly_half_yearly_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'BOP_EQP', 'TrayCleaningEquipmentMonthlyHalfYearlyPm',
	(tray_cleaning_equipment_monthly_half_yearly_pm_fields.merge common_fields)

# DOC# 3744-02-00011	EOL存货卡
bop_eol_inventory_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'FOP_MAT', 'MhlProduction',
	(bop_eol_inventory_fields.merge common_fields)