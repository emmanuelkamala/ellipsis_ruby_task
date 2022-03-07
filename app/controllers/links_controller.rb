class LinksController < ApplicationController
  before_action :set_link, only: %i[ show edit update destroy ]

  def index
    @links = Link.all
  end

  def show
    url_extension = @link.id.to_s(36)
    @short_url = "http://localhost:3000/#{url_extension}"

    #redirect_to @link.original_url, allow_other_host: true
  end

  def new
    @link = Link.new
  end

  def edit
  end

  def create
    @link = Link.new(link_params)

    if @link.save
      redirect_to link_url(@link), notice: "Link was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def send_to_url
    id = params[:short_url].to_i(36)
    link = Link.find(id)
    redirect_to link.original_url, allow_other_host: true
  end

  def update
    if @link.update(link_params)
     redirect_to link_url(@link), notice: "Link was successfully updated." 
    else
     render :edit, status: :unprocessable_entity 
    end
  end

  def destroy
    @link.destroy
      redirect_to links_url, notice: "Link was successfully destroyed."
  end

  private

    def set_link
      @link = Link.find(params[:id])
    end

    def link_params
      params.require(:link).permit(:original_url, :expiration)
    end
end
