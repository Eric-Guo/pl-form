# encoding: UTF-8

# Common Production Fields can be merge in production log form
top_common_production_fields = {
	:status_code => :string,
	:device      => :string,
	:lot_no      => :string,
	:reject_code => :string,
	:remark      => :string,
}

# DOC# 3735-02-00025	MT productin log sheet
memory_test_positrol_fields = {
	:m_c                   => :string,
	:lot_no                => :string,
	:package               => :string,
	:capacity              => :string,
	:temp                  => :string,
	:lot_in_time           => :timestamp,
	:lot_out_time          => :timestamp,
	:qty_in                => :string,
	:qty_out               => :string,
	:total                 => :timestamp,
	:ope                   => :timestamp,
	:rt                    => :timestamp,
	:eqa                   => :timestamp,
	:hucd                  => :timestamp,
	:setup                 => :timestamp,
	:pm_cal                => :timestamp,
	:handler               => :timestamp,
	:tester                => :timestamp,
	:facility              => :timestamp,
	:eng                   => :timestamp,
	:end_lot               => :timestamp,
	:idle                  => :timestamp,
	:visual_inspection     => :string,

}
generate_form 'TOP', 'MemoryTestProductin',
	(top_common_production_fields.merge memory_test_positrol_fields.merge common_fields)

# DOC# 3775-02-00103	CT productin log sheet
card_test_production_fields = {
	:m_c                   => :string,
	:lot_no                => :string,
	:package               => :string,
	:capacity              => :string,
	:lot_in_time           => :timestamp,
	:lot_out_time          => :timestamp,
	:qty_in                => :string,
	:qty_out               => :string,
	:total                 => :timestamp,
	:ope                   => :timestamp,
	:rt                    => :timestamp,
	:eqa                   => :timestamp,
	:set_up                => :timestamp,
	:pm_cal                => :timestamp,
	:handler               => :timestamp,
	:tester                => :timestamp,
	:facility              => :timestamp,
	:eng                   => :timestamp,
	:end_lot               => :timestamp,
	:idle                  => :timestamp,
	:visual_inspection     => :string,
}
generate_form 'TOP', 'CardTestProduction',
	(top_common_production_fields.merge card_test_production_fields.merge common_fields)

# DOC# 3795-02-00006	TFCL productin log sheet
tfcl_production_fields = {
	:m_c                   => :string,
	:lot_no                => :string,
	:lot_in_time           => :timestamp,
	:lot_out_time          => :timestamp,
	:qty_in                => :string,
	:qty_out               => :string,
	:total                 => :timestamp,
	:ope                   => :timestamp,
	:rt                    => :timestamp,
	:eqa                   => :timestamp,
	:set_up                => :timestamp,
	:pm_cal                => :timestamp,
	:handler               => :timestamp,
	:tester                => :timestamp,
	:facility              => :timestamp,
	:eng                   => :timestamp,
	:end_lot               => :timestamp,
	:idle                  => :timestamp,
	:misc                  => :string,
}
generate_form 'TOP', 'TfclProduction',
	(top_common_production_fields.merge tfcl_production_fields.merge common_fields)

# DOC# 3735-02-00026	Memory Test Daily check list
memory_test_daily_check_fields = {
	:start_end_time => :timestamp,
	:program_no     => :string,
	:contact_angle  => :string,
}
generate_form 'TOP', 'MemoryTestDailyCheck',
(memory_test_daily_check_fields.merge common_fields)

# DOC# 3731-02-30029	TOP shift machine jamming trend
mt_ct_tfcl_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'TOP', 'MtCtTfcl',
	(mt_ct_tfcl_fields.merge common_fields)

# DOC# 3731-02-20006	Monthly & Half Year PM Record
mt_ct_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'TOP', 'MtCt',
	(mt_ct_fields.merge common_fields)

# DOC# 3733-02-00138	TOP_conversion_checklist
top_conversion_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'TOP', 'TopConversion',
	(top_conversion_fields.merge common_fields)

# DOC# 3731-02-30036	STK Oven daily checklist
stk_oven_daily_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'TOP', 'StkOvenDaily',
	(stk_oven_daily_fields.merge common_fields)

# DOC# 3731-02-30037	 M820 Burn-In Daily Check Record
m820_burn_in_daily_check_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'TOP', 'M820BuinInDailyCheck',
	(m820_burn_in_daily_check_fields.merge common_fields)

# DOC# 3731-02-30037	 ProV Buin-In Daily Check Record
 prov_buin_in_daily_check_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'TOP', 'ProvBuinInDailyCheck',
	(prov_buin_in_daily_check_fields.merge common_fields)

# DOC# 3731-02-30036	JEC Oven daily checklist
jec_oven_daily_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'TOP', 'JecOvenDaily',
	(jec_oven_daily_fields.merge common_fields)

# DOC# 3731-02-30013	Monthly & Half Year PM Record
mirae_m820_handler_monthly_and_half_year_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'TOP', 'MiraeM820hHandlerMonthlyAndHalfYearPm',
	(mirae_m820_handler_monthly_and_half_year_pm_fields.merge common_fields)

# DOC# 3731-02-30013	Monthly & Half Year PM Record
burn_in_board_monthly_pm_record_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'TOP', 'BurnInBoardMonthlyPm',
	(burn_in_board_monthly_pm_record_fields.merge common_fields)

# DOC# 3775-02-00104	Card Test Daily check list
card_test_daily_check_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'TOP', 'CardTestDailyCheck',
	(card_test_daily_check_fields.merge common_fields)

# DOC# 3733-02-00140	TFCL Test Daily check list
tfcl_test_daily_check_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'TOP', 'TfclTestDailyCheck',
	(tfcl_test_daily_check_fields.merge common_fields)

# DOC# 3731-02-30046	HonTech Test Daily check list
honTech_test_daily_check_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'TOP', 'HonTechTestDailyCheck',
	(honTech_test_daily_check_fields.merge common_fields)

# DOC# 3731-02-30045	Mirae M150 Test Daily check list
mirae_m150_test_daily_check_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'TOP', 'MiraeM150TestDailyCheck',
	(mirae_m150_test_daily_check_fields.merge common_fields)

# DOC# 3791-02-30001	Monthly & Half Year PM Record
tfcl_tester_monthly_and_semi_annual_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'TOP', 'TfclTesterMonthlyAndSemiAnnualPm',
  (tfcl_tester_monthly_and_semi_annual_pm_fields.merge common_fields)

# DOC# 3731-02-30044	Monthly & Half Year PM Record
mirae_m150_handler_monthly_and_half_year_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'TOP', 'MiraeM150HandlerMonthlyAndHalfYearPm',
	(mirae_m150_handler_monthly_and_half_year_pm_fields.merge common_fields)

# DOC# 3731-02-30040	Monthly & Half Year PM Record
hontech_ht3600a_handler_monthly_and_half_year_pm_fields = {
	:profile_check  => :string,
	:in_time   => :timestamp,
	:out_time    => :timestamp,
}
generate_form 'TOP', 'HontechHt3600aHandlerMonthlyAndHalfYearPm',
	(hontech_ht3600a_handler_monthly_and_half_year_pm_fields.merge common_fields)
