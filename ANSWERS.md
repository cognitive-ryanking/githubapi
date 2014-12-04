Answers about this project
----------------------------------

##### Concerns about testing
The readme of this project includes some insights of further testing that I would expect the team to need to do in order to better test the API.  My largest concern would be about having control over the data for testing the application. Having a test environment that can be quickly stood up and pre-populated with data that can be manipulated, i.e. for verifying  a delete, seems paramount.  I also think that the testing effort would require a lot of knowledge of the internal workings of this applicaiton in order to properly test it.  The API provides a lot more functionality than most users will use, which means that as a tester I need to puch more boundries than usual and need some good insight into when things are working right and wrong. I also would be concered about hitting the rate limit with automation.  

##### Going about testing
I think first we would need to identify the core functionality that is common to all the endpoints, such as the headers, expecting null for non existent data, response codes, etc.  There should be some tests that more broadly test that functionality, rather then testing it for every endpoint.  Then when there is a change to an endpoint, or a new endpoint these deeper tests can be run against them.  

Next break up the testing by how the documentation breaks down the endpoints. Simple tests to verify the base functionality, gets have the keys we expect, puts/posts require the right information and actually update.  Add broader tests for specific edge cases.  

##### What to automate
Its most worth automating the pieces that can be used by multiple endpoints and can be used to verify new or changed endpoints.  Written in the best way, these tests could run against an arbitrary endpoint on code checkin to quickly validate that it hasn't been fundamentally broken.  There are some basic tests for each endpoint that are worth automating as well, such as verify the keys and values that are most common, verify subqueries get the proper objects (parent for a fork).

##### Tools to use
I used rSpec here, because it was the fastest thing for me to get some tests set up in.  In reality, it's not a good framework for API testing.  There are many off the shelf solutions that are popular that will better suit API testing and capture metrics beyond pass/fail, such as response times.  SoapUI comes to mind as the generally industry popular solution for this.  I'd also expect to use something like Postman to easily ad hoc test the endpoints.

