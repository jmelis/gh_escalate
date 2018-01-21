module GHEscalate
  class Notifier
    def initialize(targets)
      @targets = targets
    end

    def notify(target, msg)
      @targets[target].each do |t|
        type = t[:provider]
        args = t[:args]

        provider = Provider.get(type).new(args)
        provider.notify(msg)
      end
    end
  end
end
