class MigrateUser < ActiveRecord::Migration[5.2]
  def change
        add_column :users, :name, :string
        add_column :users, :registration, :timestamp
        add_column :users, :birth_date, :datetime
        add_column :users, :geoloc, :integer
        add_column :users, :description, :text
        add_column :users, :likes, :integer
        add_column :users, :sex, :integer
        add_column :users, :match_sex, :integer
        add_column :users, :match_age_min, :integer
        add_column :users, :match_age_max, :integer
  end
end
