# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "PlanByFormats" do
    describe "Admin" do
      describe "plan_by_formats" do
        login_refinery_user

        describe "plan_by_formats list" do
          before(:each) do
            FactoryGirl.create(:plan_by_format, :name => "UniqueTitleOne")
            FactoryGirl.create(:plan_by_format, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.plan_by_formats_admin_plan_by_formats_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before(:each) do
            visit refinery.plan_by_formats_admin_plan_by_formats_path

            click_link "Add New Plan By Format"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::PlanByFormats::PlanByFormat.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Name can't be blank")
              Refinery::PlanByFormats::PlanByFormat.count.should == 0
            end
          end

          context "duplicate" do
            before(:each) { FactoryGirl.create(:plan_by_format, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.plan_by_formats_admin_plan_by_formats_path

              click_link "Add New Plan By Format"

              fill_in "Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::PlanByFormats::PlanByFormat.count.should == 1
            end
          end

        end

        describe "edit" do
          before(:each) { FactoryGirl.create(:plan_by_format, :name => "A name") }

          it "should succeed" do
            visit refinery.plan_by_formats_admin_plan_by_formats_path

            within ".actions" do
              click_link "Edit this plan by format"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            page.should have_content("'A different name' was successfully updated.")
            page.should have_no_content("A name")
          end
        end

        describe "destroy" do
          before(:each) { FactoryGirl.create(:plan_by_format, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.plan_by_formats_admin_plan_by_formats_path

            click_link "Remove this plan by format forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::PlanByFormats::PlanByFormat.count.should == 0
          end
        end

      end
    end
  end
end
