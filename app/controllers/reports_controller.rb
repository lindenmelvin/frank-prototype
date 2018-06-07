class ReportsController < ApplicationController
  def index
    @reports = Report.all
  end

  def new
    @report = Report.new
  end

  def create
    address = Address.create(new_address_params)
    report = Report.create(report_params.merge(address: address))
    redirect_to report_path(report)
  end

  def edit
    @report = Report.find(params[:id])
  end

  def update
    report = Report.find(params[:id])
    address = report.address
    address.update_attributes(update_address_params)
    report.update_attributes(report_params)
    redirect_to report_path(report)
  end

  def show
    @report = Report.find(params[:id])
  end

  def destroy
    Report.find(params[:id]).destroy
    redirect_to reports_path
  end

  private

  def update_address_params
    params.require(:address).permit(
      *Address::FIELDS.map { |field| field[:name] }
    )
  end

  def new_address_params
    params.permit(
      *Address::FIELDS.map { |field| field[:name] }
    )
  end

  def report_params
    params.require(:report).permit(
      *Report::FIELDS.map { |field| field[:name] }
    )
  end
end
