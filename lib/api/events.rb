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
      end
    end
    put '/events/:id' do
    end

    desc "Deletes a specific Event"
    params do
    end
    delete '/events/:id' do
    end

  end
end
