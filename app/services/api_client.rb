class ApiClient
  def self.get_available_agents
    response = get("/api/v2/admin/agents")
    agents = response.dig("data", "agents") || []

    agents.select { |agent| agent["is_available"] && !agent["force_offline"] }
      .map do |agent|
        {
          id: agent["id"],
          email: agent["email"],
          name: agent["name"],
          current_customer_count: agent["current_customer_count"]
        }
      end
  end

  def self.assign_agent(room_id:, agent_id:)
    post("/api/v1/admin/service/assign_agent", {
      room_id: room_id,
      agent_id: agent_id
    })
  end

  def self.get_all_channels
    get("/api/v2/channels")
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
