class PrototypesController < ApplicationController
  #before_action :authenticate_user!, only: [:show,:index,:new]
  #before_action :move_to_index, only: [:edit, :update, :destroy]
  #before_action :authenticate_user!, only: [:show, :index]

  def index
    @prototypes = Prototype.all
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      @prototype = Prototype.new
      render action: :new
    end
  end

    def edit
      @prototype = Prototype.find(params[:id])
      unless user_signed_in? && current_user.id == @prototype.user_id
        redirect_to action: :index

      #else     render :edit

       end 
    end

    def update  
      prototype = Prototype.find(params[:id])
      prototype.update(prototype_params)

      if prototype.update(prototype_params)
        redirect_to prototype_path
      else
        render :edit
      end
    end

    def destroy
      prototype = Prototype.find(params[:id])
      prototype.destroy
      redirect_to root_path
    end

    

  private
  def prototype_params
    params[:prototype].permit(:title, :catch_copy, :concept,:image).merge(user_id: current_user.id)
  end

  
end