module IceCube

  class HourlyRule < ValidatedRule

    include Validations::HourlyInterval

    def initialize(interval = 1, week_start = :sunday)
      super
      interval(interval)
      schedule_lock(:min, :sec)
      reset
    end

    def start_of_period(time)
      Time.new(time.year, time.month, time.day, time.hour, 0, time.sec, time.utc_offset)
    end

  end

end
