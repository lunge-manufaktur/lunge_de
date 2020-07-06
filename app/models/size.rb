# == Schema Information
#
# Table name: sizes
#
#  id         :integer          not null, primary key
#  name       :string
#  g1         :string
#  g1h        :string
#  g2         :string
#  g2h        :string
#  g3         :string
#  g3h        :string
#  g4         :string
#  g4h        :string
#  g5         :string
#  g5h        :string
#  g6         :string
#  g6h        :string
#  g7         :string
#  g7h        :string
#  g8         :string
#  g8h        :string
#  g9         :string
#  g9h        :string
#  g10        :string
#  g10h       :string
#  g11        :string
#  g11h       :string
#  g12        :string
#  g12h       :string
#  g13        :string
#  g13h       :string
#  g14        :string
#  g14h       :string
#  g15        :string
#  g16        :string
#  g17        :string
#  g18        :string
#  g19        :string
#  created_at :datetime
#  updated_at :datetime
#

class Size < ActiveRecord::Base

	# Associations

	has_many :products

	# Methods

  def sizes_array
    sizes_array = [g1, g1h, g2, g2h, g3, g3h, g4, g4h, g5, g5h, g6, g6h, g7, g7h, g8, g8h, g9, g9h, g10, g10h, g11, g11h, g12, g12h, g13, g13h, g14, g14h, g15, g16, g17, g18, g19]
  end

  def sizes_hash
  	sizes_hash = {
  		"g1" => g1,
  		"g1h" => g1h,
  		"g2" => g2,
  		"g2h" => g2h,
  		"g3" => g3,
  		"g3h" => g3h,
  		"g4" => g4,
  		"g4h" => g4h,
  		"g5" => g5,
  		"g5h" => g5h,
  		"g6" => g6,
  		"g6h" => g6h,
  		"g7" => g7,
  		"g7h" => g7h,
  		"g8" => g8,
  		"g8h" => g8h,
  		"g9" => g9,
  		"g9h" => g9h,
  		"g10" => g10,
  		"g10h" => g10h,
  		"g11" => g11,
  		"g11h" => g11h,
  		"g12" => g12,
  		"g12h" => g12h,
  		"g13" => g13,
  		"g13h" => g13h,
  		"g14" => g14,
  		"g14h" => g14h,
  		"g15" => g15,
  		"g16" => g16,
  		"g17" => g17,
  		"g18" => g18,
  		"g19" => g19
  	}
  end

end
