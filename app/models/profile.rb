class Profile < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb_image
  scope :ruby_on_rails_profile_items, -> { where(subtitle: 'Ruby on Rails')}
  after_initialize :set_defaults

  private
  def set_defaults
    self.main_image ||= "http://placehold.it/600x400"
    self.thumb_image ||= "http://placehold.it/200x200"
  end
end
