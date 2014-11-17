class Connection
  include HTTParty

  DEFAULT_API_VERSION = "2"
  DEFAULT_BASE_URI    = "https://www.googleapis.com/civicinfo"
  DEFAULT_QUERY       = {}

  base_uri DEFAULT_BASE_URI

  def initialize(options={})
    @api_version = options.fetch(:api_version, DEFAULT_API_VERSION)
    @query       = options.fetch(:query, DEFAULT_QUERY)
    @connection  = self.class
  end

  def query(params={})
    @query.update(params)
  end

  def get(relative_path, query={})
    relative_path = add_api_version(relative_path)
    connection.get relative_path, query: @query.merge(query)
  end

  private

  attr_reader :connection

  def add_api_version(relative_path)
    "/#{api_version_path}#{relative_path}"
  end

  def api_version_path
    "v" + @api_version.to_s
  end
end
