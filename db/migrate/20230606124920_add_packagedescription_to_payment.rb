class AddPackagedescriptionToPayment < ActiveRecord::Migration[7.0]
  def change
    add_column :payments, :packagedescription, :string
  end
end
