class ChangeTitleOfBook < ActiveRecord::Migration[6.1]
  def up
    Book.all.each do |b| 
      if b.title.length >= 25
        b.title = b.title[0..21] + "..." 
        b.save!
      end
    end
    change_column :books, :title, :string, :limit => 25
  end

  def down
    change_column :books, :title, :string  
  end
end
