namespace :jobs do 
    desc "run data acquisition"
    task :go => :environment do
        ActiveRecord::Base.connection_pool.with_connection do
            Direction.create_current

            ## FARE DEPRECATED IN CURRENT WEBSITE RELEEASE
            #if Direction.is_southbound?
            #    Fare.create_fare("1157") # 395 to end of 95
            #elsif Direction.is_northbound?
            #    Fare.create_fare("1099") # end of 95 to 395
            #else
            #    
            #end
        end
        
    end
    desc "clean db"
    task :clean => :environment do
        Direction.where('created_at < ?', 31.days.ago).destroy_all
        Fare.where('created_at < ?', 31.days.ago).destroy_all
    end
end
