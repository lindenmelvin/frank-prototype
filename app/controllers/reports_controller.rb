class ReportsController < ApplicationController
  def index
    @reports = Report.all
  end

  def new
    @report = Report.new(map_editable: true)
  end

  def create
    address = Address.create(new_address_params)
    report = Report.create(report_params.merge(address: address))
    redirect_to report_path(report)
  end

  def edit
    @report = Report.find(params[:id])
    @report.map_editable = true
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
    @report.map_editable = false
  end

  def destroy
    Report.find(params[:id]).destroy
    redirect_to reports_path
  end

  def generate
    respond_to do |format|
      format.pdf do
        report = Report.find(params[:id])
        form_path = Rails.root.join('app/assets/forms/form.pdf').to_s
        pdf = Prawn::Document.new(template: form_path)
        pdf.draw_text report.serial_number, at: [390,390], size: 12

        send_data pdf.render,
          filename: "report.pdf",
          type: 'application/pdf'
      end
    end
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
