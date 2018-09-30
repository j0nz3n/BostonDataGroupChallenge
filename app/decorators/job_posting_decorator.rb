class JobPostingDecorator < ApplicationDecorator
  delegate_all
  decorates_association :location

  delegate :city, to: :location, prefix: true
  delegate :full_address, to: :location, prefix: true
  delegate :current_page, :total_pages, :limit_value

  def category_name
    category.name.titleize
  end

  def poster_name
    job_poster.full_name
  end

  def status
    object.status.titleize
  end
end
