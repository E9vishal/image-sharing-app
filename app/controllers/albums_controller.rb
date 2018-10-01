class AlbumsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  # GET /albums
  # GET /albums.json
  def index
    @albums = Album.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @albums }
    end
  end

  # GET /albums/1
  # GET /albums/1.json
  def show
    @album = Album.includes(:photos).find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @album }
    end
  end

  # GET /albums/new
  # GET /albums/new.json
  def new
    # set current user
    @album = Album.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @album }
    end
  end

  # GET /albums/1/edit
  def edit
    # set current user
    @album = Album.where(:id => params[:id]).try(:first)
    redirect_to root_url, :flash => {:notice => "Record not found."} if @album.blank?
  end

  # POST /albums
  # POST /albums.json
  def create
    @album = Album.new(album_params)
    @album.user_id = current_user

    respond_to do |format|
      if @album.save!
        format.html { redirect_to albums_path, notice: 'Album was successfully created.' }
        format.json { render json: albums_path, status: :created, location: album }
      else
        format.html { render action: "new" }
        format.json { render json: albums.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /albums/1
  # PUT /albums/1.json
  def update
    album = Album.where(:id => params[:id]).try(:first)

    respond_to do |format|
      if album.present? and album.update_attributes(album_params)
        format.html { redirect_to album, notice: 'Album was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: album.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /albums/1
  # DELETE /albums/1.json
  def destroy
    album = Album.where(:id => params[:id]).first
    album.destroy if album.present?

    respond_to do |format|
      format.html { redirect_to albums_url }
      format.json { head :no_content }
    end
  end
  
   private

    def album_params
      params.require(:album).permit(
        :name,
        :images_count,
        :user_id
        )
    end
end