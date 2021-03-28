class Record < ApplicationRecord
    validates :book_name, {presence: true, length: {maximum: 100}}
    validates :user_id, {presence: true}

    scope :recent, -> {order(created_at: :desc)}

    def user
        return User.find_by(id: self.user_id)
    end
end
