module GithubService
  module Api
    class Repository
      GITHUB_REPOSITORY_SEARCH_URL = "https://api.github.com/search/repositories".freeze

      TIMEOUT = 5.freeze

      def self.search_public(search:, page:, per_page:)
        response = Timeout::timeout(TIMEOUT) do
          HTTParty.get(
            GITHUB_REPOSITORY_SEARCH_URL,
            query: {
              q: search,
              page: page,
              per_page: per_page
            }
          )
        end
        if response.success?
          JSON.parse(response.body)
        else
          raise GithubService::Api::FailedToFetch
        end
      end
    end
  end
end
