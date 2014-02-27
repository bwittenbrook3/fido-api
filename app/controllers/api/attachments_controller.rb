module Api
	class AttachmentsController < ApplicationController

		def index
			@attachments = Attachment.all
			render :json => @attachments
		end

		def create
			@attachment = Attachment.create(attachment_params)
			if @attachment.valid?
				render :json => @attachment
			else
				render :json => nil, status: :unprocessable_entity
			end
		end

		private
		def attachment_params
			params.require(:attachment).permit(
				:vest_id, :name, :description
			)
		end
	end
end