# README

E-commerce site. Uses `bcrypt` and `materialize`. There's a seed file. Set up your own admin.

Project details
This project is an E-commerce site that utilizes ajax in the creation of products, viewing of product details, adding products to the cart and removing product items from the users cart.

This project needed to be refactored from its original version for debugging purposes.  Some debugging is still necessary.


Pre-requisites
rails 5.0.0
postgres


To set up:
clone this repository to desktop
cd into project  directory
run postgres
In another terminal window
  run rails db:create
  run rails s

Additional features added
1. Ensures users cannot order negative number of items. (validates order items to be greater than 0)
2. Allows for other than whole dollar amount to be applied to price of a product upon creation. (uses step : 01 within new product form)
3. Add flash messages for signing up, signing in and signing out.
4. Add further AJAX functionality where it might be useful. (adding a new product is done utilizing ajax)
5. Add product validations.
6. add admin flash messages for adding, updating, and deleting a product
