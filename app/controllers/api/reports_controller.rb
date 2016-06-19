class Api::ReportsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    Report.create(report_params)
  end

  private
  def report_params
    params.permit(:user_id, :report_type, :blog_id)
  end
end
