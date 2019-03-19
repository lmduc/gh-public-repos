class ApplicationController < ActionController::Base
  DEFAULT_PAGE = 1.freeze
  DEFAULT_PER_PAGE = 10.freeze
  MAX_PER_PAGE = 30.freeze

  private

  def page
    (params[:page].presence || DEFAULT_PAGE).to_i
  end

  def per_page
    [
      MAX_PER_PAGE,
      (params[:per_page].presence || DEFAULT_PER_PAGE).to_i
    ].min
  end
end
