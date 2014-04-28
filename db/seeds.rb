# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


posts = [
	{
		title: "A title",
		subtitle: "Subtitle",
		content: "This is the content",
		is_published: true
	}
]

posts.each do |post|
	Post.find_or_create_by_title!(post)
end