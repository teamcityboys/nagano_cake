class Admins::GenresController < ApplicationController
    def index
      @genres = Genre.all
      @genre = Genre.new
    end

    def create
      @genre = Genre.new(genre_params)
      if @genre.save
           flash[:notice] = 'You have created Genre successfully.'
         redirect_to admins_genres_path
      else
        @genres = Genre.all
          render :index
      end
    end

    def edit
     @genre = Genre.find(params[:id])
    end

    def update
     @genre = Genre.find(params[:id])
     if @genre.update(genre_params)
       flash[:notice] = "You have update Genre successfully"
       redirect_to admins_genres_path
     else
       render :edit
     end

    end

    def destroy
     @genre = Genre.find(params[:id])
     if @genre.destroy(genre_params)
        flash[:notice] = 'Genre was succesfully destroyed.'
          redirect_to genres_path
     end
    end
    private

    def genre_params
      params.require(:genre).permit(:name)
    end
end