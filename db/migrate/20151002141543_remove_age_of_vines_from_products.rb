class RemoveAgeOfVinesFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :age_of_vines, :string
  end
end
