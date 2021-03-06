# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Snapshots" do
    describe "Admin" do
      describe "snapshots" do
        login_refinery_user

        describe "snapshots list" do
          before(:each) do
            FactoryGirl.create(:snapshot, :reaches_1 => "UniqueTitleOne")
            FactoryGirl.create(:snapshot, :reaches_1 => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.snapshots_admin_snapshots_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before(:each) do
            visit refinery.snapshots_admin_snapshots_path

            click_link "Add New Snapshot"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Reaches 1", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Snapshots::Snapshot.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Reaches 1 can't be blank")
              Refinery::Snapshots::Snapshot.count.should == 0
            end
          end

          context "duplicate" do
            before(:each) { FactoryGirl.create(:snapshot, :reaches_1 => "UniqueTitle") }

            it "should fail" do
              visit refinery.snapshots_admin_snapshots_path

              click_link "Add New Snapshot"

              fill_in "Reaches 1", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Snapshots::Snapshot.count.should == 1
            end
          end

        end

        describe "edit" do
          before(:each) { FactoryGirl.create(:snapshot, :reaches_1 => "A reaches_1") }

          it "should succeed" do
            visit refinery.snapshots_admin_snapshots_path

            within ".actions" do
              click_link "Edit this snapshot"
            end

            fill_in "Reaches 1", :with => "A different reaches_1"
            click_button "Save"

            page.should have_content("'A different reaches_1' was successfully updated.")
            page.should have_no_content("A reaches_1")
          end
        end

        describe "destroy" do
          before(:each) { FactoryGirl.create(:snapshot, :reaches_1 => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.snapshots_admin_snapshots_path

            click_link "Remove this snapshot forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Snapshots::Snapshot.count.should == 0
          end
        end

      end
    end
  end
end
