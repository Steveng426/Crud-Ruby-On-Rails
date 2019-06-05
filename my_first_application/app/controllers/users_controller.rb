class UsersController < ApplicationController
  
  def index
    @user = User.all
  end

  def new
    @user=User.new
  end

  def create
    @user=User.new(params[:user].permit(:name,:phone,:email))
    @user.save
    redirect_to users_index_path
  end

  def edit
    @user = User.find(params[:id])
    render :new
  end

  def update
    @user = User.find(params[:user][:id])
    if @user.update(
      name: params[:user][:name],
      phone: params[:user][:phone],
      email: params[:user][:email]
    )
      redirect_to action: "index"
    else
      render 'new'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to action: "index"
  end

end
