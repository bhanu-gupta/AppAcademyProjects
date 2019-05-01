class CatsController < ApplicationController
  before_action :ensure_logged_in, except:[:index, :show]

  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find(params[:id])
    render :show
  end

  def new
    @cat = Cat.new
    render :new
  end

  def create
    @cat = Cat.new(cat_params)
    @cat.owner = current_user
    if @cat.save
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :new
    end
  end

  def edit
    # @cat = Cat.find(params[:id])
    # debugger
    current_user.cats.each do |user_cat|
      if user_cat.id == params[:id].to_i
        @cat = user_cat
        render :edit
        return
      end
    end
    redirect_to cats_url
  end

  def update
    current_user.cats.each do |cat|
      if cat.id == params[:id].to_i
        @cat = cat
      end 
    end
    redirect_to cats_url if @cat.nil?

    if @cat.update_attributes(cat_params)
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :edit
    end
  end

  private

  def cat_params
    params.require(:cat).permit(:age, :birth_date, :color, :description, :name, :sex)
  end
end
