namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_categories
    make_items
		make_locations
    make_events
		make_requirements
		make_contributions
		make_admin
  end
end

def make_categories
  cat = Category.create!(:name => "Drink")
  cat = Category.create!(:name => "Food")
  cat = Category.create!(:name => "Supplies")
  cat = Category.create!(:name => "Other")
end

def make_items
  cat = Item.create!(:name => "Soft drink",
											:unit => "Bottles 1.5 Lts",
											:category_id => 1)
  cat = Item.create!(:name => "Juice",
											:unit => "Bottles 1.5 Lts",
											:category_id => 1)
  cat = Item.create!(:name => "Water - no gas",
											:unit => "Bottles 1.5 Lts",
											:category_id => 1)
  cat = Item.create!(:name => "Water - with gas",
											:unit => "Bottles 1.5 Lts",
											:category_id => 1)
  cat = Item.create!(:name => "Biscuits",
											:unit => "Packets",
											:category_id => 2)
  cat = Item.create!(:name => "Cake",
											:unit => "Cakes",
											:category_id => 2)
  cat = Item.create!(:name => "Bread",
											:unit => "Loaves",
											:category_id => 2)
  cat = Item.create!(:name => "Crisps",
											:unit => "Packets",
											:category_id => 2)
  cat = Item.create!(:name => "Fruit",
											:unit => "Bunches",
											:category_id => 2)
  cat = Item.create!(:name => "Cups",
											:unit => "Packets",
											:category_id => 3)
  cat = Item.create!(:name => "Plates",
											:unit => "Packets",
											:category_id => 3)
  cat = Item.create!(:name => "Napkins",
											:unit => "Packets",
											:category_id => 3)
end

def make_locations
  cat = Location.create!(:name => "Middle School")
  cat = Location.create!(:name => "Upper School")
  cat = Location.create!(:name => "Im Brandt, Thalwil")
end

def make_events
  cat = Event.create!(:name => "Winter Dance",
											:date => Time.now,
											:location_id => 1)
  cat = Event.create!(:name => "Ice Dance",
											:date => Time.now,
											:location_id => 3)
  cat = Event.create!(:name => "Spring Dance",
											:date => Time.now,
											:location_id => 2)
end

def make_requirements
  3.times do |e|
		12.times do |i|
    Requirement.create!(:qty => 10 + rand(8),
                 :event_id => 1 + e,
                 :item_id => 1 + i)
		end
  end
end

def make_contributions
  3.times do |e|
		24.times do |i|
    Contribution.create!(:qty => 1 + rand(4),
                 :event_id => 1 + e,
                 :item_id => 1 + rand(12),
								 :email => "Person#{rand(12)}",
								 :authtoken => 1+rand(1000000),
								 :req => 1)
		end
  end
end

def make_admin
	User.create! :username => 'admin', :email => 'mnelson@zis.ch', :password => 'foobar', :password_confirmation => 'foobar'
end  
