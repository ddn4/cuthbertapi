# Cuthbert API

The Cuthbert API


## Interface Definition
**Current version:** v1

**Base Roue:** [base url]/api/v1

### Add a new position - POST [base route]/user/:user_id/positions.json

Adds a new position for the specified user
	
Header: Content-Type:application/json

:user_id - Cuthert API user id

Body:

	{
	  "position": {
        "latitude": "value",
        "longitude": "value",
        "timestamp": "YYYY-MM-DD 24hh:mm:ss +0000"
      }
    }	
		
#####HTTP Response Header Values:

* 200 Success - New position was saved
* 422 Client Error - Inavlid resource, position was not saved
* 500 Internal Server Error - Position was not saved
		
#####HTTP Body Response Values:

* **success** {"position":{"latitiude":"value"", "longitude":"value", "timestamp":"value"}}
* **failure** {"attribute name":["error explanations"]}
				
#####Sample POST using cURL

````
curl -d "position[latitude]=40.1456"  -d "position[longitude]= -75.283" 
-d "position[timestamp]=2012-08-13 16:14:03" 
http://morning-escarpment-1668.herokuapp.com/api/v1/users/50295f268822700200000001/positions.json
````


