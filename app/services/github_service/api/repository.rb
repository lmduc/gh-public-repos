module GithubService
  module Api
    class Repository
      TIMEOUT = 5.freeze

      def self.search_public(search:, page:, per_page:)
        Timeout::timeout(TIMEOUT) do
          response = HTTParty.get(
            "https://api.github.com/search/repositories",
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
