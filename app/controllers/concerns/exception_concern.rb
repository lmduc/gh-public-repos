module ExceptionConcern
  extend ActiveSupport::Concern

  included do
    rescue_from Timeout::Error, with: :render_time_out
    rescue_from ActionController::ParameterMissing, with: :render_missing_params
  end

  private

  def render_time_out
    @error_messages = ['Time out']
    render_current_action
  end

  def render_missing_params(exception)
    @error_messages = ["#{exception.param.to_s.humanize} is missing"]
    render_current_action
  end

  def render_current_action
    render "#{controller_name}/#{action_name}"
  end
end
