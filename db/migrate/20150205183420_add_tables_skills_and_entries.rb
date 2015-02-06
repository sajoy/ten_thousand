class AddTablesSkillsAndEntries < ActiveRecord::Migration
  def change
    create_table(:skills) do |t|
      t.column(:name, :string)
      t.timestamps
    end
    create_table(:entries) do |t|
      t.column(:title, :string)
      t.column(:skill_id, :integer)
      t.column(:category, :string)
      t.column(:rating, :integer)
      t.timestamps
    end
  end
end
