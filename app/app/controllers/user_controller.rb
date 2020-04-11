class UserController < ApplicationController
  def login
  end

  def login_form
    @user = User.find_by(login: params[:login])
    if @user && @user.try(:authenticate, params[:password])
      flash[:info] = "Bienvenue sur ma micro app #{@user.login}"
      session[:user_id] = @user.id
      redirect_to '/'
    else
      flash[:info] = "Echec de la connexion"
      redirect_to '/login'
    end
  end

  def register
  end

  def register_form
    if User.find_by(login:params[:login])
      flash[:info] = "Ce pseudo est déjà pris !"
      redirect_to '/register'
      return
    end
    user = User.create login:params[:login], password:params[:password]
    if user
      user.save
      session[:user_id] = user.id
      flash[:info] = "Vous êtes bien inscrits !"
      redirect_to '/'
    else
      flash[:info] = "Veuillez bien renseigner tous les champs !"
      redirect_to '/register'
    end
  end

  def signout
    session[:user_id] = nil
    redirect_to '/'
  end
end
