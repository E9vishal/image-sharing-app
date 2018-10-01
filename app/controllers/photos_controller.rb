class PhotosController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @photo = Album.where(:id => params[:album_id]).first.photos.new
    redirect_to root_path, :flash => {:notice => "Record not found."} if @photo.blank?
  end

  def create
    # first check if album is available
    album = Album.where(:id => params[:photo][:album_id]).first
    if album.present?
      @photo = album.photos.new(photo_params)
      if @photo.save
        flash[:notice] = "Successfully created photo."
        redirect_to @photo.album
      else
        render :action => 'new'
      end
    else
      redirect_to root_path, :flash => {:notice => "Error while creating a photo"}
    end
  end

  def edit
    @photo = Photo.where(:id => params[:id]).first
    redirect_to root_path, :flash => {:notice => "Record not found."} if @photo.blank?
  end

  def update
    photo = Photo.find(params[:id])
    if photo.present? and photo.update_attributes(photo_params)
      flash[:notice] = "Successfully updated photo."
      redirect_to photo.album
    else
      render :action => 'edit'
    end
  end 

  def destroy
    photo = Photo.where(:id => params[:id]).first
    if photo.try(:destroy)
      flash[:notice] = "Successfully destroyed photo"
      redirect_to photo.album
    else
      flash[:notice] = "Could'nt find photo with ID #{params[:id]}"
      redirect_to root_url
    end
  end

  def photo_params
    params.require(:photo).permit(
      :image,
      :image_count,
      :title,
      :album_id
      );
  end
end 