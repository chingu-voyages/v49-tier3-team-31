# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

[
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
].each_with_index do |user, i|
  User.find_or_create_by!(user) do |new_user|
    new_user.password = "randomuser#{i + 1}"
  end
end