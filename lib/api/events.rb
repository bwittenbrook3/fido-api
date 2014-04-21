module API
  class Events < Grape::API

    desc "Fetch all the Events", {
      entity: Event::Entity
    }
    get '/events' do
    end

    desc "Fetch a specific Event", {
      entity: Event::Entity
    }
    params do
      requires :id, type: Integer, desc: "id of item"
    end
    get '/events/:id' do
    end

    desc "Creates a new Event", {
      entity: Event::Entity
    }
    params do
      group :event do 
        requires :vest_id, type: Integer, desc: "Vest ID"
        requires :attachment_id, type: Integer, desc: "Attachment ID"
        requires :alert, type: String
        requires :longitude, type: Float
        requires :latitude, type: Float
      end
    end
    post '/events' do
    end

    desc "Update a specific Event", {
      entity: Event::Entity
    }
    params do
      group :event do 
        requires :vest_id, type: Integer, desc: "Vest ID"
        requires :attachment_id, type: Integer, desc: "Attachment ID"
        requires :alert, type: String
        requires :longitude, type: Float
        requires :latitude, type: Float
      end
    end
    put '/events/:id' do
    end

    desc "Deletes a specific Event"
    params do
    end
    delete '/events/:id' do
    end

    desc "Get the new Event Pusher Channel"
    params do 
    end
    get '/events/new_channel'

    desc "Get all resources for an Event"
    get '/events/:id/resources'

    desc "Add a resources to an Event"
    params do 
      group :resource do 
        requires :type, type: String, desc: "Type of resource"
        requires :data, type: String, desc: "Data for the resource"
        requires :image, :type => "Rack::Multipart::UploadedFile", :desc => "Image file."
      end
    end
    post '/events/:id/resources'

    desc "Update the recent location of the K9"
    params do 
      group :location do  
        requires :latitude, type: String
        requires :longitude, type: String
      end
    end
    post "/events/:id/recent_locations" do 
    end

    desc "Get the new resource Channel."
    get "/events/:id/resources/new_channel" do 
    end

  end
end
