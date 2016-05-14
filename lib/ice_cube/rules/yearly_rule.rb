module IceCube

  class YearlyRule < ValidatedRule

    include Validations::YearlyInterval

    def initialize(interval = 1, week_start = :sunday)
      super
      interval(interval)
      schedule_lock(:month, :day, :hour, :min, :sec)
      reset
    end

    def start_of_period(time)
      Time.new(time.year, 1, 1, 0, 0, 0, time.utc_offset)
    end

  end

end
