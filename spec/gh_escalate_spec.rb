require 'spec_helper'

VCR.configure do |config|
  config.cassette_library_dir = "fixtures/vcr_cassettes"
  config.hook_into :webmock
end

RSpec.describe GHEscalate::GHIssues do
  it 'finds one sev1 issue' do
    VCR.use_cassette("SEV1") do
      gh_issues = GHEscalate::GHIssues.new("test/test", "mytoken")
      issues = gh_issues.search("SEV1")
      expect(issues.count).to be(1)
    end
  end

  it 'finds no issues with random label' do
    VCR.use_cassette("BLAST") do
      gh_issues = GHEscalate::GHIssues.new("test/test", "mytoken")
      issues = gh_issues.search("BLAST")
      expect(issues.count).to be(0)
    end
  end
end
