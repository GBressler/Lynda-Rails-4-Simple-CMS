class CreateSections < ActiveRecord::Migration
  #should be def  change
  def up
  	#drop_table :sections
    create_table :sections do |t|
		  t.integer "page_id"
		  t.string "name"
    	t.integer "position"
    	t.boolean "visible", :default => false
    	t.string "content type"
    	t.text "content"
      t.timestamps null: false
    end
    add_index("sections", "page_id")
  end
#if above def is "def change", then we shouldn't need this method
def down
	drop_table :sections
end

end
