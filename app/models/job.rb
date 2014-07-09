require 'carrierwave'

class Job < ActiveRecord::Base
attr_accessible :key_file, :data_file
  mount_uploader :key_file, FileUploader
  mount_uploader :data_file, FileUploader

  PENDING = "Pending"
  PROCESSING = "Processing"
  DONE = "Done" 

  def duration
    if job_start.nil? || job_stop.nil?
      ""
    else
      (job_stop - job_start).round(5)
    end
  end

  def total_duration
    if created_at.nil? || job_stop.nil?
      ""
    else
      (job_stop - created_at).round(5)
    end
  end
end
