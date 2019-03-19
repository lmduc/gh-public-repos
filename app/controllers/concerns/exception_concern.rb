module ExceptionConcern
  extend ActiveSupport::Concern

  included do
    rescue_from Timeout::Error, with: :render_time_out
    rescue_from ActionController::ParameterMissing, with: :render_missing_params
    rescue_from GithubService::Api::FailedToFetch, with: :render_failed_to_fetch
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

  def render_failed_to_fetch
    @error_messages = ['Failed to fetch. Please try again later']
    render_current_action
  end

  def render_current_action
    render "#{controller_name}/#{action_name}"
  end
end
