# Cuthbert API

The Cuthbert API


## Interface Definition
**Current version:** v1

**Base Roue:** [base url]/api/v1

### Add a new position

Adds a new position for the specified user

	POST [base route]/user/:user_id/positions.json

	paramaterers:

		{"position":
			{"latitude":"[value]"},
			{"longitude":"[value]"},
			{"timestamp":"[value]"}
		}  		
	
	timestamp format: YYYY-MM-DD 24hh:mm:ss 
				
Sample POST using cURL

````
curl -d "position[latitude]=40.1456"  -d "position[longitude]= -75.283" 
-d "position[timestamp]=2012-08-13 16:14:03" 
http://morning-escarpment-1668.herokuapp.com/api/v1/users/50295f268822700200000001/positions.json
````


