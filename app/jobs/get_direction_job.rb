# app/jobs/get_direction_job.rb

class GetDirectionJob
  include SuckerPunch::Job

  def perform
    ActiveRecord::Base.connection_pool.with_connection do
        Direction.create_current
        GetFareJob.perform_async
    end
  end
end