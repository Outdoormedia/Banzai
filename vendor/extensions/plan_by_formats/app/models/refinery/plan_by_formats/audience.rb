module Refinery
  module PlanByFormats
    class Audience < Refinery::Core::BaseModel
      self.table_name = 'audiences'
      attr_accessible :demog_id, :region_code, :format_id, :weight, :reach, :contacts, :region_pop, :avg_freq, :duration, :market_id, :reach_persons

      #def self.import_csv
      #  self.delete_all
      #  require "csv"
      #  items = CSV::read("vendor/extensions/plan_by_formats/db/planning_weights.csv")
      #  fields = items.shift
      #  items.each do |item|
      #    p Selection.send(item[1])
      #    self.create(
      #        :market_id => Selection.send(item[0]).id,
      #        :format_id => Selection.send(item[1]).id,
      #    heavy: item[2],
      #    medium: item[3],
      #    light: item[4]
      #    )
      #
      #  end
      #end


      def self.translate_ids

=begin
        +-----+-----------------+-----------+-----+-----+----------+-----------+   +------------+-----------------+------------+---------------------+----------------+------------+-----------+-------------+-------------+---------------------+---------------------+
        | id  | name            | parent_id | lft | rgt | archived | system_id |   | id         | name            | parent_id  | system_code         | position_value | is_default | is_system | archived_at | original_id | created_at          | updated_at          |
        +-----+-----------------+-----------+-----+-----+----------+-----------+   +------------+-----------------+------------+---------------------+----------------+------------+-----------+-------------+-------------+---------------------+---------------------+
        | 560 | P14+            | 559       | 683 | 684 | false    |           |   | 645910813  | P14+            | 272542982  | planning_demogra... | 10             | false      |           |             |             | 2012-08-07 04:44... | 2012-08-07 04:44... |
        | 561 | P14-17          | 559       | 685 | 686 | false    |           |   | 830543971  | P14-17          | 272542982  | planning_demogra... | 20             | false      |           |             |             | 2012-08-07 04:44... | 2012-08-07 04:44... |
        | 562 | P18-24          | 559       | 687 | 688 | false    |           |   | 158573989  | P18-24          | 272542982  | planning_demogra... | 30             | false      |           |             |             | 2012-08-07 04:44... | 2012-08-07 04:44... |
        | 563 | P18-39          | 559       | 689 | 690 | false    |           |   | 786032736  | P18-39          | 272542982  | planning_demogra... | 40             | false      |           |             |             | 2012-08-07 04:44... | 2012-08-07 04:44... |
        | 564 | P25-39          | 559       | 691 | 692 | false    |           |   | 454249043  | P25-39          | 272542982  | planning_demogra... | 50             | false      |           |             |             | 2012-08-07 04:44... | 2012-08-07 04:44... |
        | 565 | P25-54          | 559       | 693 | 694 | false    |           |   | 871928168  | P25-54          | 272542982  | planning_demogra... | 60             | false      |           |             |             | 2012-08-07 04:44... | 2012-08-07 04:44... |
        | 566 | P40-54          | 559       | 695 | 696 | false    |           |   | 191272188  | P40-54          | 272542982  | planning_demogra... | 70             | false      |           |             |             | 2012-08-07 04:44... | 2012-08-07 04:44... |
        | 567 | P55+            | 559       | 697 | 698 | false    |           |   | 946686080  | P55+            | 272542982  | planning_demogra... | 80             | false      |           |             |             | 2012-08-07 04:44... | 2012-08-07 04:44... |
        | 569 | M18-39          | 568       | 701 | 702 | false    |           |   | 735233240  | M18-39          | 1038569357 | planning_demogra... | 10             | false      |           |             |             | 2012-08-07 04:44... | 2012-08-07 04:44... |
        | 570 | M25-39          | 568       | 703 | 704 | false    |           |   | 504915671  | M25-39          | 1038569357 | planning_demogra... | 20             | false      |           |             |             | 2012-08-07 04:44... | 2012-08-07 04:44... |
        | 571 | M25-54          | 568       | 705 | 706 | false    |           |   | 921943536  | M25-54          | 1038569357 | planning_demogra... | 30             | false      |           |             |             | 2012-08-07 04:44... | 2012-08-07 04:44... |
        | 572 | M40-54          | 568       | 707 | 708 | false    |           |   | 242071676  | M40-54          | 1038569357 | planning_demogra... | 40             | false      |           |             |             | 2012-08-07 04:44... | 2012-08-07 04:44... |
        | 573 | M55+            | 568       | 709 | 710 | false    |           |   | 255196440  | M55+            | 1038569357 | planning_demogra... | 50             | false      |           |             |             | 2012-08-07 04:44... | 2012-08-07 04:44... |
        | 575 | W18-39          | 574       | 713 | 714 | false    |           |   | 278094384  | W18-39          | 782873774  | planning_demogra... | 10             | false      |           |             |             | 2012-08-07 04:44... | 2012-08-07 04:44... |
        | 576 | W25-39          | 574       | 715 | 716 | false    |           |   | 626638883  | W25-39          | 782873774  | planning_demogra... | 20             | false      |           |             |             | 2012-08-07 04:44... | 2012-08-07 04:44... |
        | 577 | W25-54          | 574       | 717 | 718 | false    |           |   | 229776152  | W25-54          | 782873774  | planning_demogra... | 30             | false      |           |             |             | 2012-08-07 04:44... | 2012-08-07 04:44... |
        | 578 | W40-54          | 574       | 719 | 720 | false    |           |   | 892083852  | W40-54          | 782873774  | planning_demogra... | 40             | false      |           |             |             | 2012-08-07 04:44... | 2012-08-07 04:44... |
        | 579 | W55+            | 574       | 721 | 722 | false    |           |   | 828705140  | W55+            | 782873774  | planning_demogra... | 50             | false      |           |             |             | 2012-08-07 04:44... | 2012-08-07 04:44... |
        | 581 | OG1             | 580       | 725 | 726 | false    |           |   | 1063596145 | OG1             | 610744647  | planning_demogra... | 10             | false      |           |             |             | 2012-08-07 04:44... | 2012-08-07 04:44... |
        | 583 | $120k+          | 582       | 729 | 730 | false    |           |   | 562999754  | $120k+          | 209661199  | planning_demogra... | 10             | false      |           |             |             | 2012-08-07 04:44... | 2012-08-07 04:44... |
        | 585 | MGB             | 584       | 733 | 734 | false    |           |   | 988283977  | MGB             | 1035891121 | planning_demogra... | 10             | false      |           |             |             | 2012-08-07 04:44... | 2012-08-07 04:44... |
        | 586 | MGB Ch          | 584       | 735 | 736 | false    |           |   | 552499370  | MGB Ch          | 1035891121 | planning_demogra... | 20             | false      |           |             |             | 2012-08-07 04:44... | 2012-08-07 04:44... |
        | 588 | P2539 HI $120k+ | 587       | 739 | 740 | false    |           |   | 449835902  | P2539 HI $120k+ | 80047054   | planning_demogra... | 10             | false      |           |             |             | 2012-08-07 04:44... | 2012-08-07 04:44... |
        | 589 | P40+ HI $120k+  | 587       | 741 | 742 | false    |           |   | 114249639  | P40+ HI $120k+  | 80047054   | planning_demogra... | 20             | false      |           |             |             | 2012-08-07 04:44... | 2012-08-07 04:44... |
        | 590 | P2554 HI $120k+ | 587       | 743 | 744 | false    |           |   | 126136977  | P2554 HI $120k+ | 80047054   | planning_demogra... | 30             | false      |           |             |             | 2012-08-07 04:44... | 2012-08-07 04:44... |
                                                                                   +------------+-----------------+------------+---------------------+----------------+------------+-----------+-------------+-------------+---------------------+---------------------+


