class Agent
  MAX_CUSTOMERS_PER_AGENTS = Master.first&.max_customer_per_agent || 2

  def self.find_available
    agents = ApiClient.get_available_agents
    agents
      .select { |agent| agent[:current_customer_count] < MAX_CUSTOMERS_PER_AGENTS }
      .min_by { |agent| agent[:current_customer_count] }
  end
end
