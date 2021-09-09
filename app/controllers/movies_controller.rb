class MoviesController < ApplicationController
  def home
    @movies = Movie.all
  end

  before_action :set_movie, only: [ :show, :edit, :update, :destroy ]

  def show; end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.save

    redirect_to movie_path(@movie)
  end

  def edit; end

  def update
    @movie.update(movie_params)

    redirect_to movie_path(@movie)
  end

  def destroy
    @movie.destroy

    redirect_to movie_path
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :overview, :poster_url, :rating)
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end
end
