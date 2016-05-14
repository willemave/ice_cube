module IceCube

  class WeeklyRule < ValidatedRule

    include Validations::WeeklyInterval

    attr_reader :week_start

    def initialize(interval = 1, week_start = :sunday)
      super
      interval(interval, week_start)
      schedule_lock(:wday, :hour, :min, :sec)
      @week_start = week_start
      reset
    end

    def start_of_period(time)
      until time.send("#{week_start}?")
        time -= ONE_DAY
      end
      Time.new(time.year, time.month, time.day, 0, 0, 0, time.utc_offset)
    end

  end

end
