module API
  class Events < Grape::API

    desc "Fetch all the Events", {
      entity: Event::Entity
    }
    get '/events' do
      present Event.all, with: Event::Entity
    end

    desc "Get a specific Event", {
      entity: Event::Entity
    }
    params do
      requires :id, type: Integer, desc: "id of item"
    end
    put '/events/:id' do
      present Event.find(params[:id]), with: Event::Entity
    end
  end
end
