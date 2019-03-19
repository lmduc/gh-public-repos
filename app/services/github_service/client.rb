module GithubService
  class Client
    def public_repositories(search: nil)
      Model::Repository.build(
        Api::Repository.search_public(search: search)['items']
      )
    end
  end
end
