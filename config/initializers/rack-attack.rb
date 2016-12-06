class Rack::Attack
  
    # Block China
    Rack::Attack.blocklist('block china') do |req|
        # Requests are blocked if the return value is truthy
        req.ip.match(/\A180\.76\./) 
    end
  
end