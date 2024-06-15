module ReviewsHelper
  def star_rating(rating)
    full_star = '<svg class="w-4 h-4 text-yellow-300 me-1" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20"><path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/></svg>'
    empty_star = '<svg class="w-4 h-4 text-gray-300 me-1" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20"><path d="M11 .25a1.534 1.534 0 0 1 1.278.742l2.259 4.577 5.051.734a1.534 1.534 0 0 1 .852 2.614l-3.656 3.563.863 5.031a1.532 1.532 0 0 1-2.226 1.616L11 17.033l-4.518 2.375a1.532 1.532 0 0 1-2.226-1.617l.863-5.03L1.463 9.2a1.535 1.535 0 0 1 .852-2.614l5.051-.734L9.625.992A1.534 1.534 0 0 1 11 .25Z"/></svg>'
    stars = rating.to_i.times.map { full_star }.join.html_safe
    stars += (5 - rating.to_i).times.map { empty_star }.join.html_safe
    stars
  end
end
