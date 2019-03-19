module GithubService
  module Api
    class Repository
      GITHUB_REPOSITORY_SEARCH_URL = "https://api.github.com/search/repositories".freeze

      TIMEOUT = 5.freeze

      def self.search_public(search:, page:, per_page:)
        Timeout::timeout(TIMEOUT) do
          response = HTTParty.get(
            GITHUB_REPOSITORY_SEARCH_URL,
            query: {
              q: search,
              page: page,
              per_page: per_page
            }
          )
          JSON.parse(response.body)
        end
      end
    end
  end
end