+-----+-------------------------------+-----------+-----+-----+----------+-----------+     +-----------+--------------------+-----------+---------------------+----------------+------------+-----------+-------------+-------------+--------------------+---------------------+
| id  | name                          | parent_id | lft | rgt | archived | system_id |     | id        | name               | parent_id | system_code         | position_value | is_default | is_system | archived_at | original_id | created_at         | updated_at          |
+-----+-------------------------------+-----------+-----+-----+----------+-----------+     +-----------+--------------------+-----------+---------------------+----------------+------------+-----------+-------------+-------------+--------------------+---------------------+
| 362 | B/B 25sqm+                    | 361       | 557 | 558 | false    |           |     | 721266742 | B/B 25sqm+         | 637246125 | planning_format_... | 10             | false      |           |             |             | 2012-08-07 04:4... | 2012-08-07 04:44... |
| 363 | B/B < 25sqm                   | 361       | 559 | 560 | false    |           |     | 48412521  | B/B < 25sqm        | 637246125 | planning_format_... | 20             | false      |           |             |             | 2012-08-07 04:4... | 2012-08-07 04:44... |
| 364 | Street - Bus/Tram/Kiosk/FSU   | 361       | 561 | 562 | false    |           |     | 382782505 | Street - Bus/Tr... | 637246125 | planning_format_... | 30             | false      |           |             |             | 2012-08-07 04:4... | 2012-08-07 04:44... |
| 365 | Street - Phone Booth          | 361       | 563 | 564 | false    |           |     | 768822876 | Street - Phone ... | 637246125 | planning_format_... | 40             | false      |           |             |             | 2012-08-07 04:4... | 2012-08-07 04:44... |
| 366 | Transit - External            | 361       | 565 | 566 | false    |           |     | 554945838 | Transit - External | 637246125 | planning_format_... | 50             | false      |           |             |             | 2012-08-07 04:4... | 2012-08-07 04:44... |
| 368 | Airport - Internal            | 367       | 569 | 570 | false    |           |     | 609829455 | Airport - Internal | 355718697 | planning_format_... | 10             | false      |           |             |             | 2012-08-07 04:4... | 2012-08-07 04:44... |
| 369 | Airport - Precinct            | 367       | 571 | 572 | false    |           |     | 106663969 | Airport - Precinct | 355718697 | planning_format_... | 20             | false      |           |             |             | 2012-08-07 04:4... | 2012-08-07 04:44... |
| 370 | Rail - Cross-track            | 367       | 573 | 574 | false    |           |     | 132229800 | Rail - Cross-track | 355718697 | planning_format_... | 30             | false      |           |             |             | 2012-08-07 04:4... | 2012-08-07 04:44... |
| 371 | Bus/Rail - Platform/Concourse | 367       | 575 | 576 | false    |           |     | 40657290  | Bus/Rail - Plat... | 355718697 | planning_format_... | 40             | false      |           |             |             | 2012-08-07 04:4... | 2012-08-07 04:44... |
| 372 | Transit - Internal            | 367       | 577 | 578 | false    |           |     | 843499612 | Transit - Internal | 355718697 | planning_format_... | 50             | false      |           |             |             | 2012-08-07 04:4... | 2012-08-07 04:44... |
| 374 | Retail - Internal             | 373       | 581 | 582 | false    |           |     | 569888463 | Retail - Internal  | 892997994 | planning_format_... | 10             | false      |           |             |             | 2012-08-07 04:4... | 2012-08-07 04:44... |
+-----+-------------------------------+-----------+-----+-----+----------+-----------+     +-----------+--------------------+-----------+---------------------+----------------+------------+-----------+-------------+-------------+--------------------+---------------------+

