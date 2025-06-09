class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_available_agent
  before_action :set_next_room

  def custom_agent_allocation
    room_id = params[:room_id]

    if @available_agent
      assign_agent(room_id)
      base_api_response(message: "agent is successfully assigned")
    else
      queue_room(room_id)
      base_api_response(status: "queued", messsage: "no available agent, added to queue")
    end
  end

  def mark_as_resolved
    if @next_room && @available_agent
      assign_queued_room
    end

    base_api_response(message: "agent assignment attempt completed")
  end

  private

  def set_available_agent
    @available_agent = Agent.find_available
  end

  def set_next_room
    @next_room = RoomQueue.first
  end

  def queue_room(room_id)
    RoomQueue.create(room_id: room_id)

    Rails.logger.info("No available agent. Room #{room_id} added to queue.")
  end

  def assign_agent(room_id)
    ApiClient.assign_agent(room_id: room_id, agent_id: @available_agent["id"])

    Rails.logger.info("Assign room #{room_id} to agent #{@available_agent["id"]}")
  end

  def assign_queued_room
    ApiClient.assign_agent(room_id: @next_room.room_id, agent_id: @available_agent["id"])

    Rails.logger.info("Assigned queued room #{@next_room.room_id} to agent #{@available_agent["id"]}")

    @next_room.destroy
  end
end
