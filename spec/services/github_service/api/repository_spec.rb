require 'rails_helper'

describe GithubService::Api::Repository, :vcr do
  describe '.search_public' do
    context 'fetch successfully' do
      let(:search_term) { 'search' }
      let(:page) { 1 }
      let(:per_page) { 2 }

      it 'returns list of repositories in JSON format' do
        resp = GithubService::Api::Repository.search_public(
          search: search_term,
          page: page,
          per_page: per_page
        )
        expect(resp['items'].count).to eq(2)
      end
    end

    context 'fetch failed' do
      let(:search_term) { nil }
      let(:page) { 1 }
      let(:per_page) { 2 }

      it 'raise exception' do
        expect {
          GithubService::Api::Repository.search_public(
            search: search_term,
            page: page,
            per_page: per_page
          )
        }.to raise_error(GithubService::Api::FailedToFetch)
      end
    end
  end
end
