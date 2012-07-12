# encoding: UTF-8

# DOC#: F1206-0002 incoming inspection report
qa_incoming_inspection_fields = {
	:part_no      => :string,
	:material_description      => :string,
	:po_no	=> :string,
	:supplier_lot_no => :string,
	:material_spec      => :string,
	:receiving_date	=> :date,
	:supplier => :string,
	:iqa_inspection_date => :date,
	:receiving_quantity => :integer,
}
qa_incoming_inspection_detail_fields = {
	:row_count => 7,
	:item => :string,
	:spec => :string,
	:data_type => :string,
	:data1 => :float,
	:data2 => :float,
	:data3 => :float,
	:data4 => :float,
	:data5 => :float,
	:accept_or_ng => :boolean,
	:remark => :string,
}
generate_form 'QA', 'IncomingInspectionReport',
	(qa_incoming_inspection_fields.merge common_fields), qa_incoming_inspection_detail_fields

# Doc#: 3712-02-00034 QC Laser cut   Monitor Sheet
qa_qc_laser_cut_monitor_fields = {
	:equipment_no      => :string,
	:device      => :string,
	:lot_no	=> :string,
	:positrol_log_monitor => :boolean,
	:status_code      => :string,
	:sample_size	=> :string,
	:monitor_result => :boolean,
	:defect_code => :string,
	:defect_qty => :integer,
	:remark => :string,
}
qa_qc_laser_cut_monitor_detail_fields = {
	:item => ["Demention A","Demention B","Demention C","Demention D","Demention E"],
	:demention_mm => :float,
	:demention_mm => :float,
	:demention_mm => :float,
	:demention_mm => :float,
	:demention_mm => :float,
}
generate_form 'QA', 'QcLaserCutMonitor',
	(qa_qc_laser_cut_monitor_fields.merge common_fields), qa_qc_laser_cut_monitor_detail_fields
