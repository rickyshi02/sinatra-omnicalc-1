require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:square_form)
end

get("/square/new") do
  erb(:square_form)
end

get("/square/results") do
  @number = params.fetch("number").to_f
  @square = @number**2
  @form = [["Number", @number], ["Square", @square]]
  erb(:flexible)
end

get("/square_root/new") do
  erb(:square_root_form)
end

get("/square_root/results") do
  @number = params.fetch("number").to_f
  @sqrt = Math.sqrt(@number)
  @form = [["Number", @number], ["Square Root", @sqrt]]
  erb(:flexible)
end

get("/payment/new") do
  erb(:payment_form)
end

get("/payment/results") do
  @apr = params.fetch("user_apr").to_f
  @rate = @apr/100/12
  @years = params.fetch("user_years").to_i
  @pv=params.fetch("user_pv").to_f
  @payment=((@rate*@pv)/(1-(1+@rate)**(-@years*12))).to_fs(:currency)
  @form = [["APR", @apr.to_fs(:percentage, { :precision => 4 } )], ["Number of years", @years], ["Principal", @pv.to_fs(:currency)], ["Payment", @payment]]
  erb(:flexible)
end

get("/random/new") do
  erb(:random_form)
end

get("/random/results") do
  @min = params.fetch("user_min").to_f
  @max = params.fetch("user_max").to_f
  @random= Random.rand(@min..@max)
  @form = [["Minimum", @min], ["Maximum", @max], ["Random", @random]]
  erb(:flexible)
end
