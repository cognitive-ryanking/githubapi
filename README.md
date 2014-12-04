githubapi
=========

Basic Tests for GitHub's API

The RSpec tests in the Spec folder are testing GitHub's Single Repository Get endpoint, GET /repos/:owner/:repo
The tests pull from this repo itself in order to simplify testing for this example.


#### get
Verifies that a request connects properly to GitHub, gets the proper response code, and proper headers

#### get_keys
Verifies that all the keys specified in the documentaiton exist in the request, null or not

#### invalid_get
Verifies invalid requests to the endpoint and invalid headers

#### date_8061
Verifies that the dates returned are in ISO8061 format

#### rate_limit
Verifies that once the rate limit is hit, a 403 is returned

#### Furthur Possible Tests
More complex testing would require the mocking, or insertion of test data and validating its return.  Testing a Post/Put/Delete endpoints would require more control over the data.

Post/Put/Delete endpoints should have tests around required fields, validity of fields, and bad JSON requests (missing or invalid JSON)

Authentication tests are needed.  To simplify the examples here-in, this is a public repo looking at itself so authenticaiton is not necessary.  

HTTP Querys for endpoints that use those, as well as pagination 
