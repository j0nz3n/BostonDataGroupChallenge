class JobPostingsController < ApplicationController
  before_action :set_job_posting, only: [:edit, :show]

  def create
    @job_posting = JobPosting.new(job_posting_params)

    if @job_posting.save
      redirect_to @job_posting
    else
      render :new
    end
  end

  def edit; end

  def index
    # @job_postings = @job_postings.paginate(:page => 1, :per_page => 1)
    @job_postings = JobPosting.paginate(page: params[:page])
      .includes(:job_poster, :category, :location)
      .decorate
      
  end

  def new
    @job_posting = JobPosting.new
  end

  def show; end

  def update
    @job_posting = JobPosting.find(params[:id])

    if @job_posting.update(job_posting_params)
      redirect_to @job_posting
    else
      render :edit
    end
  end

  private

  def job_posting_params
    params.require(:job_posting)
      .permit(:title, :job_poster_id, :category_id, :location_id, :status, :description)
  end

  def set_job_posting
    @job_posting = JobPosting.find(params[:id]).decorate
  end
end
