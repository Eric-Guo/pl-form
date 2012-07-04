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
generate_form 'FOP_MAT', 'IncomingInspectionReport',
	(qa_incoming_inspection_fields.merge common_fields), qa_incoming_inspection_detail_fields
