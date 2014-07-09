require 'spec_helper'

  describe "Home page" do
  
    subject { page }
    
    before { visit root_path }
    it { should have_button "Insert Job" }

    describe "insert job" do
      it "should stay on the same page" do
        click_button "Insert Job"
        current_path.should eq root_path
      end

      it "should create a pending job" do
        expect { click_button "Insert Job" }.to change(Job, :count).by(1)
        Job.last.status.should eq "Pending"
      end
    end
  end
