require "rubygems"
require "httparty"
require "pry-debugger"
require "./connection"
require "./client"
require "./representation"
require "./representations/election"
require "./representer"

ROUTES = {
  elections: {
    method: "get",
    path: "/elections"
  }
}

connection = Connection.new
connection.query(key: "<YOUR API KEY>")

client   = Client.new(connection: connection, routes: ROUTES)
response = Representation.new(client.elections)

binding.pry