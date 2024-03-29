class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  after_action :verify_authorized

  # GET /posts
  def index
    if user_signed_in?
      @search = Post.search(params[:q])
    else
      @search = Post.published.search(params[:q])
    end
    @posts = @search.result(distinct: true)
                    .prefer_featured
                    .most_recently_updated
                    .page(params[:page]).per(12)

    authorize @posts
    
    @categories = Category.all
  end

  # GET /posts/1
  def show
    authorize @post
    if @post.frontend_url.present?
      redirect_to @post.frontend_url, status: 301
    end
  end

  # GET /posts/new
  def new
    @post = Post.new
    authorize @post
    @categories = Category.all
  end

  # GET /posts/1/edit
  def edit
    authorize @post
    @categories = Category.all
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    authorize @post

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Der Beitrag wurde erfolgreich gespeichert.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    authorize @post

    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    authorize @post
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(
        :title,
        :subtitle,
        :frontend_url,
        :slug,
        :content,
        :meta_description,
        :is_published,
        :is_featured,
        :is_on_homepage,
        :icon,
        :category_ids => [],
        categorizations_attributes: [
          :post_id,
          :category_id
        ],
        post_images_attributes: [
          :id,
          :post_id,
          :image,
          :default,
          :_destroy
        ]
      )
    end
end
