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
        requires :name, type: String, desc: "Vest ID" 
        requires :description, type: String, desc: "Attachment ID" 
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
        requires :name, type: String, desc: "Vest ID" 
        requires :description, type: String, desc: "Attachment ID" 
      end
    end
    put 'vests/:id' do
    end

    desc "Delete a specific Vest"
    delete 'vests/:id' do
    end

    desc "Get the image path for the Vest"
    get "vests/:id/image_path" do 
    end
  end
end