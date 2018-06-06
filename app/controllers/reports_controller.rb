class ReportsController < ApplicationController
  def index
    @reports = Report.all
  end

  def new
    @report = Report.new
  end

  def create
    report = Report.create(report_params)
    redirect_to report_path(report)
  end

  def show
    @report = Report.find(params[:id])
  end

  private

  def report_params
    params.require(:report).permit(:serial_number, :latitude, :longitude, :file)
  end
end
