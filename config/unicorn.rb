# config/unicorn.rb
worker_processes Integer(ENV["WEB_CONCURRENCY"] || 5)
timeout 30
preload_app true

before_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end

  if defined?(ActiveRecord::Base)

    db_pool_size = if ENV["DB_POOL"]
      ENV["DB_POOL"]
    else
      20
    end

    config = Rails.application.config.database_configuration[Rails.env]
    config['reaping_frequency'] = ENV['DB_REAP_FREQ'] || 5 # seconds
    config['pool']              = ENV['DB_POOL'] || 20
    ActiveRecord::Base.establish_connection(config)

    # Turning synchronous_commit off can be a useful alternative when performance is more important than exact certainty about the durability of a transaction
    # ActiveRecord::Base.connection.execute "update pg_settings set setting='off' where name = 'synchronous_commit';"    

    Rails.logger.info("Connection pool size for unicorn is now: #{ActiveRecord::Base.connection.pool.instance_variable_get('@size')}")
  end
end