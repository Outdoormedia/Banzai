require 'spec_helper'

module Refinery
  module Snapshots
    describe Snapshot do
      describe "validations" do
        subject do
          FactoryGirl.create(:snapshot,
          :reaches_1 => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:reaches_1) { should == "Refinery CMS" }
      end
    end
  end
end
