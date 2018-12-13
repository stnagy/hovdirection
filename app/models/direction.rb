class Direction < ActiveRecord::Base
    
    scope :current, -> { order(:created_at).last }
    
    # INSTANCE METHODS ------------------------------------------
    
    
    
    # CLASS METHODS ------------------------------------------
    
    def self.is_southbound?
        return true if Direction.current.direction == "Southbound"
        return false
    end
    
    def self.is_northbound?
        return true if Direction.current.direction == "Northbound"
        return false
    end
    
    def self.is_closed?
        return true if Direction.current.direction == "Closed"
        return false
    end
    
    def self.scrape_current
        agent = Mechanize.new()
        response = agent.get("https://www.expresslanes.com/maps-api/get-ramps-price?ramp_entry=200&ramp_exit=215")
        json_response = JSON.parse(response.body)
        if json_response['direction_95'].match(/closed/i)
            return "Closed"
        elsif json_response['direction_95'].match(/N/i)
            return "Southbound"
        elsif json_response['direction_95'].match(/S/i)
            return "Northbound"
        else
            return false
        end
    end
    
    def self.create_current
        Direction.create({
            direction: Direction.scrape_current
        })
    end
    
end
