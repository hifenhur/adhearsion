class Phone < ActiveRecord::Base
  self.table_name = "phone"
  belongs_to :client, foreign_key: 'id_client'
  
end
