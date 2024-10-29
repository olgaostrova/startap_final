class AddPublicToStartups < ActiveRecord::Migration[7.0]
  def change
    add_column :startups, :public, :boolean, default: true
  end
end
