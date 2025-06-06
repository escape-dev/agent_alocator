class Agent
  MAX_CUSTOMERS_PER_AGENTS = Master.first&.max_customer_per_agent || 2

  def self.available_agents
    agents = ApiClient.get_agents
    agents.select { |agent| available?(agent) }
  end

  def self.find_available
    available_agents.min_by { |agent| agent["current_customer_count"] }
  end

  private

  def self.available?(agent)
    !agent["force_offline"] &&
    agent["is_available"] &&
    agent["current_customer_count"] < MAX_CUSTOMERS_PER_AGENTS
  end
end
