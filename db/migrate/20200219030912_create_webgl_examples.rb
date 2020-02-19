class CreateWebglExamples < ActiveRecord::Migration[6.0]
  def change
    create_table :webgl_examples, id: :uuid do |t|
      t.string :identifier
      t.string :name
      t.string :description
      t.string :public_path

      t.timestamps
    end
  end
end
