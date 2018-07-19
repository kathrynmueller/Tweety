class Tweet < ApplicationRecord

	# associations
	belongs_to :user

	# validations
	validates :message, presence: true
	validates :message, length: { maximum: 280, too_long: "Tweets are limited to 280 characters max"}

end
