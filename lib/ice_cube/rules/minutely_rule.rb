module IceCube

  class MinutelyRule < ValidatedRule

    include Validations::MinutelyInterval

    def initialize(interval = 1, week_start = :sunday)
      super
      interval(interval)
      schedule_lock(:sec)
      reset
    end

    def start_of_period(time)
      Time.new(time.year, time.month, time.day, time.hour, time.min, 0, time.utc_offset)
    end

  end

end
