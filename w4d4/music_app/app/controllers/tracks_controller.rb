class TracksController < ApplicationController
    def show
        @track= Track.find_by(id: params[:id])
        @album = @track.album
        @notes = []
        render :show
    end

    def new
        @track= Track.new
        @albums = Album.all
        @current_album = Album.find_by(id: params[:album_id])
        render :new
    end

    def create
        @track= Track.new(album_params)
        if @track.save
            redirect_to track_url(@track)
        else
            flash.now[:errors] = @track.errors.full_messages
            @albums = Album.all
            @current_album = Album.find_by(id: params[:track][:album_id])
            render :new
        end
    end

    def edit
        @track= Track.find_by(id: params[:id])
        @albums = Album.all
        render :edit
    end

    def update
        @track= Track.find_by(id:params[:id])
        if @track.update(track_params)
            redirect_to track_url(@track)
        else
            flash.now[:errors] = @track.errors.full_messages
            @albums = Album.all
            render :edit
        end
    end

    def destroy
        @track= Track.find_by(id:params[:id])
        @album = @track.album
        @track.destroy
        redirect_to article_url(@album)
    end

    def track_params
        params.require(:track).permit(:title, :album_id, :lyrics, :ord, :track_type)
    end
end