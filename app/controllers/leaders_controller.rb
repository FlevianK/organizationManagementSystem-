class LeadersController < ApplicationController
  before_action :set_member
  before_action :set_member_leader, only: [:show, :update, :destroy]

  def index
    json_response(@member.leaders)
  end

  def show
    json_response(@leader)
  end

  def create
    @member.leaders.create!(leader_params)
    json_response(@member, :created)
  end

  def update
    @leader.update(leader_params)
    head :no_content
  end

  def destroy
    @leader.destroy
    head :no_content
  end

  private

  def leader_params
    params.require(:leader).permit(:title, :department)
  end

  def set_member
    @member = Member.find(params[:member_id])
  end

  def set_member_leader
    @leader = @member.leaders.find_by!(id: params[:id]) if @member
  end
end
