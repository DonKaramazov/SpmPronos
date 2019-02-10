class HomeController < ApplicationController
  def index
    @post = Post.where(status: 'En ligne')
                .where("published_at <= :today", today: Date.today)
                .order('published_at DESC')
                .first()
  end
end
