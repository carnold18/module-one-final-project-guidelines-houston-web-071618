class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    	create_table :restaurants do |t|
  		t.string :name
      t.string :alias
  		t.float :rating
  		t.string :price
      t.string :transactions
  		t.string :address
  		t.string :phone
  	end
  end
end
