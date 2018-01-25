class PostsController < ApplicationController
  before_action :usuario_nao_logado
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :usuario_correto, only: [:edit, :update]
  before_action :usuario_correto_ou_admin, only: :destroy
  
  #PATCH curtir/1
  def curtir
    @post = Post.find_by(id: params[:post_id])
    current_user.likes.build(post_id: params[:post_id]).save

    respond_to do |format|
      format.html { redirect_to feed_path }
      format.js
    end
    
  end

  #PATCH descurtir/1
  def descurtir
    @post = Post.find_by(id: params[:post_id])
    current_user.likes.find_by(post_id: params[:post_id]).destroy
    

    respond_to do |format|
      format.html { redirect_to feed_path }
      format.js
    end
  end

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @comentario = Comentario.new
    @comentarios = @post.comentarios
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to feed_path, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
        
      else
        @posts = Post.all.order(updated_at: :desc)
        format.html { render "feed" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #GET feed
  def feed
    @post = Post.new
    @posts = Post.all.order(updated_at: :desc).paginate(:page => params[:page], :per_page => 10)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:usuario_id, :conteudo)
    end

    def usuario_correto
      if current_user != @post.usuario
        flash[:notice] = "Não permitido."
        redirect_to posts_path
      end
    end
  
    def usuario_correto_ou_admin 
      if !current_user.admin && current_user != @post.usuario
        flash[:alert] = "Não permitido."
        redirect_to posts_path
      end
    end
end
