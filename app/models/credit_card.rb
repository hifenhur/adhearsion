#encoding: utf-8
class CreditCard < ActiveRecord::Base
  

  belongs_to :client, class_name: 'UserInfo', foreign_key: 'id_client'
end
