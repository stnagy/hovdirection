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
        responseN = agent.get("https://www.expresslanes.com/maps-api/get-ramps-price?ramp_entry=200&ramp_exit=215")
        responseS = agent.get("https://www.expresslanes.com/maps-api/get-ramps-price?ramp_entry=215&ramp_exit=201")
        json_responseN = JSON.parse(response1.body)
        json_responseS = JSON.parse(response2.body)
        
        if json_responseN['status_95'].match(/open/i) 
            return "Northbound"
        elsif json_responseS['status_95'].match(/open/i)
            return "Southbound"
        elsif (json_response['status_95'].match(/closed/i) ?? json_responseS['status_95'].match(/closed/i))
            return "Closed"
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
