class ApiClient
  QISCUS_BASE_URL = ENV["QISCUS_BASE_URL"]
  QISCUS_ADMIN_TOKEN = ENV["QISCUS_ADMIN_TOKEN"]

  def self.get_available_agents
    get("/admin/agents/available")
  end

  private

  def self.headers
    {
      "Content-Type" => "application/json",
      "Authorization" => QISCUS_ADMIN_TOKEN
    }
  end

  def self.get(path)
    response = Faraday.get("#{QISCUS_BASE_URL}#{path}", nil, headers)
    JSON.parse(response.body)
  end

  def self.post(path, payload)
    response = Faraday.post("#{QISCUS_BASE_URL}#{path}", payload.to_json, headers)
    JSON.parse(response.body)
  end
end
