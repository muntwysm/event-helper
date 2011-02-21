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
  cat = Location.create!(:name => "Middle School",
				:address => "Nidelbadstrasse 49, Kilchberg 8802",
				:map => "http://maps.google.com/maps?client=ubuntu&channel=fs&oe=utf-8&ie=UTF8&q=Nidelbadstrasse+49,+Kilchberg+8802&fb=1&hnear=&cid=0,0,16556179714999253025&hq=Nidelbadstrasse+49,+Kilchberg+8802&ll=47.314344,8.543093&spn=0.006052,0.013797&z=16&iwloc=A")
  cat = Location.create!(:name => "Upper School",
				:address => "Eichenweg 2, 8134 Adliswil",
				:map => "http://maps.google.com/maps?f=q&source=s_q&hl=en&geocode=&q=Eichenweg+2,+8134+Adliswil&aq=&sll=47.315726,8.535261&sspn=0.011376,0.043945&ie=UTF8&hq=&hnear=Eichenweg+2,+8134+Adliswil,+Horgen,+Z%C3%BCrich,+Switzerland&ll=47.320091,8.532&spn=0.011375,0.043945&z=15")
  cat = Location.create!(:name => "Lower School",
				:address => "Steinacherstrasse 140, 8820 Wädenswil",
				:map => "http://maps.google.com/maps?f=q&source=s_q&hl=en&geocode=&q=Eichenweg+2,+8134+Adliswil&aq=&sll=47.315726,8.535261&sspn=0.011376,0.043945&ie=UTF8&hq=&hnear=Eichenweg+2,+8134+Adliswil,+Horgen,+Z%C3%BCrich,+Switzerland&ll=47.320091,8.532&spn=0.011375,0.043945&z=15")
  cat = Location.create!(:name => "Early Childhood Centre",
				:address => "Seestrasse 169, 8802 Kilchberg",
				:map => "http://maps.google.com/maps?f=q&source=s_q&hl=en&geocode=&q=Seestrasse+169,+8802+Kilchberg&aq=&sll=47.236604,8.634456&sspn=0.012122,0.043945&ie=UTF8&hq=&hnear=Seestrasse+169,+8802+Kilchberg,+Horgen,+Z%C3%BCrich,+Switzerland&z=15")
  cat = Location.create!(:name => "ZIS Baden",
				:address => "Burghaldenstrasse 6, 5400 Baden",
				:map => "http://maps.google.com/maps?f=q&source=s_q&hl=en&geocode=&q=Burghaldenstrasse+6,+5400+Baden&aq=&sll=47.320793,8.55082&sspn=0.012102,0.043945&ie=UTF8&hq=&hnear=Burghaldenstrasse+6,+5400+Baden,+Aargau,+Switzerland&z=15")
  cat = Location.create!(:name => "Im Brandt",
				:address => "Bodenstrasse 19, 8800 Thalwil",
				:map => "http://maps.google.com/maps?f=q&source=s_q&hl=en&geocode=&q=Bodenstrasse+19,+8800+Thalwil&aq=&sll=47.472574,8.302733&sspn=0.012067,0.043945&ie=UTF8&hq=&hnear=Bodenstrasse+19,+8800+Thalwil,+Horgen,+Z%C3%BCrich,+Switzerland&z=15")
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
	User.create! :username => 'smuntwyler', :email => 'smuntwyler@zis.ch', :password => 'stefmun', :password_confirmation => 'stefmun'
end  
