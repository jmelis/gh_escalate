module GHEscalate
  class GHEscalate::ProviderEmail
    def initialize(email)
      @email = email
    end

    def notify(msg)
      puts "ProviderEmail - #{@email} - #{msg}"
    end
  end
end
