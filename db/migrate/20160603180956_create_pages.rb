class CreatePages < ActiveRecord::Migration

	def up
		create_table :pages do |t|
			t.integer "subject_id"
			# t.references :subject
			
			t.string "name", :limit => 25
			t.string "permalink"
			t.integer "position"
			t.boolean "visible", :default => false
			

			t.timestamps null: false
		end
		# add_index would create index (file index) which would speed up look up 
		add_index("pages", "subject_id")
		add_index("pages", "permalink")
	end

	def down
		drop_table :pages
	end

end
