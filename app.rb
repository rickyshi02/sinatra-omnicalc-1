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
  @apr = (params.fetch("user_apr").to_f)/100
  @years = params.fetch("user_years").to_i
  @pv=params.fetch("user_pv").to_f
  @payment=(@apr*@pv)/((1-(1+@apr))**(-@years))
  @form = [["APR", "#{@apr*100}%"], ["Number of years", @years], ["Principal", "$#{@pv}"], ["Payment", "$#{@payment}"]]
  erb(:flexible)
end
