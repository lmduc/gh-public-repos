module GithubService
  class Client
    def public_repositories(search:, page:, per_page:)
      Model::Repository.build(
        Api::Repository.search_public(
          search: search,
          page: page,
          per_page: per_page
        )['items']
      )
    end
  end
end
