class Disponible < ActiveRecord::Base
  belongs_to :producto 
  belongs_to :establecimiento
end
