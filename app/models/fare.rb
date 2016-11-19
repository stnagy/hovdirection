class Fare < ActiveRecord::Base
    
    # INSTANCE METHODS ------------------------------------------
    
    
    # CLASS METHODS ------------------------------------------
    
    # function to create a new fare record using get_fare function
    # returns new fare record
    def self.create_fare(fare_od_code)
        response_hash = Fare.get_fare(fare_od_code)
        Fare.create({
            od: response_hash["rates"][0]["od"],
            rate: response_hash["rates"][0]["rate"],
            road: response_hash["rates"][0]["road"],
            direction: response_hash["rates"][0]["direction"],
            duration: response_hash["rates"][0]["duration"],
            request_time: Time.now()
        })
    end
    
    # function to get fare and duration between entrance/exit
    # returns hash of curl response body
    def self.get_fare(fare_od_code)
        response_raw = Curl.get("https://expresslanes.com/on-the-road-api?ods%5B%5D=#{fare_od_code}")
        response_hash = JSON.parse(response_raw.body_str)
        return response_hash
    end
    
    # function to return fare endpoints using 
    def self.get_fare_endpoints(fare_od_code)
        fare_od_code_directory = {
            "1094" => {
              direction: "N",
              origin: "I-95 Near Garrisonville Road/Route 610",
              desination: "I-95 Near Gordon Boulevard/Route 123"
            },
            "1095" => {
              direction: "N",
              origin: "I-95 Near Garrisonville Road/Route 610",
              desination: "I-95 Near Old Keene Mill Road/Route 644"
            },
            "1096" => {
              direction: "N",
              origin: "I-95 Near Garrisonville Road/Route 610",
              desination: "Fairfax County Parkway/Route 286"
            },
            "1097" => {
              direction: "N",
              origin: "I-95 Near Garrisonville Road/Route 610",
              desination: "Franconia-Springfield Parkway/Route 289"
            },
            "1098" => {
              direction: "N",
              origin: "I-95 Near Garrisonville Road/Route 610",
              desination: "495 Express Lanes/I-495/I-95"
            },
            "1099" => {
              direction: "N",
              origin: "I-95 Near Garrisonville Road/Route 610",
              desination: "I-395 N Near Duke Street/Route 236"
            },
            "1100" => {
              direction: "N",
              origin: "I-95 Near Dumfries Road/Route 234",
              desination: "I-95 Near Gordon Boulevard/Route 123"
            },
            "1101" => {
              direction: "N",
              origin: "I-95 Near Dumfries Road/Route 234",
              desination: "I-95 Near Old Keene Mill Road/Route 644"
            },
            "1102" => {
              direction: "N",
              origin: "I-95 Near Dumfries Road/Route 234",
              desination: "Fairfax County Parkway/Route 286"
            },
            "1103" => {
              direction: "N",
              origin: "I-95 Near Dumfries Road/Route 234",
              desination: "Franconia-Springfield Parkway/Route 289"
            },
            "1104" => {
              direction: "N",
              origin: "I-95 Near Dumfries Road/Route 234",
              desination: "495 Express Lanes/I-495/I-95"
            },
            "1105" => {
              direction: "N",
              origin: "I-95 Near Dumfries Road/Route 234",
              desination: "I-395 N Near Duke Street/Route 236"
            },
            "1106" => {
              direction: "N",
              origin: "I-95 Near Cardinal Drive",
              desination: "I-95 Near Gordon Boulevard/Route 123"
            },
            "1107" => {
              direction: "N",
              origin: "I-95 Near Cardinal Drive",
              desination: "I-95 Near Old Keene Mill Road/Route 644"
            },
            "1108" => {
              direction: "N",
              origin: "I-95 Near Cardinal Drive",
              desination: "Fairfax County Parkway/Route 286"
            },
            "1109" => {
              direction: "N",
              origin: "I-95 Near Cardinal Drive",
              desination: "Franconia-Springfield Parkway/Route 289"
            },
            "1110" => {
              direction: "N",
              origin: "I-95 Near Cardinal Drive",
              desination: "495 Express Lanes/I-495/I-95"
            },
            "1111" => {
              direction: "N",
              origin: "I-95 Near Cardinal Drive",
              desination: "I-395 N Near Duke Street/Route 236"
            },
            "1112" => {
              direction: "N",
              origin: "Optiz Boulevard",
              desination: "I-95 Near Gordon Boulevard/Route 123"
            },
            "1113" => {
              direction: "N",
              origin: "Optiz Boulevard",
              desination: "I-95 Near Old Keene Mill Road/Route 644"
            },
            "1114" => {
              direction: "N",
              origin: "Optiz Boulevard",
              desination: "Fairfax County Parkway/Route 286"
            },
            "1115" => {
              direction: "N",
              origin: "Optiz Boulevard",
              desination: "Franconia-Springfield Parkway/Route 289"
            },
            "1116" => {
              direction: "N",
              origin: "Optiz Boulevard",
              desination: "495 Express Lanes/I-495/I-95"
            },
            "1117" => {
              direction: "N",
              origin: "Optiz Boulevard",
              desination: "I-395 N Near Duke Street/Route 236"
            }
            # more here
        }
    end
    
end
