require 'spec_helper'

VCR.configure do |config|
  config.cassette_library_dir = "fixtures/vcr_cassettes"
  config.hook_into :webmock
end

RSpec.describe GHEscalate::Policy do
  before(:all) do
    @policy = Policy.new()
  end

  it 'processes' do
    expect(@myvar).to be(:pepe)

    VCR.use_cassette("SEV1") do
      gh_issues = GHEscalate::GHIssues.new("test/test", "mytoken")
      issues = gh_issues.search("SEV1")
      expect(issues.count).to be(1)
    end


  end
end
