require 'securerandom'

class ShortenedUrl < ApplicationRecord 
  validates :short_url, presence: true 
  validates :short_url, uniqueness: true
  validates :long_url, presence: true 
  validates :long_url, uniqueness: true
  validates :user_id, presence: true 
  validates :user_id, uniqueness: true

  def self.random_code 
    coded = SecureRandom.urlsafe_base64
    while ShortenedUrl.exists?(short_url: coded)
      coded = SecureRandom.urlsafe_base64
    end
    coded
  end

  def self.create!(user, long_url)
    ShortenedUrl.new(long_url: long_url, short_url: ShortenedUrl.random_code, user_id: user.id)
  end

  belongs_to :submitter,
    class_name: :User,
    foreign_key: :user_id,
    primary_key: :id

  
  def num_clicks
    clicks = Visit.all.select {|visit| visit.url_id == self.id}
    clicks.count
  end 

  def num_uniques
    uniques = Visit.all.select {|visit| visit.user_id == self.id}
    uniques.count
  end 

end

