<div class="row">
   <div class="col-md-12">
      <h3 class="events text-center">Welcome to your Corn Trader Profile Page, <%= @current_user.name.capitalize %></h3>
   </div>
</div>

<div class="row">
   <div class="col-md-12 text-right">
<% if @current_user %>
 Logged in as <%= @current_user.email %> <br>
  <%= link_to "Delete Account", user_path(@current_user.id), method: :delete, data: {confirm: "Are you sure?"}, :class => "btn btn-danger btn-sm" %>
<% end %>
</div>
   </div>

<div class="card">
  <div class="card-body">
  <h5 class="card-header text-center">Current Offers</h5  
  </div>
  <%if @offers.length>0 %>
  <table class="table table-hover">
  <thead class="thead-light">
    <tr>
        <th scope="col">#</th>
        <th scope="col">Price in $</th>
        <th scope="col">Quantity</th>
    </tr>
 </thead>
    <tbody>
      <%@offers.to_enum.with_index.reverse_each do |offer,i|%>
            <tr>
                <td><%= i+1 %></td>
                <td><%= offer.price %></td>
                <td><%= offer.corn_quantity%></td>
            </tr>
            <% end %>
    <%else%>
       <h1>PRAY TO GOD FOR MORE CORN</h1> 
 <%end%>
    </tbody>
</table>
</div>

<div class="card">
  <div class="card-body">
  <h5 class="card-header text-center">Current Bids</h5  
  </div>
<%if @bids.length>0 %>
<table class="table table-hover">
 <thead class="thead-light">
    <tr>
        <th scope="col">#</th>
        <th scope="col">Price in $</th>
        <th scope="col">Quantity</th>
    </tr>
 </thead>
    <tbody>
      <%@bids.to_enum.with_index.reverse_each do |bid,i|%>
            <tr>
                <td><%= i+1 %></td>
                <td><%= bid.price %></td>
                <td><%= bid.corn_quantity%></td>
            </tr>
            <% end %>
    <%else%>
       <h1>NO ONE WANTS TO BUY YOUR PATHETIC CORN</h1> 
<%end%>
   </tbody>
</table>
</div>
<div class="card text-center">
    <div class="card-body">
<%if @bids.length>0%>
<%= button_to 'Market Sell', {:controller => "trades",:action=>"market_sell",:user_id=>@user.id,:bid_id=> @bids[0].id}, method: :post, :class => "btn btn-primary btn" %> 
<%end%>
<br>
<%if @offers.length>0%>
 <%= button_to 'Market Buy', {:controller => "trades",:action=>"market_buy",:user_id=>@user.id,:offer_id=> @offers[0].id}, method: :post, :class => "btn btn-primary btn" %>
<%end%>
  </div>
</div>

<div class="card">
  <div class="card-body">
  <h5 class="card-header text-center">Account Status</h5>
  <h3>your corn total is: <%=@user.amount_of_corn%></h3>
  <h3>your cash balance is: $<%=@user.amount_of_money%></h3>
  <li>Your total number of trades is <%= @current_user.total_trades %></li>
  <li>Your total money traded is $<%= @current_user.total_money %></li>
  <li>Your total corn traded is <%= @current_user.total_corn %></li>
  <% if !@current_user.bids.empty? %>
    <li>Your average Bid is <%= @current_user.ave_bid %></li>
  <% end %>
  <% if !@current_user.offers.empty? %>
    <li>Your average Offer is <%= @current_user.ave_offer %></li>
  <% end %>
</ul>
  </div>
</div>

<%=form_for @bid do |f| %>
price <%=f.number_field :price%>
quantity<%=f.number_field :corn_quantity%>
<%= f.hidden_field :user_id, value: @user.id%>
<%=f.submit "Submit Bid", class: "btn btn-success btn-sm"%>
<%end%>

<%=form_for @offer do |f| %>
price <%=f.number_field :price%>
quantity<%=f.number_field :corn_quantity%>
<%= f.hidden_field :user_id, value: @user.id%>
<%=f.submit "Submit Offer", class: "btn btn-success btn-sm"%>
<%end%>

<div class="card">
  <div class="card-body">
  <h5 class="card-header text-center">Current Submitted Bids</h5  
  </div>
<%if @user.bids%>
  <table class="table table-hover">
  <thead class="thead-light">
    <tr>
        <th scope="col">Price in $</th>
        <th scope="col">Quantity</th>
        <th scope="col"></th>
    </tr>
 </thead>
    <tbody>
      <% @user.bids.each do |bid|%>
            <tr>
                <td><%= bid.price %></td>
                <td><%= bid.corn_quantity%></td>
                <td><%= button_to "Delete bid",{:controller => "bids",:action=>"destroy_bid",:id=> bid.id,:user_id=>@user.id}, method: :post, data: { confirm: "Really?" }, :class => "btn btn-danger btn-sm" %></td>
            </tr>
            <% end %>
 <%end%>
    </tbody>
</table>
</div>

<div class="card">
  <div class="card-body">
  <h5 class="card-header text-center">Current Submitted Offers</h5  
  </div>
<%if @user.offers%>
  <table class="table table-hover">
  <thead class="thead-light">
    <tr>
        <th scope="col">Price in $</th>
        <th scope="col">Quantity</th>
        <th scope="col"></th>
    </tr>
 </thead>
    <tbody>
      <% @user.offers.each do |offer|%>
            <tr>
                <td><%= offer.price %></td>
                <td><%= offer.corn_quantity%></td>
                <td><%= button_to "Delete Offer",{:controller => "offers",:action=>"destroy_offer",:id=> offer.id,:user_id=>@user.id}, method: :post, data: { confirm: "Really?" }, :class => "btn btn-danger btn-sm" %></td>
            </tr>
            <% end %>
 <%end%>
    </tbody>
</table>
</div>