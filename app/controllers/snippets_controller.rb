class SnippetsController < ApplicationController
    def index
    @snippets = Snippet.all
    end

  def show
    @snippet = Snippet.find(params[:id])
  end

  # GET /snippets/new
  # GET /snippets/new.json
  def new
    @snippet = Snippet.new
  end

  # POST /snippets
  # POST /snippets.json
  def create
    @snippet = Snippet.new(params[:snippet])
    if @snippet.save
      PygmentsWorker.perform_in(1.hour, @snippet.id)
      redirect_to @snippet
    else
      render :new
    end
  end

  # DELETE /snippets/1
  # DELETE /snippets/1.json
  def destroy
    @snippet = Snippet.find(params[:id])
    @snippet.destroy

    respond_to do |format|
      format.html { redirect_to snippets_url }
      format.json { head :no_content }
    end
  end
end