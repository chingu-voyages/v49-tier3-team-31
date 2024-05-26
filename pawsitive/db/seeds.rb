test_users = [
  {
    first_name: "James",
    last_name: "Cameron",
    role: 1,
    email: "james@cameron.com",
    price: 5,
    bio: "I love dogs and making movie!"
  },
  {
    first_name: "Jane",
    last_name: "Doe",
    role: 1,
    email: "jane@doe.com",
    price: 4,
    bio: "All dogs are beautiful, but puppies are the best!"
  },
  {
    first_name: "Dale",
    last_name: "Henderson",
    role: 1,
    email: "dale@henderson.com",
    price: 3,
    bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vel metus id mi volutpat vehicula id id augue. Phasellus venenatis enim est, id accumsan nisl varius vitae. Sed nulla quam, ultrices sollicitudin suscipit vel, pulvinar vel tortor. Suspendisse accumsan non justo et vestibulum. Maecenas placerat consequat elit non cursus."
  },
  {
    first_name: "Julie",
    last_name: "Cook",
    role: 1,
    email: "julie@cook.com",
    price: 4,
    bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vel metus id mi volutpat vehicula id id augue. Phasellus venenatis enim est, id accumsan nisl varius vitae. Sed nulla quam, ultrices sollicitudin suscipit vel, pulvinar vel tortor. Suspendisse accumsan non justo et vestibulum. Maecenas placerat consequat elit non cursus."
  },
  {
    first_name: "Tony",
    last_name: "Sutton",
    role: 1,
    email: "tony@sutton.com",
    price: 5,
    bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vel metus id mi volutpat vehicula id id augue. Phasellus venenatis enim est, id accumsan nisl varius vitae. Sed nulla quam, ultrices sollicitudin suscipit vel, pulvinar vel tortor. Suspendisse accumsan non justo et vestibulum. Maecenas placerat consequat elit non cursus."
  },
  {
    first_name: "Jeff",
    last_name: "Vargas",
    role: 1,
    email: "jeff@vargas.com",
    price: 6,
    bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vel metus id mi volutpat vehicula id id augue. Phasellus venenatis enim est, id accumsan nisl varius vitae. Sed nulla quam, ultrices sollicitudin suscipit vel, pulvinar vel tortor. Suspendisse accumsan non justo et vestibulum. Maecenas placerat consequat elit non cursus."
  },
  {
    first_name: "Derek",
    last_name: "Chambers",
    role: 1,
    email: "derek@chambers.com",
    price: 7,
    bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vel metus id mi volutpat vehicula id id augue. Phasellus venenatis enim est, id accumsan nisl varius vitae. Sed nulla quam, ultrices sollicitudin suscipit vel, pulvinar vel tortor. Suspendisse accumsan non justo et vestibulum. Maecenas placerat consequat elit non cursus."
  },
  {
    first_name: "Danny",
    last_name: "Holland",
    role: 1,
    email: "danny@holland.com",
    price: 8,
    bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vel metus id mi volutpat vehicula id id augue. Phasellus venenatis enim est, id accumsan nisl varius vitae. Sed nulla quam, ultrices sollicitudin suscipit vel, pulvinar vel tortor. Suspendisse accumsan non justo et vestibulum. Maecenas placerat consequat elit non cursus."
  },
  {
    first_name: "Nora",
    last_name: "Hanson",
    role: 1,
    email: "nora@hanson.com",
    price: 9,
    bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vel metus id mi volutpat vehicula id id augue. Phasellus venenatis enim est, id accumsan nisl varius vitae. Sed nulla quam, ultrices sollicitudin suscipit vel, pulvinar vel tortor. Suspendisse accumsan non justo et vestibulum. Maecenas placerat consequat elit non cursus."
  },
  {
    first_name: "Hannah",
    last_name: "Porter",
    role: 1,
    email: "hannah@porter.com",
    price: 10,
    bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vel metus id mi volutpat vehicula id id augue. Phasellus venenatis enim est, id accumsan nisl varius vitae. Sed nulla quam, ultrices sollicitudin suscipit vel, pulvinar vel tortor. Suspendisse accumsan non justo et vestibulum. Maecenas placerat consequat elit non cursus."
  }
]

def create_services(user, i)
  boarding_prices = {
    "small_dog" => (i + 1) * 5,
    "medium_dog" => (i + 1) * 7,
    "large_dog" => (i + 1) * 9,
    "giant_dog" => (i + 1) * 11
  }
  day_care_prices = {
    "small_dog" => (i + 1) * 4,
    "medium_dog" => (i + 1) * 6,
    "large_dog" => (i + 1) * 8,
    "giant_dog" => (i + 1) * 10
  }
  
  availability = {
    "Monday" => { "open" => "08:00", "close" => "20:00" },
    "Tuesday" => { "open" => "08:00", "close" => "20:00" },
    "Wednesday" => { "open" => "08:00", "close" => "20:00" },
    "Thursday" => { "open" => "08:00", "close" => "20:00" },
    "Friday" => { "open" => "08:00", "close" => "20:00" }
  }
  
  sizes = {
    "small" => "0-15 lb",
    "medium" => "16-40 lb",
    "large" => "41-100 lb",
    "giant" => "101+ lb"
  }

  ["Day Care", "Boarding", "Sitting"].each do |service_type|
    service = Service.find_or_create_by(
      service_type: service_type,
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      price: service_type == "Boarding" ? boarding_prices : day_care_prices,
      size: sizes,
      member_id: user.id,
      pet_number: i < 2 ? (i+1).to_s : "3+",
      pet_types: i > 5 ? ["dog", "cat"] : ["dog"]
    )
  
    create_availabilities(service, availability)
  end
end

def create_availabilities(service, availability)
  availability.each do |day, times|
    start_time = Time.parse(times["open"])
    end_time = Time.parse(times["close"])
    (Date.today..(Date.today + 30)).each do |date|
      next unless date.strftime('%A') == day

      Availability.find_or_create_by!(
        service: service,
        date: date,
        start_time: start_time,
        end_time: end_time,
        available: true
      )
    end
  end
end

test_users.each_with_index do |user_data, i|
  user = User.find_or_create_by!(user_data) do |new_user|
    new_user.password = "randomuser#{i + 1}"
  end
  create_services(user, i)
end