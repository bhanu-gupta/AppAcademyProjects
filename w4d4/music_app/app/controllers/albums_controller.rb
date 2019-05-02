class AlbumsController < ApplicationController

    def show
        @album = Album.find_by(id: params[:id])
        @band = @album.band
        @tracks = @album.tracks
        render :show
    end

    def new
        @album = Album.new
        @bands = Band.all
        @current_band = Band.find_by(id: params[:band_id])
        render :new
    end

    def create
        @album = Album.new(album_params)
        if @album.save
            redirect_to album_url(@album)
        else
            flash.now[:errors] = @album.errors.full_messages
            @bands = Band.all
            @current_band = Band.find_by(id: params[:album][:band_id])
            render :new
        end
    end

    def edit
        @album = Album.find_by(id: params[:id])
        @bands = Band.all
        render :edit
    end

    def update
        @album = Album.find_by(id:params[:id])
        if @album.update(album_params)
            redirect_to album_url(@album)
        else
            flash.now[:errors] = @album.errors.full_messages
            @bands = Band.all
            render :edit
        end
    end

    def destroy
        @album = Album.find_by(id:params[:id])
        @band = @album.band
        @album.destroy
        redirect_to band_url(@band)
    end

    def album_params
        params.require(:album).permit(:title, :year, :album_type, :band_id)
    end
end