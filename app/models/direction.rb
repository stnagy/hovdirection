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
    
    def self.scrape_current
        agent = Mechanize.new()
        response = agent.get("https://expresslanes.com/on-the-road")
        noko = Nokogiri::HTML(response.body)
        body_text = noko.css("#Content").text
        current_direction_text = body_text.match(/currently:.+\n/i).to_s
        if current_direction_text.match(/southbound/i)
            return "Southbound"
        elsif current_direction_text.match(/northbound/i)
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
