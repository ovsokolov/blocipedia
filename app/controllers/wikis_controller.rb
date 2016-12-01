class WikisController < ApplicationController
  before_action :set_wiki, only: [:show, :edit, :update, :destroy]

  # GET /wikis
  # GET /wikis.json
  def index
    #@wikis = Wiki.visible_wiki(current_user)
    @wikis = policy_scope(Wiki)
  end

  # GET /wikis/1
  # GET /wikis/1.json
  def show
    @wiki = Wiki.find(params[:id])
  end

  # GET /wikis/new
  def new
    @wiki = Wiki.new
  end

  # GET /wikis/1/edit
  def edit
  end

  # POST /wikis
  # POST /wikis.json
  def create
    @wiki = Wiki.new(wiki_params)
    @wiki.user = current_user
    respond_to do |format|
      if @wiki.save
        flash[:notice] = "Wiki was successfully created."
        format.html { redirect_to action: "index"}
      else
        flash.now[:alert] = "There was an error saving the post. Please try again."
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /wikis/1
  # PATCH/PUT /wikis/1.json
  def update
    authorize @wiki
    respond_to do |format|
      if @wiki.update(wiki_params)
        flash[:notice] = "Wiki was successfully updated."
        format.html { redirect_to action: "index" }
      else
        flash.now[:alert] = "There was an error saving the wiki. Please try again."
        format.html { render :edit }
      end
    end
  end

  # DELETE /wikis/1
  # DELETE /wikis/1.json
  def destroy
    authorize @wiki
    @wiki.destroy
    respond_to do |format|
      flash[:notice] = "Wiki was successfully deleted."
      format.html { redirect_to action: "index" }
    end
  end

  def collaborators
    @wiki_users = User.all
    @collaborators = User.find(Wiki.find(params[:wiki_id]).collaborators.pluck(:user_id))
  end

  def save_collaborators
    Collaborator.destroy_all(:wiki_id => params[:wiki_id])
    params[:collaborator].each do |id, attr|
      Collaborator.create!(
        user_id:  id,
        wiki_id:  params[:wiki_id]
      )
    end
    redirect_to edit_wiki_path(params[:wiki_id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wiki
      @wiki = Wiki.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wiki_params
      params.fetch(:wiki, {}).permit(:title, :body, :private)
    end
end
