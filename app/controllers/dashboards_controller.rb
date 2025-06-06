class DashboardsController < ApplicationController
  def index
    @available_agents = Agent.available_agents
    @room_queues = RoomQueue.order(created_at: :desc)
  end
end
