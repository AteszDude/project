class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.references :person1
      t.references :person2
      t.timestamp :time, :null => false
    end
    
    #Add foreign keys
    add_foreign_key :matches, :users, column: :person1_id, primary_key: :id
    add_foreign_key :matches, :users, column: :person2_id, primary_key: :id
  end
end
