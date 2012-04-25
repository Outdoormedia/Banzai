require 'spec_helper'

module Refinery
  module PlanByFormats
    describe PlanByFormat do
      describe "validations" do
        subject do
          FactoryGirl.create(:plan_by_format,
          :name => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:name) { should == "Refinery CMS" }
      end
    end
  end
end
