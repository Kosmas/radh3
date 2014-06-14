class AddSlugToBoards < ActiveRecord::Migration
  def change
    add_column :boards, :slug, :string
  end
end
