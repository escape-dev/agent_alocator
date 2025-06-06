class ApiClient
  def self.get_agents
    response = get("/api/v2/admin/agents")
    response.dig("data", "agents") || []
  end

  def self.assign_agent(room_id:, agent_id:)
    post("/api/v1/admin/service/assign_agent", {
      room_id: room_id,
      agent_id: agent_id
    })
  end

  private

  def self.headers
    {
      "Content-Type" => "application/json",
      "Qiscus-App-Id" => QISCUS_APP_ID,
      "Qiscus-Secret-Key" => QISCUS_SECRET_KEY
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
