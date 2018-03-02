class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :college_name
      t.integer :starting_bracket
      t.boolean :first_four
      t.boolean :first_round
      t.boolean :second_round
      t.boolean :regional_semifinals
      t.boolean :regional_finals
      t.boolean :final_four
      t.boolean :national_championship
      t.boolean :winner
      t.integer :conference_id

      t.timestamps
    end
  end
end
