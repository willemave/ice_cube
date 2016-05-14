module IceCube

  class MonthlyRule < ValidatedRule

    include Validations::MonthlyInterval

    def initialize(interval = 1, week_start = :sunday)
      super
      interval(interval)
      schedule_lock(:day, :hour, :min, :sec)
      reset
    end

    def start_of_period(time)
      Time.new(time.year, time.month, 1, 0, 0, 0, time.utc_offset)
    end

  end

end
