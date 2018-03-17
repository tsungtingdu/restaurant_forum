namespace :dev do
  task fake_restaurant: :environment do
    Restaurant.destroy_all

    # 500.times do |i|
    #   Restaurant.create!(name: "restaurant#{i.to_s}",
    #     opening_hours: "11:00",
    #     tel: "02-1234-5678",
    #     address: "my_address",
    #     description: "Here is description of the restaurant"
    #   )
    # end

    500.times do |i|
      Restaurant.create!(name: FFaker::Name.first_name,
        opening_hours: FFaker::Time.datetime,
        tel: FFaker::PhoneNumber.short_phone_number,
        address: FFaker::Address.street_address,
        description: FFaker::Lorem.paragraph,
        category: Category.all.sample
      )
    end
    puts "have created fake restaurants"
    puts "now you have #{Restaurant.count} restaurants data"
  end

  task fake_user: :environment do
    User.destroy_all

    100.times do |i|
      User.create!(email: FFaker::Internet.safe_email, 
        password: FFaker::Internet.password)        
    end
    puts "have created fake users"
    puts "now you have #{User.count} restaurants data"    
  end 

  task fake_comment: :environment do
    Comment.destroy_all

    Restaurant.all.each do |restaurant|
      3.times do |i|
        restaurant.comments.create!(
          content: FFaker::Lorem.sentences,
          user: User.all.sample)
      end
    end
    puts "have created fake users"
    puts "now you have #{Comment.count} restaurants data"  
  end
  
end

