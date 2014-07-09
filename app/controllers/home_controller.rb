class HomeController < ApplicationController

  def index
    @job = Job.new
    @jobs = Job.order("id DESC").all
  end

  def create
    @job = Job.new(params[:job])
    @job.status = "Pending"
    @job.save

    redirect_to root_path
  end
end
