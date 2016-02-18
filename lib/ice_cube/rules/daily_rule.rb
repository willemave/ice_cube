module IceCube

  class DailyRule < ValidatedRule

    include Validations::DailyInterval

    def initialize(interval = 1, week_start = :sunday)
      super
      interval(interval)
      schedule_lock(:hour, :min, :sec)
      reset
    end

    def start_of_period(time)
      Time.new(time.year, time.month, time.day, 0, time.min, time.sec, time.utc_offset)
    end

  end

end
