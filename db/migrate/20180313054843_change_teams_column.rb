class ChangeTeamsColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :teams, :starting_bracket, :seed
  end
end
