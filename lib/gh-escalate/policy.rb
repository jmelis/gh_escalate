module GHEscalate
  class Policy
    DAY = 24 * 60 * 60

    def initialize(opts)
      @opts = opts
    end

    # Return true if notification should be sent
    def check(issue)
      check_since(issue[:created_at]) && \
        check_until(issue[:created_at]) && \
        check_last_activity(issue[:updated_at])
    end

    def targets
      @opts[:targets]
    end

    private

    # Return false to skip notification
    def check_since(created_at)
      return true if @opts[:since].nil?

      since_time = created_at + @opts[:since] * DAY

      since_time < Time.now
    end

    # Return false to skip notification
    def check_until(created_at)
      return true if @opts[:until].nil?

      until_time = created_at + @opts[:until] * DAY

      until_time > Time.now
    end

    # Return false to skip notification
    def check_last_activity(updated_at)
      return true if @opts[:last_activity].nil?

      last_activity_time = updated_at + @opts[:last_activity] * DAY

      last_activity_time < Time.now
    end
  end
end
