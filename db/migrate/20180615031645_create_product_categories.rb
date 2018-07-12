class CreateProductCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :product_categories do |t|
      t.string :product_id
      t.string :category_id

      t.timestamps
    end
  end
end
