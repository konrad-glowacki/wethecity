# frozen_string_literal: true

class User < ApplicationRecord
  extend FriendlyId
  include Users::FacebookAuth

  # Soft delete
  acts_as_paranoid

  # Friendly URL's
  friendly_id :full_name, use: :slugged

  # Images
  mount_uploader :avatar, AvatarUploader

  # Authentication
  devise :database_authenticatable, :async, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable, :omniauthable,
         omniauth_providers: [:facebook]

  # Properties
  enum role: %i[leader member ambassador]

  # Relations
  has_many :engagements, as: :provider
  has_many :founders, as: :member
  has_many :projects, through: :founders
  has_and_belongs_to_many :accounts
  has_and_belongs_to_many :resources

  # Validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :volunteer, inclusion: { in: [true, false] }

  # Instance Methods
  def full_name
    "#{first_name} #{last_name}"
  end
end
