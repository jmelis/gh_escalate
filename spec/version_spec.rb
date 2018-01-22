require 'spec_helper'

RSpec.describe "Version" do
  it 'has a version number' do
    expect(GHEscalate::VERSION).not_to be nil
  end
end
