class AddAssuredToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :assured, :string
  end
end
