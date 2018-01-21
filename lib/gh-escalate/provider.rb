module GHEscalate
  class UnknownProviderError < StandardError
  end

  class Provider
    def self.get(type)
      case type
      when :email
        return ProviderEmail
      else
        raise UnknownProviderError
      end
    end
  end
end
