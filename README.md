 ## PLOTTR API

 
 
 ******Install MongoDB******

visit https://www.mongodb.com/download-center and click on community server Edition, then select the OS & version and download the file.

once download gets completed click on installation instruction and follow the given steps to install Mongodb on   [Linux](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-linux), [ Windows](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-windows), [Mac](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-os-x)




 *****Creating app From Scratch*****

Step 1. To setup latest Ruby & Rails version find this link for installing On different OS.
[Linux](http://railsapps.github.io/installrubyonrails-ubuntu.html), [Windows](http://installfest.railsbridge.org/installfest/windows), [Mac](http://railsapps.github.io/installrubyonrails-mac.html)	 *****Cloning an Existing app in rails***** 

step 2. To create rails app run the following command
- rails new image-sharing-app

Step 3. add gem  in Gemfile 
- 'devise' - authentication
- 'rmagick'
- 'carrierwave' - image uploads
- 'twitter-bootstrap-rails' - twitter bootstrap UI

Step 4. To install all the dependencies Run.
- bundle install

Step 5. To Generate mongoid config 
-  rails generate devise:install
-  rails generate uploader Image
-  rails generate bootstrap:install less
-  rails generate bootstrap:install static  

Step 6. To Generate user model  
- rails g model Album name:string image_count:integer
- rails g model Photo image:string title:string album:references

Step 7.  To Generate controller Run
- rails g controller albums
- rails g controller photos
- rails g controller home

Step 8. add routes under Config/routes.rb file as
```
resources :albums
  resources :photos, :except => [:index, :show]
  devise_for :users
  root :to => "home#index"
```

 *****Gems used***** 
'pg' - postgresql database
'devise' - authentication
'carrierwave' - image uploads
'twitter-bootstrap-rails' - twitter bootstrap UI



 *****Cloning an Existing app in rails***** 
```ruby
Step 1. git clone YOUR_REMOTE_ADDRESS

Step 2. cd into your Repo

Step 3. To install all the dependencies Run
bundle install

Step 4. rails server
```

	