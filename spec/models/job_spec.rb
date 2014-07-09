require 'spec_helper'

describe Job do
  describe "create" do
    it "should create and return a new job with default attributes" do
      expect { @job = Job.create }.to change(Job, :count).by(1)
      @job.should_not be_nil
      @job.status.should eq Job::PENDING
      @job.message.should be_nil
      @job.job_start.should be_nil
      @job.job_stop.should be_nil
      @job.data_file.should eq './data/ctt_data.csv'
      @job.key_file.should eq './data/ctt_data.key.csv'
    end
  end

  describe "duration" do
    context "when stop and start times are set" do
      before do 
        @job = Job.new 
        @job.job_start = Time.utc(2010, 01, 20, 13, 34, 46)
        @job.job_stop = Time.utc(2010, 01, 20, 13, 36, 15)
      end
      
      it "should calculate the proper duration" do
        @job.duration.should eq 89.0
      end
    end

    context "when stop time is not set" do
      before do
        @job = Job.new 
        @job.job_start = Time.utc(2010, 01, 20, 13, 34, 46)
      end

      it "should return an empty string" do
        @job.duration.should eq ""
      end
    end

    context "when start time is not set" do
      before do
        @job = Job.new 
        @job.job_stop = Time.utc(2010, 01, 20, 13, 36, 15)
      end

      it "should return an empty string" do
        @job.duration.should eq ""
      end
    end

    context "when neither start nor stop time are set" do
      before do
        @job = Job.new 
      end

      it "should return an empty string" do
        @job.duration.should eq ""
      end
    end
  end

  private
    def check_start_time(job)
      job.job_start.year.should eq Time.now.utc.year
      job.job_start.month.should eq Time.now.utc.month
      job.job_start.day.should eq Time.now.utc.day
      job.job_start.hour.should eq Time.now.utc.hour
      job.job_start.min.should eq Time.now.utc.min
    end
end
