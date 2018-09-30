class JobPosting < ApplicationRecord
  belongs_to :job_poster
  belongs_to :category
  belongs_to :location

  enum status: {
    new_post: 0,
    pending: 1,
    complete: 2
  }

  validates :title, :description, presence: true

  after_initialize :set_defaults

  private

  def set_defaults
    self.posted_at ||= Time.zone.now
    self.status ||= statuses[:new_post]
  end
end
