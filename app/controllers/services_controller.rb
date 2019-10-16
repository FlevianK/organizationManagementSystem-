class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :update, :destroy]

  def index
    @services = Service.paginate(page: params[:page], per_page: 20)
    json_response(@services)
  end

  def create
    @service = Service.create!(service_params)
    json_response(@service, :created)
  end

  def show
    json_response(@service)
  end

  def update
    @service.update(service_params)
    head :no_content
  end

  def destroy
    @service.destroy
    head :no_content
  end

  private

  def service_params
    params.require(:service).permit(:service_date, :total_new_converts, :total_attendants, :sunday_school_teachers)
  end

  def set_service
    @service = Service.find(params[:id])
  end
end
