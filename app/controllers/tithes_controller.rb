class TithesController < ApplicationController
  before_action :set_tithe, only: [:show, :update, :destroy]

  def index
    @tithes = Tithe.paginate(page: params[:page], per_page: 20)
    json_response(@tithes)
  end

  def create
    @tithe = Tithe.create!(tithe_params)
    json_response(@tithe, :created)
  end

  def show
    json_response(@tithe)
  end

  def update
    @tithe.update(tithe_params)
    head :no_content
  end

  def destroy
    @tithe.destroy
    head :no_content
  end

  private

  def tithe_params
    params.require(:tithe).permit(:name, :amount, :tithe_date, :contacts, :member)
  end

  def set_tithe
    @tithe = Tithe.find(params[:id])
  end
end
