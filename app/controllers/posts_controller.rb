class PostsController < ApplicationController
  def index
    @post = Post.all
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path, notice: "つぶやきを編集しました！"
    else
      render :edit
    end
  end

  def destroy
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      redirect_to new_post_path
      # 一覧画面へ遷移して"ブログを作成しました！"とメッセージを表示します。
    else
      # 入力フォームを再描画します。
      # newのアクションにうつる
      render :new
    end
  end

  def post_params
    params.require(:post).permit(:content)
  end

end
