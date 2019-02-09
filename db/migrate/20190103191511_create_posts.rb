class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body , :null => false
      t.date :published_at
      t.string :status,:default => 'EN_LIGNE'
      t.string :resume
      t.timestamps
    end

    create_table :comments do |t|
      t.belongs_to :user, index: true
      t.belongs_to :post, index: true
      t.string :content, :null => false
      t.datetime :published_at
    end
  end
end
