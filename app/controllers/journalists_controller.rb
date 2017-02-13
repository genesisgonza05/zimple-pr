class JournalistsController < ApplicationController

  def index
    @journalists = Journalist.all 	
  end

  def show
    @journalist = journalist
  end

  def new
    @journalist = Journalist.new
  end

  def create
    @journalist = Journalist.create(params_journalist)
    if @journalist.save
      flash[:success] = "The journalist was successfully added!"
      redirect_to root_path
    else
      render :new
      flash[:error] = "Some of the fields placed errors, please check. #{ '<br>- ' + @journalist.errors.full_messages.join(' <br>- ')}".html_safe
    end
  end

  def edit
    @journalist = journalist
  end

  def update
    @journalist = journalist
    if @journalist.update(params_journalist)
      flash[:success] = "The journalist was successfully updated!"
      redirect_to root_path
    else
      render :edit
      flash[:error] = "Some of the fields placed errors, please check. #{ '<br>- ' + @journalist.errors.full_messages.join(' <br>- ')}".html_safe
    end
  end

  def destroy
    journalist.destroy
    flash[:success] = "The journalist was successfully deleted!"
    redirect_to root_path
  end

  private

  def params_journalist
    params.require(:journalist).permit(:name, :media)
  end

  def journalist
  	Journalist.find_by_id(params[:id])
  end

end
