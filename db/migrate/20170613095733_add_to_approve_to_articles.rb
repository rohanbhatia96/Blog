class AddToApproveToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :aprrove, :boolean,  default: false
  end
end
