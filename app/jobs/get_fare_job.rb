# app/jobs/get_fare_job.rb

class GetFareJob
  include SuckerPunch::Job

  def perform
    ActiveRecord::Base.connection_pool.with_connection do
        if Direction.is_southbound?
            Fare.create_fare("1157") # 395 to end of 95
        elsif Direction.is_northbound?
            Fare.create_fare("1099") # end of 95 to 395
        else
            return
        end
    end
  end
end