

def market_conditions 
    bids= Bid.all 
    offers= Offer.all 
    bots = User.all.select{|user| user.bot == true}

    bots.each do ||bot 
end 