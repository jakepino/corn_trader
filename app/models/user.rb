class User < ApplicationRecord
    has_many :bids 
    has_many :offers
    # has_many :trades
    # has_many :users, through: :trades
    has_secure_password 

    validates :email, presence: true
    validates :email, uniqueness: true
    validates :name, presence: true
    validates :password, presence: true, on: :create 
    validates :password, length: { minimum: 6 }, on: :create
    validates :amount_of_corn, presence: true
    validates :amount_of_corn, numericality: { only_integer: true, greater_than: 0},on: :create
    # validates :amount_of_corn, numericality: { greater_than: 0}
    validates :amount_of_money, presence: true
    validates :amount_of_money, numericality: { only_integer: true, greater_than: 0},on: :create
    # validates :amount_of_money, numericality: { greater_than: 0}
end