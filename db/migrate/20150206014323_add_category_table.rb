class AddCategoryTable < ActiveRecord::Migration
  def change
    create_table(:categories) do |t|
      t.column(:name, :string)
    end
    remove_column(:entries, :category)
    add_column(:entries, :category_id, :integer)
  end
end
