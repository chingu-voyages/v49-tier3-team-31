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
    base_rate: (i + 1) * 5,
    holiday_rate: (i + 1) * 7,
    additional_pet: i + 1,
    puppy_rate: (i + 1) * 6
  }
  day_care_prices = {
    base_rate: (i + 1) * 5,
    holiday_rate: (i + 1) * 8,
    additional_pet: (i + 1) * 2,
    puppy_rate: (i + 1) * 6
  }
  availability = i % 3 == 0 ? %w[s th f sa] : %w[s m t w th f sa]
  sizes = i % 2 == 0 ? %w[s m l] : %w[s m l xl]
  ["Dog Sitting", "Dog Boarding"].each do |service_type|
    service = {
      service_type: service_type,
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vel metus id mi volutpat vehicula id id augue. Phasellus venenatis enim est, id accumsan nisl varius vitae. Sed nulla quam, ultrices sollicitudin suscipit vel, pulvinar vel tortor.",
      price: service_type == "boarding" ? boarding_prices : day_care_prices,
      size: sizes,
      availability: availability,
      member_id: user.id
    }
    Service.find_or_create_by!(service)
  end
end

test_users.each_with_index do |user_data, i|
  user = User.find_or_create_by!(user_data) do |new_user|
    new_user.password = "randomuser#{i + 1}"
  end
  create_services(user, i)
end