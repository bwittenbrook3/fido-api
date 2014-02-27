module API
  class Attachments < Grape::API

  	desc "Fetch all the Attachments", {
  		entity: Attachment::Entity
  	}
    get '/attachments' do
    end

    desc "Create a new Attachments", {
    	entity: Attachment::Entity
  	}
  	params do
  		group :attachment do 
  			requires :vest_id, type: Integer, desc: "Vest id"
        requires :name, type: String, desc: "Attachment name" 
        requires :description, type: String, desc: "Attachment description" 
      end
  	end
    post '/attachments'

  end
end