class TagsController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.order(:name)
    authorize @tags
  end

  def edit
    @tag = ActsAsTaggableOn::Tag.find(params[:id])
    authorize @tag
  end

  def update
    @tag = ActsAsTaggableOn::Tag.find(params[:id])
    authorize @tag
    
    respond_to do |format|
      if @tag.update(tag_params)
        format.html { redirect_to tags_path, notice: 'Tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @tag }
      else
        format.html { render :edit }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tag = ActsAsTaggableOn::Tag.find(params[:id])
    authorize @tag

    @tag.destroy

    respond_to do |format|
      format.html { redirect_to tags_path }
      format.json { head :no_content }
    end
  end
  
  private
  
  def set_tag
    @tag = ActsAsTaggableOn::Tag.find(params[:id])
  end

  def tag_params
    params.require(:acts_as_taggable_on_tag).permit(
      :id,
      :name
    )
  end

end