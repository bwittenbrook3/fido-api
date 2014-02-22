module API
  class Events < Grape::API

    desc "Fetch all the Events", {
      entity: Event::Entity
    }
    get '/events' do
    end

    desc "Get a specific Event", {
      entity: Event::Entity
    }
    params do
      requires :id, type: Integer, desc: "id of item"
    end
    get '/events/:id' do
    end

    desc "Add a post", {
      entity: Event::Entity
    }
    params do
      requires :vest_id, type: Integer
      requires :attachment_id, type: Integer
    end
    post '/events' do
    end

  end
end
