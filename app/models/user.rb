# frozen_string_literal: true

class User < ApplicationRecord
  acts_as_paranoid

  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable, :omniauthable,
         omniauth_providers: [:facebook]

  has_many :resources, as: :provider
  has_and_belongs_to_many :accounts
  has_and_belongs_to_many :projects

  enum role: %i[leader member ambassador]

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :volunteer, inclusion: { in: [true, false] }

  def self.from_facebook(auth)
    where(provider: auth.provider, uid: auth.uid).first || create_from_facebook(auth)
  end

  def self.create_from_facebook(auth)
    name = auth.info.name.split(' ')
    user = new(
      last_name: name[-1], first_name: name[0], email: auth.info.email,
      password: Devise.friendly_token[0, 20], provider: auth.provider, uid: auth.uid
    )
    user.skip_confirmation!
    user.save!

    user
  end
end
