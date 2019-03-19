class RepositoriesController < ApplicationController
  def public
    if request.post?
      @repositories = github_client.public_repositories(
        search: search_term_param,
        page: page,
        per_page: per_page
      )
      @search_term = search_term_param
      @page = page
      @per_page = per_page
    elsif request.get?
      @repositories = []
    end
  end

  private

  def github_client
    @github_client ||= GithubService::Client.new
  end

  def search_term_param
    params.require(:search_term)
  end
end
