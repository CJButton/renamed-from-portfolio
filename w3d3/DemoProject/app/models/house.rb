





#
# create_table "houses_tables", force: :cascade do |t|
#   t.string   "address"
#   t.datetime "created_at"
#   t.datetime "updated_at"
# end



class House < ActiveRecord::Base
  validates :address, presence: true
  has_many :people,
    primary_key: :id,
    foreign_key: :house_id,
    class_name: 'Person'



end
