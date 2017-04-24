# == Schema Information
#
# Table name: toys
#
#  id           :integer          not null, primary key
#  name         :string
#  toyable_id   :integer
#  toyable_type :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Toy < ActiveRecord::Base
end
