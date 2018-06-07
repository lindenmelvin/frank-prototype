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

  def edit
    @report = Report.find(params[:id])
  end

  def update
    report = Report.find(params[:id])
    report.update_attributes(report_params)
    redirect_to report_path(report)
  end

  def show
    @report = Report.find(params[:id])
  end

  private

  def report_params
    params.require(:report).permit(*Report::FIELDS.map { |field| field[:name] })
  end
end
