require 'sequel'
require 'sinatra'

DB = Sequel.sqlite # memory database, requires sqlite3

DB.create_table :items do
  primary_key :id
  String :text
  Integer :count
end

items = DB[:items] # Create a dataset

# Populate the table
items.insert(:text => 'Hello world', :count => 3)

get "/" do
	@message = items.select(:text)[:id => 1][:text] # нормальное хелло из дб.
	"HOLLY SHIT HELLO FROM DB - #{@message}"
end
