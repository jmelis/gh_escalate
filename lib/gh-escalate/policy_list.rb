require 'forwardable'

module GHEscalate
  class PolicyList
    extend Forwardable

    def_delegators :@policies, :each

    def initialize(policies)
      @policies = {}
      policies.each do |label, pols|
        @policies[label] = pols.collect { |pol| Policy.new(pol) }
      end
    end
  end
end
