Rails.application.routes.draw do
  root to: "dashboards#index"

  scope :webhook do
    post "/custom_agent_allocation", to: "webhooks#custom_agent_allocation"
    post "/mark_as_resolved", to: "webhooks#mark_as_resolved"
  end
end
