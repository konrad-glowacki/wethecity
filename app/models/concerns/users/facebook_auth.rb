# frozen_string_literal: true

require 'splitter/full_name'
require 'active_support/concern'

module Users
  module FacebookAuth
    extend ActiveSupport::Concern

    class_methods do
      def from_facebook(auth)
        where(provider: auth.provider, uid: auth.uid).first || create_from_facebook!(auth)
      end

      private

      def initialize_from_facebook(auth)
        name_splitter = Splitter::FullName.new(auth.info.name)

        new(
          uid: auth.uid, provider: auth.provider,
          first_name: name_splitter.first_name, last_name: name_splitter.last_name,
          email: auth.info.email, remote_avatar_url: auth.info.image,
          password: Devise.friendly_token[0, 20]
        )
      end

      def create_from_facebook!(auth)
        user = initialize_from_facebook(auth)
        user.skip_confirmation!
        user.save!
        user
      end
    end
  end
end
