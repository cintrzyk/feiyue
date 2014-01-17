module Spree
  class Admin::PostsController < Spree::Admin::BaseController
    def index
      @posts = Post.all
    end

    def edit
      @post = Post.find(params[:id])
      @image = Image.new
    end

    def new
      @post = Post.new
    end

    def create
      post = Post.new(post_params)

      if post.save
        redirect_to edit_admin_post_path(post), notice: I18n.t('post.notices.created')
      else
        flash.now[:error] = "Error Post"
        render :new_admin_post, post: post
      end
    end

    def update
      post = Post.find(params[:id])

      if post.update_attributes(post_params)
        redirect_to :admin_posts, notice: I18n.t('post.notices.updated')
      else
        render 'edit'
      end
    end

    def destroy
      post = Post.find(params[:id])

      if post.destroy
        redirect_to :admin_posts, notice: I18n.t('post.notices.deleted')
      else
        render :admin_posts
      end
    end

    def create_image
      image = Image.create(image_params)
      post = Post.find(params[:id])
      if post.images.push image
        redirect_to edit_admin_post_path(post), notice: I18n.t('image.notices.created')
      end
    end

    def destroy_image
      post = Post.find(params[:id])
      image = Image.find(params[:image_id])

      if post.images.delete(image)
        redirect_to edit_admin_post_path(post), notice: I18n.t('image.notices.deleted')
      else
        flash.now[:error] = "Something goes wrong..."
        redirect_to edit_admin_post_path(post)
      end
    end

    private

    def post_params
      params.require(:post).permit(:title, :description)
    end

    def image_params
      params.require(:image).permit(:attachment, :alt)
    end
  end
end
