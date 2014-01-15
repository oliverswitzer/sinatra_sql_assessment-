class CreateSpacecatsTable < ActiveRecord::Migration
  def up
    create_table :space_cats do |t|
      t.text :name
      t.text :home_planet
      t.text :tagline
      t.text :superpower
    end
  end

  def down
    drop_table :spacecats
  end
end
