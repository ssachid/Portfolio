class Profile < ApplicationRecord
  has_many :technologies
  accepts_nested_attributes_for :technologies,
                                reject_if: lambda { |attrs| attrs[:name].blank? }
  include Placeholder
  validates_presence_of :title, :body, :main_image, :thumb_image
  scope :ruby_on_rails_profile_items, -> { where(subtitle: 'Ruby on Rails')}
  after_initialize :set_defaults

  private
  def set_defaults
    self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
    self.thumb_image ||= Placeholder.image_generator(height: '350', width: '250')
  end
end
