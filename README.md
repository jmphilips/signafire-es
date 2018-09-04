# Solution

## Database

Created a database with two tables.  The first table is the `users` table which has user information.

Second is the `permissions` table.  The `permissions` table has two columns.  The first is an external key that references the user which has permission.  The second is the `elasticsearch_id` as `user_record`.  This is the elasticsearch id that the `user` has access to.

## Solution
In my final solution, I retrieve all of the records that a user has permission to by retrieving all of the `permissions` records that the user has associated with it.  After, I iterate through each and serialize the elasticsearch data so that the record has a `fullname`.  All of this magic happens in `user_controller.rb`.

## Self-Critiques
* Time: Took too long to complete
* Record retrieval: I retrieve the ids based on a single database query.  However, I go through each record and query elasticsearch for the id. An obvious optimization would be to figure out how to query elasticsearch for multiple ids.
* I serialize the record within the controller; however, another obvious optimization would be to use a serializing middleware that would make this more dry and would help to separate concerns of the controller out of the controller.
* Know more about elasticsearch: Obvious
* Tests:  This could use tests.  