+----+--------------------+-----------+-----+-----+----------+-----------+              +------------+--------------------+-----------+--------------------+----------------+------------+-----------+-------------+-------------+--------------------+---------------------+
| id | name               | parent_id | lft | rgt | archived | system_id |              | id         | name               | parent_id | system_code        | position_value | is_default | is_system | archived_at | original_id | created_at         | updated_at          |
+----+--------------------+-----------+-----+-----+----------+-----------+              +------------+--------------------+-----------+--------------------+----------------+------------+-----------+-------------+-------------+--------------------+---------------------+
| 7  | City               | 6         | 11  | 12  | false    |           |              | 358961425  | City               | 793519994 | market_sydney_city | 10             | false      |           |             |             | 2012-08-07 04:4... | 2012-08-07 04:44... |
| 8  | North              | 6         | 13  | 14  | false    |           |              | 765061046  | North              | 793519994 | market_sydney_n... | 20             | false      |           |             |             | 2012-08-07 04:4... | 2012-08-07 04:44... |
| 9  | West               | 6         | 15  | 16  | false    |           |              | 854885082  | West               | 793519994 | market_sydney_west | 30             | false      |           |             |             | 2012-08-07 04:4... | 2012-08-07 04:44... |
| 10 | South West & South | 6         | 17  | 18  | false    |           |              | 506317767  | South West & South | 793519994 | market_sydney_s... | 40             | false      |           |             |             | 2012-08-07 04:4... | 2012-08-07 04:44... |
| 11 | North Shore        | 6         | 19  | 20  | false    |           |              | 1058288536 | North Shore        | 793519994 | market_sydney_n... | 50             | false      |           |             |             | 2012-08-07 04:4... | 2012-08-07 04:44... |
| 19 | East               | 18        | 23  | 24  | false    |           |              | 371624027  | East               | 419852329 | market_melbourn... | 10             | false      |           |             |             | 2012-08-07 04:4... | 2012-08-07 04:44... |
| 20 | Central & West     | 18        | 25  | 26  | false    |           |              | 799238945  | Central & West     | 419852329 | market_melbourn... | 20             | false      |           |             |             | 2012-08-07 04:4... | 2012-08-07 04:44... |
| 21 | South              | 18        | 27  | 28  | false    |           |              | 1073713165 | South              | 419852329 | market_melbourn... | 30             | false      |           |             |             | 2012-08-07 04:4... | 2012-08-07 04:44... |
| 22 | North              | 18        | 29  | 30  | false    |           |              | 583062973  | North              | 419852329 | market_melbourn... | 40             | false      |           |             |             | 2012-08-07 04:4... | 2012-08-07 04:44... |
| 23 | South East         | 18        | 31  | 32  | false    |           |              | 817538733  | South East         | 419852329 | market_melbourn... | 50             | false      |           |             |             | 2012-08-07 04:4... | 2012-08-07 04:44... |
| 13 | City South         | 12        | 35  | 36  | false    |           |              | 93051341   | City South         | 784278924 | market_brisbane... | 10             | false      |           |             |             | 2012-08-07 04:4... | 2012-08-07 04:44... |
| 14 | City North         | 12        | 37  | 38  | false    |           |              | 414489725  | City North         | 784278924 | market_brisbane... | 20             | false      |           |             |             | 2012-08-07 04:4... | 2012-08-07 04:44... |
| 15 | North              | 12        | 39  | 40  | false    |           |              | 14785118   | North              | 784278924 | market_brisbane... | 30             | false      |           |             |             | 2012-08-07 04:4... | 2012-08-07 04:44... |
| 16 | South              | 12        | 41  | 42  | false    |           |              | 501145578  | South              | 784278924 | market_brisbane... | 40             | false      |           |             |             | 2012-08-07 04:4... | 2012-08-07 04:44... |
| 17 | Gold Coast         | 12        | 43  | 44  | false    |           |              | 916619532  | Gold Coast         | 784278924 | market_brisbane... | 50             | false      |           |             |             | 2012-08-07 04:4... | 2012-08-07 04:44... |
| 31 | East               | 30        | 47  | 48  | false    |           |              | 56322273   | East               | 386227562 | market_adelaide... | 10             | false      |           |             |             | 2012-08-07 04:4... | 2012-08-07 04:44... |
| 32 | West               | 30        | 49  | 50  | false    |           |              | 1044537112 | West               | 386227562 | market_adelaide... | 20             | false      |           |             |             | 2012-08-07 04:4... | 2012-08-07 04:44... |
| 33 | South              | 30        | 51  | 52  | false    |           |              | 209124203  | South              | 386227562 | market_adelaide... | 30             | false      |           |             |             | 2012-08-07 04:4... | 2012-08-07 04:44... |
| 34 | North & Yorke      | 30        | 53  | 54  | false    |           |              | 6169490    | North & Yorke      | 386227562 | market_adelaide... | 40             | false      |           |             |             | 2012-08-07 04:4... | 2012-08-07 04:44... |
| 25 | City               | 24        | 57  | 58  | false    |           |              | 157292492  | City               | 661210674 | market_perth_city  | 10             | false      |           |             |             | 2012-08-07 04:4... | 2012-08-07 04:44... |
| 26 | East               | 24        | 59  | 60  | false    |           |              | 334033882  | East               | 661210674 | market_perth_east  | 20             | false      |           |             |             | 2012-08-07 04:4... | 2012-08-07 04:44... |
| 27 | South East         | 24        | 61  | 62  | false    |           |              | 17271463   | South East         | 661210674 | market_perth_so... | 30             | false      |           |             |             | 2012-08-07 04:4... | 2012-08-07 04:44... |
| 28 | South West         | 24        | 63  | 64  | false    |           |              | 1008647536 | South West         | 661210674 | market_perth_so... | 40             | false      |           |             |             | 2012-08-07 04:4... | 2012-08-07 04:44... |
| 29 | North              | 24        | 65  | 66  | false    |           |              | 532841846  | North              | 661210674 | market_perth_north | 50             | false      |           |             |             | 2012-08-07 04:4... | 2012-08-07 04:44... |
+----+--------------------+-----------+-----+-----+----------+-----------+              +------------+--------------------+-----------+--------------------+----------------+------------+-----------+-------------+-------------+--------------------+---------------------+


