namespace :csvimport do

  #desc "Import CSV Data."
  task :import_csv_data => :environment do

    require 'csv'
    #require 'Users'

    csv_file_path = '/Users/ahaidry/Desktop/CIT_597/yelp_academic_dataset_business.csv'

    
    c=User.new
    csv_text = File.read('/Users/ahaidry/Desktop/CIT_597/yelp_academic_dataset_business.csv')
# puts csv_text
csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      puts "csv not empty"
    # if(row != nil)
      c=User.new
      #c.business_id = 
      #puts row
      #puts row['business_id']
      #puts row['business_id'].to_s
      #puts row['business_id']
      c.business_id=row['business_id']
      c.full_address = row['full_address']
      if(row.has_key?('categories'))
        #puts row['categories']
        category=""
        row['categories'].split("'")[1...-1].each do |c|
          if !c.eql?', u' or !c.include?','
            category=c+":"+category
          end
        end
        c.categories = category
      else
        c.categories = ""
      end
      if(row.has_key?('city'))
        puts row['city']
        c.city = row['city']
      else
        c.city=""
      end
      if(!row.has_key?('review_count'))
        c.review_count=0
      else
        c.review_count=row['review_count']
      end
      c.name = row['name']
      c.state = row['state']
      c.price_range = row['price_range']
      if(!row.has_key?('attributes.Wi-Fi'))
        c.wifi = row['attributes.Wi-Fi']
      else
        c.wifi=false
      end
      if(row.has_key?('attributes.Parking.street')||row.has_key?('attributes.Parking.garage')||row.has_key?('attributes.Parking.valet')||row.has_key?('attributes.Parking.lot'))
        c.parking = true
      else
        c.parking=false
      end
      # Users.create!({:parking => row['attributes.Parking']})
      if(row.has_key?('attributes.Delivery'))
        c.delivery = row['attributes.Delivery']
      else 
        c.delivery = false
      end

      if(row.has_key?('attributes.Outdoor Seating'))
        c.outdoor_seating = row['attributes.Outdoor Seating']
      else
        c.outdoor_seating = false
      end

      if(row.has_key?('stars'))
        c.rating = row['stars']
      else
        c.rating = 3.0
      end
      c.save
      c=User.new
   end
  end
end
