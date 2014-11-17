class Client

  def initialize(options={})
    @connection = options.fetch(:connection)
    @routes     = options.fetch(:routes)
  end

  def method_missing(method, *request_arguments)

    # retrieve the route map
    route_map = routes.fetch(method)

    # make request via the connection
    response_from_route(route_map, request_arguments)
  end

  private

  attr_reader :connection, :routes

  def response_from_route(route_map, request_arguments)

    # gather the routes required parameters
    http_method   = route_map.fetch(:method)
    relative_path = route_map.fetch(:path)

    # call the connection for records
    connection.send(http_method, relative_path, *request_arguments)
  end
end