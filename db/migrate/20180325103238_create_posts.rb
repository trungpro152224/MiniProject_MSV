class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
<<<<<<< HEAD
      
=======

>>>>>>> 3e3b5494300b9da52ed1de2c25e061d07794da67
      t.timestamps
    end
  end
end
