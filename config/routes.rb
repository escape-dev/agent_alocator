Rails.application.routes.draw do
  scope :webhook do
    get "/custom_agent_allocation", to: "webhooks#custom_agent_allocation"
  end
end
