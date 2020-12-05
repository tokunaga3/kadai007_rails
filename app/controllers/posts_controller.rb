class PostsController < ApplicationController
  def index
    @post = Post.all
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
  end

  def create
    @post = Post.create(content: params[:post][:content])
    if @post.save
      redirect_to new_post_path
      # 一覧画面へ遷移して"ブログを作成しました！"とメッセージを表示します。
    else
      # 入力フォームを再描画します。
      # newのアクションにうつる
      render :new
    end
  end

end
