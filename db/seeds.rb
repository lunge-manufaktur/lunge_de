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

stores = [
	{
		id: 1,
		name: "Barmbek / Fuhlsbüttler Straße",
		address_name: "Lunge Der Laufladen GmbH",
		street: "Fuhlsbüttler Straße 29",
		zip: "22305",
		city: "Hamburg",
		phone: "040 297728",
		email: "l.hh@lunge.de",
		latitude: 53.58535,
		longitude: 10.04607,
		google_maps_place_id: "ChIJ67GZ4UiJsUcRJ4uMagrF9Fk",
		panorama_embed_url: "https://cdn.lunge.de/images/panorama/1"
	},
	{
		id: 3,
		name: "City / Ferdinandstraße",
		address_name: "Lunge Der Laufladen GmbH",
		street: "Ferdinandstraße 55-57",
		zip: "20095",
		city: "Hamburg",
		phone: "040 321430",
		email: "f.hh@lunge.de",
		latitude: 53.55316,
		longitude: 9.99859,
		google_maps_place_id: "ChIJVz2DbR6PsUcR16lDRPsiM-4",
		panorama_embed_url: "https://cdn.lunge.de/images/panorama/3"
	},
	{
		id: 4,
		name: "Bahrenfeld / Bahrenfelder Steindamm",
		address_name: "Lunge Der Laufladen GmbH",
		street: "Bahrenfelder Steindamm 109",
		zip: "22761",
		city: "Hamburg",
		phone: "040 27866878",
		email: "s.hh@lunge.de",
		latitude: 53.5637573213048,
		longitude: 9.91914119571447,
		google_maps_place_id: "ChIJ_-2QzJSFsUcRvpRVx66CJlY",
		panorama_embed_url: "https://cdn.lunge.de/images/panorama/4"
	},
	{
		id: 5,
		name: "Charlottenburg / Bismarckstraße",
		address_name: "Lunge Der Laufladen GmbH",
		street: "Bismarckstraße 101",
		zip: "10625",
		city: "Berlin",
		phone: "030 91555959",
		email: "b.b@lunge.de",
		latitude: 52.5117454,
		longitude: 13.3129746,
		google_maps_place_id: "ChIJ5T323_ZQqEcRU32afQtxolI",
		panorama_embed_url: "https://cdn.lunge.de/images/panorama/5"
	}
]

posts.each do |post|
	Post.create(post)
end

Store.destroy_all
stores.each do |store|
	Store.create(store)
end
