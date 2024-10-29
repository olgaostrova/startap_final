class AddTagsToStartup < ActiveRecord::Migration[7.0]
  def change
    add_column :startups, :tags, :string
  end
end
