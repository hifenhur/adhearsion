#encoding: utf-8
class User < ActiveRecord::Base
  validates_uniqueness_of :email
  validates_uniqueness_of :user_name, :message => "Este nome de usuário já está em uso"
  validates_presence_of :user_name, :message => "O campo nome de usuário não pode ficar em branco"
  validates_presence_of :email

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  # Setup accessible (or protected) attributes for your model
  
  # attr_accessible :title, :body

  belongs_to :user_info, class_name: 'Client', foreign_key: 'client_id'
  has_one :card, class_name: 'CreditCard', through: :user_info
  has_many :parking_validations, through: :user_info
  has_one :total_amount, through: :user_info
  has_many :transactions, through: :user_info
  has_many :phones, through: :user_info

  accepts_nested_attributes_for :user_info
  accepts_nested_attributes_for :card
   
end
