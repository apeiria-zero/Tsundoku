class User < ApplicationRecord
    has_secure_password
    validates :name, {presence: true,uniqueness: true}

    def records
        return Record.where(user_id: self.id)
    end
end
