module GithubService
  module Model
    class Repository
      def self.build(repositories)
        repositories.map { |r| new(r) }
      rescue
        []
      end

      attr_reader :id, :full_name, :html_url, :data

      def initialize(data)
        @id        = data['id']
        @full_name = data['full_name']
        @html_url  = data['html_url']
        @data      = data
      end
    end
  end
end
