require 'octokit'

module GHEscalate
  class IncompleteResultsError < StandardError
  end

  class GHIssues
    def initialize(repo, token)
      @repo = repo
      @token = token
    end

    def client
      @client ||= Octokit::Client.new(:access_token => @token,
                                      :auto_paginate => true)
    end

    def search(label = nil)
      query = "repo:#{@repo} is:issue is:open"
      query += " label:\"#{label}\"" if label

      results = client.search_issues(query)

      raise IncompleteResultsError if results[:incomplete_results]

      results[:items]
    end
  end
end
