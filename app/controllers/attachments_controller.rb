class AttachmentsController < ApplicationController
  before_action :set_attachment, only: [:destroy]
  
  # DELETE /attachments/:id
  def destroy
    filename = @attachment.filename
    @attachment.purge
    redirect_back fallback_location: root_path, notice: "#{filename} removed"
  end

  private

  def set_attachment
    @attachment = ActiveStorage::Attachment.find(params[:id])
  end
end