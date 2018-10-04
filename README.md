 ## IMAGE SHARING APP



 *****Creating app From Scratch*****

Step 1. To setup latest Ruby & Rails version find this link for installing On different OS.
[Linux](http://railsapps.github.io/installrubyonrails-ubuntu.html), [Windows](http://installfest.railsbridge.org/installfest/windows), [Mac](http://railsapps.github.io/installrubyonrails-mac.html)

step 2. To create rails app run the following command
- rails new image-sharing-app

Step 3. add gem  in Gemfile 
- 'devise' - authentication
- 'carrierwave' - image uploads
- 'rmagick'

- 'twitter-bootstrap-rails', :git => 'git://github.com/seyhunak/twitter-bootstrap-rails.git'  - twitter bootstrap UI
- "therubyracer"
- "less-rails"

Step 4. To install all the dependencies Run.
- bundle install

Step 5. To Generate mongoid config 
-  rails generate devise:install
-  rails generate uploader Image
-  rails generate bootstrap:install less
-  rails generate bootstrap:install static  

Step 6. To Migrate all the migration file Run
-  rake db:migrate

Step 7. To Generate user model  
- rails g model Album name:string image_count:integer
- rails g model Photo image:string title:string album:references

Step 8.  To Generate controller Run
- rails g controller albums
- rails g controller photos
- rails g controller home

Step 9. add routes under Config/routes.rb file as
```
resources :albums
  resources :photos, :except => [:index, :show]
  devise_for :users
  root :to => "home#index"
```


 *****Cloning an Existing app in rails***** 
```ruby
Step 1. git clone YOUR_REMOTE_ADDRESS

Step 2. cd into your Repo

Step 3. To install all the dependencies Run
bundle install

Step 4. rails server
```

	