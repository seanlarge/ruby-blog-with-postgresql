class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :subject
      t.string :body
      t.datetime :published
      t.boolean :draft

      t.timestamps
    end
  end
end
