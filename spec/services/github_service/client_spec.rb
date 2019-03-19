require 'rails_helper'

describe GithubService::Client, :vcr do
  describe '#public_repositories' do
    let(:search_term) { 'search' }
    let(:page) { 1 }
    let(:per_page) { 2 }

    it 'returns list of repositories' do
      repositories = GithubService::Client.new.public_repositories(
        search: search_term,
        page: page,
        per_page: per_page
      )
      expect(repositories.count).to eq(2)
      repositories.each do |repository|
        [:id, :full_name, :html_url, :data].each do |attr|
          expect(repository.send(attr)).to be_present
        end
      end
    end
  end
end
