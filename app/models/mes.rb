class Mes < ActiveRecord::Base
  # No corresponding table in the DB.
  self.abstract_class = true
  establish_connection("typeahead")
end