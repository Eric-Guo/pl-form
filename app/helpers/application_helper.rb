module ApplicationHelper
  def pl_field(f, field_name)
  	f.input field_name.to_sym
  end
end
