# encoding: UTF-8

# Doc#: 3712-02-00033 QC Package Mark Monitor Sheet
qa_qc_package_mark_monitor_fields = {
	:equipment_no      => :string,
	:device      => :string,
	:status_code      => :string,
	:lot_no	=> :string,
	:positrol_log_monitor => :boolean,
	:Product_visual_monitor  => :boolean,
	:sample_size	=> :string,
	:defect_code_qty    => :integer,
	:ink_mark_permanency_test   => :boolean,
	:peeling_test    => :boolean,
}
qa_qc_package_mark_monitor_detail_fields = {
	:items => ["Demention A","Demention B","Demention C","Demention D","Demention E"],
	:demention=> :float,
}
generate_form 'QA', 'QcPackageMarkMonitor',
	(qa_qc_package_mark_monitor_fields.merge common_fields), qa_qc_package_mark_monitor_detail_fields
