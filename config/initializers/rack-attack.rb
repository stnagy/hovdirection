class Rack::Attack
  
    # Block China
    Rack::Attack.blocklist('block china') do |req|
        # Requests are blocked if the return value is truthy
        return true if req.ip.match(/\A180\.76\./) 
        return false
    end
  
end