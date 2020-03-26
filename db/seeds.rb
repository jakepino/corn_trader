# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Bid.destroy_all
Offer.destroy_all
Trade.destroy_all

Matt = User.create(name:"Matt", amount_of_money:1000,amount_of_corn:100000,password:"123456",password_confirmation:"123456",email:"a@gmail.com",bot:true)

Og = User.create(name:"Og", amount_of_money:1000,amount_of_corn:100000,password:"123456",password_confirmation:"123456",email:"c@gmail.com",bot:true)

Cornelius = User.create(name:"Cornelius", amount_of_money:100000, amount_of_corn:1000000,password:"123456",password_confirmation:"123456",email:"b@gmail.com",bot:true)

Billy  = User.create(name:"Billy", amount_of_money:100000,amount_of_corn:1000000,password:"123456",password_confirmation:"123456",email:"d@gmail.com",bot:true)







B1=Bid.create( price:60, corn_quantity:10,user_id:Og.id )
B2 =Bid.create( price:85, corn_quantity:20,user_id:Matt.id )
B3=Bid.create( price:90, corn_quantity:30,user_id:Matt.id )
B4=Bid.create( price:70, corn_quantity:40,user_id:Og.id )


O1=Offer.create( price:118, corn_quantity:5,user_id:Cornelius.id)
O2=Offer.create( price:130, corn_quantity:50,user_id:Billy.id)
O3=Offer.create( price:110, corn_quantity:100,user_id:Billy.id)
O4=Offer.create( price:115, corn_quantity:20,user_id:Cornelius.id)
O5=Offer.create( price:120, corn_quantity:10,user_id:Billy.id)
O6=Offer.create( price:125, corn_quantity:80,user_id:Billy.id)