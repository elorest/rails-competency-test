# Simple News App - Rails Competency Test
To get started please fork this project and carefully read the following instructions.

Commit all of the code to your fork of this project. May the force be with you.

## User Personas
The project will have multiple roles that interact with each other.
* Guest (No Login)
* Vanilla Users (Logged in - No special role)
* Editor Users
* Admin Users *(Extra Credit)*

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
* Can do everything a vanilla User can.
* Can create articles
* Can delete articles that they created
* Can edit articles that they created

##### Admin User *(Extra Credit)*
* Can create users and set roles.
* Can edit users and change roles.
* Can't edit/destroy/create articles.

## Article Table
Table will contain **title**, **content**, **category**, **user_id**.

## Roles
Use one of these gems: Petergate *(Preferred)*, Pundit, Cancancan.
###### Role Names
* user
* editor
* site_admin *(Extra Credit)*

## Database
Use sqlite

## Testing
Use minitest as the test suite. 

## Authentication
Devise can be used for authentication.

## Templating
slim *(Prefered)*, haml, erb
