module GithubService
  module Api
    class Repository
      TIMEOUT = 5.freeze

      def self.search_public(search: nil)
        Timeout::timeout(TIMEOUT) do
          response = HTTParty.get(
            "https://api.github.com/search/repositories?q=#{search}"
          )
          JSON.parse(response.body)
        end
      end
    end
  end
end
