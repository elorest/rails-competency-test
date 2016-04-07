## Rails Competency Test
For this test we want you to create a simple news application. 

## User Personas
The project will have multiple roles that interact with each other.
* Guest (No Login)
* Vanilla Users
* Editor Users
* Admin User *(Extra Credit)*

## User Functionality
##### Guests (No Login)
* Can see homepage with first 3 articles from each category.
* Can see article index page.
* Are sent to signup page if they want to see article show page.
* Can signup
* Can Login

##### Vanilla Users
* Can see everything a guest can
* Can see article show pages. 
* Can logout

##### Editor Users
* Can do everything a Vanilla User can.
* Can create articles
* Can delete articles that they created
* Can edit articles that they created

##### Admin User *(Extra Credit)*
* Can create and change roles on users.
* Can't edit/destroy/create articles.

## Article Table
Table will contain **title**, **content**, **category**, **user_id**.

## Roles
Use one of these gems: Petergate *(Preferred)*, Pundit, Cancancan.
###### Role Types
* user
* editor 

## Testing
Use minitest as the test suite. 

## Authentication
Devise can be used for authentication.
