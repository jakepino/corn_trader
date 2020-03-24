# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Matt = User.create(name:"Matt", amount_of_money:1000,amount_of_corn:0,password:"1")

Og = User.create(name:"Og", amount_of_money:1000,amount_of_corn:0,password:"1")

Cornelius = User.create(name:"Cornelius", amount_of_money:0, amount_of_corn:1000000, password:"1")

Billy  = User.create(name:"Billy", amount_of_money:0,amount_of_corn:1000000,password:"1")

T1 = Trade.create(buyer_id:Og.id ,seller_id:Billy.id,price:10,corn_quantity:100)
T2 =  Trade.create(buyer_id:Og.id ,seller_id:Billy.id,price:50,corn_quantity:300)
T3 =  Trade.create(buyer_id:Matt.id ,seller_id:Billy.id,price:10,corn_quantity:20)
T4 =  Trade.create(buyer_id:Og.id ,seller_id:Billy.id,price:800,corn_quantity:300)
T5 =  Trade.create(buyer_id:Og.id ,seller_id:Billy.id,price:500,corn_quantity:200)


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