class WebhooksController < ApplicationController
  def custom_agent_allocation
    room_id = params[:room_id]

    available_agent = Agent.find_available

    if available_agent
      ApiClient.assign_agent(room_id: room_id, agent_id: available_agent[:id])
      render json: { status: "success", agent: available_agent }, status: :ok
    else
      render json: { status: "error", message: "No available agents" }, status: :service_unavailable
    end
  end
end
