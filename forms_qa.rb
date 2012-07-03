# encoding: UTF-8
module FormsQa
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
generate_form 'FOP_MAT', 'IncomingInspectionReport',
	(qa_incoming_inspection_fields.merge common_fields)
end