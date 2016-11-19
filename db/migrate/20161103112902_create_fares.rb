class CreateFares < ActiveRecord::Migration
  def change
    create_table :fares do |t|
      t.text        :od
      t.float       :rate
      t.text        :road
      t.text        :direction
      t.text        :duration
      t.datetime    :request_time
      
      t.timestamps null: false
    end
  end
end
