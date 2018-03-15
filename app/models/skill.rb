class Skill < ApplicationRecord
  include Placeholder
  validates_presence_of :title, :percent_utilized
  after_initialize :set_defaults

  private
  def set_defaults
    self.badge ||= Placeholder.image_generator(height: '350', width: '250')
  end
end
