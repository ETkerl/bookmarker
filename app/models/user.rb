class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #display only these specified field
  # def as_json(options)
  #   super({ only: %i[id email created_at] }.merge(options))
  # end
end
