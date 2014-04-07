class CreateSizes < ActiveRecord::Migration
  def change
    create_table :sizes do |t|
      t.string :name
      t.string :g1
      t.string :g1h
      t.string :g2
      t.string :g2h
      t.string :g3
      t.string :g3h
      t.string :g4
      t.string :g4h
      t.string :g5
      t.string :g5h
      t.string :g6
      t.string :g6h
      t.string :g7
      t.string :g7h
      t.string :g8
      t.string :g8h
      t.string :g9
      t.string :g9h
      t.string :g10
      t.string :g10h
      t.string :g11
      t.string :g11h
      t.string :g12
      t.string :g12h
      t.string :g13
      t.string :g13h
      t.string :g14
      t.string :g14h
      t.string :g15
      t.string :g16
      t.string :g17
      t.string :g18
      t.string :g19

      t.timestamps
    end
  end
end
