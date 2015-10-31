class Region < ActiveRecord::Base
  self.table_name = 'regiones'
  has_many :distritos
end