+----+-----------+-----------+-----+-----+----------+-----------+      +-----------+-----------+-----------+------------------+----------------+------------+-----------+-------------+-------------+-------------------------+-------------------------+
| id | name      | parent_id | lft | rgt | archived | system_id |      | id        | name      | parent_id | system_code      | position_value | is_default | is_system | archived_at | original_id | created_at              | updated_at              |
+----+-----------+-----------+-----+-----+----------+-----------+      +-----------+-----------+-----------+------------------+----------------+------------+-----------+-------------+-------------+-------------------------+-------------------------+
| 6  | Sydney    | 5         | 10  | 21  | false    |           |      | 793519994 | Sydney    | 732726732 | market_sydney    | 10             | false      | true      |             |             | 2012-08-07 04:44:51 UTC | 2012-08-07 04:44:51 UTC |
| 18 | Melbourne | 5         | 22  | 33  | false    |           |      | 419852329 | Melbourne | 732726732 | market_melbourne | 20             | false      | true      |             |             | 2012-08-07 04:44:51 UTC | 2012-08-07 04:44:51 UTC |
| 12 | Brisbane  | 5         | 34  | 45  | false    |           |      | 784278924 | Brisbane  | 732726732 | market_brisbane  | 30             | false      | true      |             |             | 2012-08-07 04:44:51 UTC | 2012-08-07 04:44:51 UTC |
| 30 | Adelaide  | 5         | 46  | 55  | false    |           |      | 386227562 | Adelaide  | 732726732 | market_adelaide  | 40             | false      | true      |             |             | 2012-08-07 04:44:51 UTC | 2012-08-07 04:44:51 UTC |
| 24 | Perth     | 5         | 56  | 67  | false    |           |      | 661210674 | Perth     | 732726732 | market_perth     | 50             | false      | true      |             |             | 2012-08-07 04:44:51 UTC | 2012-08-07 04:44:51 UTC |
+----+-----------+-----------+-----+-----+----------+-----------+      +-----------+-----------+-----------+------------------+----------------+------------+-----------+-------------+-------------+-------------------------+-------------------------+

