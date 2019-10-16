class MembersController < ApplicationController
  before_action :set_member, only: [:show, :update, :destroy]

  def index
    @members = Member.paginate(page: params[:page], per_page: 20)
    json_response(@members)
  end

  def create
    @member = Member.create!(member_params)
    json_response(@member, :created)
  end

  def show
    json_response(@member)
  end

  def update
    @member.update(member_params)
    head :no_content
  end

  def destroy
    @member.destroy
    head :no_content
  end

  private

  def member_params
    params.require(:member).permit(:name, :contacts, :residence, :join_date, :born_again, :spirit_filled, :departments)
  end

  def set_member
    @member = Member.find(params[:id])
  end
end
