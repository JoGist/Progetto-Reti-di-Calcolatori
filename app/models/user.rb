class User < ApplicationRecord
has_many :reviews, dependent: :destroy
has_many :friends

    def self.from_omniauth(auth)
        where(email: auth.info.email).first_or_initialize do |user|
            user.username = auth.info.name
            user.email = auth.info.email
        end
    end

end