=end


        formats = {362 => 721266742,
                   363 => 48412521,
                   364 => 382782505,
                   365 => 768822876,
                   366 => 554945838,
                   368 => 609829455,
                   369 => 106663969,
                   370 => 132229800,
                   371 => 40657290,
                   372 => 843499612,
                   374 => 569888463
        }

        demographics = {560 => 645910813,
                        561 => 830543971,
                        562 => 158573989,
                        563 => 786032736,
                        564 => 454249043,
                        565 => 871928168,
                        566 => 191272188,
                        567 => 946686080,
                        569 => 735233240,
                        570 => 504915671,
                        571 => 921943536,
                        572 => 242071676,
                        573 => 255196440,
                        575 => 278094384,
                        576 => 626638883,
                        577 => 229776152,
                        578 => 892083852,
                        579 => 828705140,
                        581 => 1063596145,
                        583 => 562999754,
                        585 => 988283977,
                        586 => 552499370,
                        588 => 449835902,
                        589 => 114249639,
                        590 => 126136977}


        markets = { 6 => 793519994,
            18 => 419852329,
            12 => 784278924,
            30 => 386227562,
            24 => 661210674
        }


        demographics.each do |demographic_old, demographic_new|
          p demographic_old
          Audience.update_all("demog_id = #{demographic_new}", "demog_id = #{demographic_old}")
        end

        formats.each do |format_old, format_new|
          p format_old
          Audience.update_all("format_id = #{format_new}", "format_id = #{format_old}")
        end

        markets.each do |market_old, market_new|
          p market_old
          Audience.update_all("market_id = #{market_new}", "market_id = #{market_old}")
        end
      end
    end
  end
end
