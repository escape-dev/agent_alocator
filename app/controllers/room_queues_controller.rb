class RoomQueuesController < ApplicationController
  def destroy
    RoomQueue.find_by_id(params[:id])&.destroy

    redirect_to root_path
  end
end
