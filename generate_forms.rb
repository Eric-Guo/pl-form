#Every field must searchable
#
#Reject Code
#Status Code
#select box
#
#Add reviewed field, if already reviewed, can not change now.
#Also record the reviewer info, review time
#
#Equipment,Container need autocomplete
#
#confirmed by need password confirm
#QA
#User
#Supervisor

# Common Fields
common_fields='create_badge:string create_shift_code:string update_badge:string update_shift_code:string'

# Production Log Fields
production_log_fields='status_code:string device:string lot_no:string reject_code:string remark:string'

# TCM Die Attach Production log sheet DOC#: 3745-01-50001
generate :scaffold, "Die-Attach-Log #{production_log_fields} check_type:string visual_inspection_result:string die_placement_x:float die_placement_y:float die_rotation:float die_tilt:float stack_height:float confirm_by:string #{common_fields}"

# TCM Die Sorter Production log sheet DOC#: 3745-01-50002
generate :scaffold, "Die-Sorter-Log #{production_log_fields} wafer_part_no:string wafer_id:string check_type:string visual_inspection_result:string confirm_by:string #{common_fields}"

# TCM Printing SMT Production log sheet Ref:DOC# 3745-01-10001/3745-01-20001
generate :scaffold, "SMT-Log #{production_log_fields} qty_in:integer qty_out:integer inspection_result:string visual_inspection_after_printing:string solder_thickness:float capacitor_shear_force:float visual_inspection_after_smt confirm_by:string #{common_fields}"
