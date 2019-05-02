class Changealbumcolumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :albums, :type
    add_column :albums, :album_type, :string, default: 'studio'
  end
end
