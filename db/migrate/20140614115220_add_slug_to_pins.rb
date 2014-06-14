class AddSlugToPins < ActiveRecord::Migration
  def change
    add_column :pins, :slug, :string
  end
end
