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
	:item => ["Demention A","Demention B","Demention C","Demention D","Demention E"],
	:demention=> :float,
}
generate_form 'QA', 'QcPackageMarkMonitor',
	(qa_qc_package_mark_monitor_fields.merge common_fields), qa_qc_package_mark_monitor_detail_fields


# Doc#: 3712-02-00034 QC Laser Cut Monitor Sheet
qa_qc_laser_cut_monitor_fields = {
	:equipment_no      => :string,
	:device      => :string,
	:status_code      => :string,
	:lot_no	=> :string,
	:positrol_log_monitor => :boolean,
	:sample_size	=> :string,
	:monitor_result => :boolean,
	:defect_code => :string,
	:defect_qty => :integer,
	:remark => :string,
}
qa_qc_laser_cut_monitor_detail_fields = {
	:item => ["Demention A","Demention B","Demention C","Demention D","Demention E"],
	:demention => :float,
}
generate_form 'QA', 'QcLaserCutMonitor',
	(qa_qc_laser_cut_monitor_fields.merge common_fields), qa_qc_laser_cut_monitor_detail_fields


# Doc#: 3712-02-00042 QC Laser Sweeping Monitor Sheet
qa_qc_laser_sweeping_monitor_fields = {
	:equipment_no      => :string,
	:device      => :string,
	:status_code      => :string,
	:lot_no	=> :string,
	:positrol_log_monitor => :boolean,
	:monitor_result => :boolean,
	:defect_code => :string,
	:programme_monitor  => :boolean,
	:sample_size	=> :string,
	:monitor_result => :boolean,
	:defect_code => :string,
	:defect_qty => :integer,
}
generate_form 'QA', 'QcLaserSweepingMonitor',
	(qa_qc_laser_sweeping_monitor_fields.merge common_fields)


# Doc#: 3712-02-00034 QC Saw Singulation Monitor Sheet
qa_qc_saw_singulation_monitor_fields = {
	:equipment_no      => :string,
	:device      => :string,
	:status_code      => :string,
	:lot_no	=> :string,
	:positrol_log_monitor => :boolean,
	:sample_size	=> :string,
	:monitor_result => :boolean,
	:defect_code => :string,
	:defect_qty => :integer,
}
generate_form 'QA', 'QcSawSingulationMonitor',
	(qa_qc_saw_singulation_monitor_fields.merge common_fields)


# Doc#: 3712-02-00130 QC Osp Product Monitor Sheet
qa_qc_osp_product_monitor_fields = {
	:lot_no	=> :string,
	:equipment_no      => :string,
    :device      => :string,
    :wetting_fail_ball_qty_test_ball_qty_wetting   => :string,
    :imc_fail_ball_qty_test_ball_qty_imc   => :string,
    :monitor_result => :boolean,
    :qdn_no	=> :string,
}
generate_form 'QA', 'QcOspProductMonitor',
	(qa_qc_osp_product_monitor_fields.merge common_fields)


# Doc#: 1111-02-20005 QC T-Scan Monitor Sheet
qa_qc_t_scan_monitor_fields = {
	:equipment_no      => :string,
	:device      => :string,
	:lot_no	=> :string,
	:sample_size	=> :string,
    :monitor_result => :boolean,
    :defect_strip_no  => :string,
    :defect_qty => :integer,
    :remark => :string,
}
generate_form 'QA', 'QcT-ScanMonitor',
	(qa_qc_t_scan_monitor_fields.merge common_fields)


# Doc#: 3712-01-00002 KGD QC Line Monitor Working Record
qa_qc_kgd_line_monitor_fields = {
	:equipment_no      => :string,
	:part_no   => :string,
	:work_status  => :string,
	:lot_no	=> :string,
	:defect_qty => :integer,
	:defect_description   => :string,
	:wafer_id   => :string,
	:monitor_data   => :string,
	:result => :boolean,
    :qdn_no_remark_qdn  => :string,
    }
generate_form 'QA', 'KgdQcLineMonitor',
	(qa_qc_kgd_line_monitor_fields.merge common_fields)


# Doc#: 3712-02-00038 QC Labeling Monitor Sheet
qa_qc_labeling_monitor_fields = {
	:equipment_no      => :string,
	:part_no     => :string,
	:lot_no	  => :string,
	:lot_qty => :integer,
	:sample_size	=> :string,
	:defect_qty => :integer,
	:defect_code => :string,
	:qty  => :integer,
	:qty  	=> :integer,
	:result => :boolean,
	:qdn_no_remark_qdn  => :string,
}
generate_form 'QA', 'QcLabelingMonitor',
	(qa_qc_labeling_monitor_fields.merge common_fields)


# Doc#: 3712-02-00184 QC Retail Fulfillment Fvi Record
qa_qc_retail_fulfillment_monitor_fields = {
	:part_no   => :string,
	:lot_no	  => :string,
	:lot_size   => :string,
	:sample_size	=> :string,
	:defect_qty => :integer,
	:defect_description_and_quantity    => :string,
	:result => :boolean,
	:qdn_no_remark_qdn  => :string,
}
generate_form 'QA', 'QcRetailFulfillmentMonitor',
	(qa_qc_retail_fulfillment_monitor_fields.merge common_fields)


# Doc#: 3712-02-00214 QC Retail Fulfillment shipping QA Record
qa_qc_retail_fulfillment_shipping_monitor_fields = {
	:po_no   => :string,
	:delivery_no  => :string,
	:ship_box_qty   => :integer,
	:sampled_box_qty => :integer,
	:hu_no    => :boolean,
	:ship_to_address   => :boolean,
	:result => :boolean,
	:qdn_no_remark_qdn  => :string,
}
generate_form 'QA', 'QcRetailFulfillmentShippingMonitor',
	(qa_qc_retail_fulfillment_shipping_monitor_fields.merge common_fields)










