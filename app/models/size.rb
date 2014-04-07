# == Schema Information
#
# Table name: sizes
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  g1         :string(255)
#  g1h        :string(255)
#  g2         :string(255)
#  g2h        :string(255)
#  g3         :string(255)
#  g3h        :string(255)
#  g4         :string(255)
#  g4h        :string(255)
#  g5         :string(255)
#  g5h        :string(255)
#  g6         :string(255)
#  g6h        :string(255)
#  g7         :string(255)
#  g7h        :string(255)
#  g8         :string(255)
#  g8h        :string(255)
#  g9         :string(255)
#  g9h        :string(255)
#  g10        :string(255)
#  g10h       :string(255)
#  g11        :string(255)
#  g11h       :string(255)
#  g12        :string(255)
#  g12h       :string(255)
#  g13        :string(255)
#  g13h       :string(255)
#  g14        :string(255)
#  g14h       :string(255)
#  g15        :string(255)
#  g16        :string(255)
#  g17        :string(255)
#  g18        :string(255)
#  g19        :string(255)
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

end
