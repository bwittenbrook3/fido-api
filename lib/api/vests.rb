module API
  class Vests < Grape::API

  	desc "Fetch all the Vests", {
      entity: Vest::Entity
    }
    get '/vests' do
    end

    desc "Create a new Vest"
   	params do
      group :vest do 
        requires :K9, type: String
        requires :officer, type: String
        requires :status, type: String
        requires :age, type: String
        requires :image, :type => "Rack::Multipart::UploadedFile", :desc => "Image file."
      end
  	end
    post '/vests' do
    end


    desc "Fetch a specific Vest", {
      entity: Vest::Entity
    }
    get '/vests/:id' do
    end

    desc "Update a specific Vest", {
      entity: Vest::Entity
    }
    params do
      group :vest do 
        requires :K9, type: String
        requires :officer, type: String
        requires :status, type: String
        requires :age, type: String
        requires :image, :type => "Rack::Multipart::UploadedFile", :desc => "Image file."
      end
    end
    put 'vests/:id' do
    end

    desc "Delete a specific Vest"
    delete 'vests/:id' do
    end

    desc "Get the image path for the K9"
    get "vests/:id/image_path" do 
    end

    desc "Get the training the K9"
    get "vests/:id/training" do
    end

    desc "Get all events of the K9"
    get "vests/:id/events" do
    end

    desc "Update the recent location of the K9"
    params do 
      group :location do  
        requires :latitude, type: String
        requires :longitude, type: String
      end
    end
    post "/vests/:id/recent_locations" do 
    end
  end
end