class CreateRestaurants < ActiveRecord::Migration[5.1]

	def change
		create_table :restaurants do |t|
			t.string :name,
			t.float :rating,
			t.string :price,
			t.string :address,
			t.string :phone,
			t.timestamp
		end
	end
end