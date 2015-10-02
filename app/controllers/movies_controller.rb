class MoviesController < ApplicationController

  def index
   # @movies = Movie.all
   title = params[:title]
   director = params[:director]
   duration = get_duration(params[:duration])
   session[:duration] = params[:duration]
   @movies = Movie.where("title LIKE ? OR director LIKE ?", "%#{title}%", "%#{director}%").where(runtime_in_minutes: duration)
  end

  def get_duration(duration)
    case duration
    when '1'
      return (0..89)
    when '2'
      return (90..120)
    when '3'
      return (121..300)
    else
      return (0..300)
    end
  end

  def show
   @movie = Movie.find(params[:id])
  end

  def new
   @movie = Movie.new
  end

  def edit
   @movie = Movie.find(params[:id])
  end
   
  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movies_path, notice: "#{@movie.title} was submitted successfully!"
    else
      render :new
    end
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update_attributes(movie_params)
      redirect_to movie_path(@movie)
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  protected

  def movie_params
    params.require(:movie).permit(
      :title, :release_date, :director, :runtime_in_minutes, :description, :image, :remote_image_url, :poster_image_url
    )
  end

end
