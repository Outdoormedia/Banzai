# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

system 'rake db:fixtures:load'

# Added by Refinery CMS Pages extension
Refinery::Pages::Engine.load_seed

# Added by Refinery CMS Plan By Formats extension
Refinery::PlanByFormats::Engine.load_seed

# Added by Refinery CMS Snapshots extension
Refinery::Snapshots::Engine.load_seed


Refinery::Snapshots::Snapshot.delete_all

samples = [{
               "market_sc" => "market_sydney",
               "demographic_sc" => "snapshot_demographic_w14_",
               "format_sc" => "planning_format_roadside_street_phone_booth",
               "number_of_days_1" => "14",
               "reaches_1" => [6.36804079895634, 10.2603424133915, 15.1303927284833, 20.1902914568064, 24.1305275327985, 27.5958716781756, 30.445878802895, 31.9177850449628, 35.398166970379, 38.2869725402412, 40.8988789052431, 42.410960373312, 44.5108153095356, 46.4327893091255, 48.3953275842204, 50.4336214902956, 52.2387156528719, 53.2156644768916, 55.6826955130352, 57.3529876902533, 58.4493605060327, 59.9746145982265, 61.0242651973239, 61.846519306343, 62.9733559961214, 64.2000307359639, 65.2319075819672, 66.3145044608871, 66.7843595852431, 67.3263718419046, 68.3009246607865, 69.1892958146805, 70.2761919766783, 71.2867756727165, 71.0312590063606],
               "number_of_days_2" => "28",
               "reaches_2" => [8.89358435961942, 14.0665702275335, 20.4553674751486, 26.8333071812741, 31.6975197791334, 35.8527979585442, 39.1969966919762, 40.7760718899326, 44.7478995564212, 48.0358633298294, 51.0445047804191, 52.6133844334603, 54.723009691717, 56.6421098878616, 58.5235488308682, 60.5954621884965, 62.4386464444671, 63.4123358097541, 65.8232599938954, 67.2871991265607, 68.2920202057188, 69.6503170485403, 70.5007483159791, 71.2302739520633, 72.2466808745716, 73.3898985004996, 74.2258735944468, 75.097817970383, 75.4491858457307, 75.8105792300842, 76.7234246909625, 77.5163887550413, 78.4329787388365, 79.2474033996776, 78.9061704046146],
               "x_labels" => [10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120, 130, 140, 150, 160, 170, 180, 190, 200, 210, 220, 230, 240, 250, 260, 270, 280, 290, 300, 310, 320, 330, 340, 350]
           },
           {
               "market_sc" => "market_sydney",
               "demographic_sc" => "snapshot_demographic_w14_",
               "format_sc" => "planning_format_roadside_b_b_25sqm_",
               "number_of_days_1" => "28",
               "reaches_1" => [8.82548842748711, 13.5638011913002, 19.819175674698, 24.9804458457316, 29.1543840471601, 32.780914710616, 37.7723759613766, 41.977599759313, 44.1021763008337, 45.9452243319649, 48.6081185684588, 50.5705106322997, 51.7286735658785, 54.5671465848114, 56.3040373586987, 57.5275909907536, 59.1536912654198, 60.6235018832554, 61.4754044410749, 63.0074675378707],
               "number_of_days_2" => "56",
               "reaches_2" => [11.6048545590126, 17.6401728033543, 25.2217855977422, 31.435135332598, 36.1913506812941, 40.3723838923904, 45.8614371427504, 50.5662911584287, 52.7972812879945, 54.6609856207813, 57.3730109290153, 59.3752057862053, 60.4475041711109, 63.2241954833074, 64.9945350448009, 66.1210683241064, 67.6795143973213, 69.0366308969757, 69.7818727878563, 71.0851693358835],
               "x_labels" => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
           },
           {
               "demographic_sc" => "snapshot_demographic_p14_",
               "format_sc" => "planning_format_roadside_b_b_25sqm_",
               "market_sc" => "market_melbourne",
               "number_of_days_1" => "28",
               "reaches_1" => [10.1580912023506, 15.7269503691699, 21.6333837139805, 26.3417666949514, 31.2018781227124, 36.3537446696415, 40.5538104925101, 44.68154699493, 48.289227735538, 51.1632194848004, 53.3627544696361, 55.8372989144132, 58.082863087446, 59.317543058834],
               "number_of_days_2" => "56",
               "reaches_2" => [13.105107672473, 19.9440968628307, 27.2761235255084, 32.8195613415876, 38.4378305547193, 44.2181262721196, 48.9944222110936, 53.3757419397045, 57.1640782606503, 60.1577936868729, 62.352078592851, 64.9161120745012, 67.0491982586929, 68.1699276173737],
               "x_labels" => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14],
           },
           {
               "demographic_sc" => "snapshot_demographic_p14_",
               "format_sc" => "planning_format_retail_retail_internal",
               "market_sc" => "market_melbourne",
               "number_of_days_1" => "14",
               "reaches_1" => [11.9920558807134, 17.6264944722276, 23.3871816232661, 27.9659683161704, 31.7809493635992, 35.0729293124567, 37.8878874750434, 40.0300656335148, 42.0045546508576, 43.7017967247558, 45.1447052333546, 46.5245515952469, 47.8026590083107, 48.9209399283748, 49.8820844272639, 50.8524631375255, 51.6124721490013, 52.1594987090387, 52.7431433766056],
               "number_of_days_2" => "28",
               "reaches_2" => [15.5457546231176, 22.3236433484717, 28.9974912043568, 34.0998507738288, 38.1986117102599, 41.6629127872867, 44.577441050449, 46.7439518822371, 48.7394445096674, 50.4058735664026, 51.7878752569114, 53.1317398582024, 54.3736792247834, 55.4656969090607, 56.353303622193, 57.2923406400684, 57.9947305916277, 58.4476347845102, 58.9824013135828],
               "x_labels" => [10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120, 130, 140, 150, 160, 170, 180, 190]
           },
           {
               "demographic_sc" => "snapshot_demographic_mgb",
               "format_sc" => "planning_format_retail_retail_internal",
               "market_sc" => "market_brisbane",
               "number_of_days_1" => "14",
               "reaches_1" => [13.6350257158916, 20.3294609095049, 26.9267858696211, 32.4948996622475, 37.1072334369893, 40.771693474789, 44.0211207382014, 46.9754656190086, 49.1440064630455, 51.3452788516558, 53.0455627873873, 54.5180704308946, 55.9392439000342, 57.3432242625466, 58.490564621566],
               "number_of_days_2" => "28",
               "reaches_2" => [17.8239225405166, 25.9458066065227, 33.7000400193641, 39.9848683305041, 44.9069140837679, 48.7574780827598, 52.105854678415, 55.072668222348, 57.210989755642, 59.3566796515592, 60.9763584279367, 62.3707222048661, 63.7247935074927, 65.0442596076699, 66.1183947986777],
               "x_labels" => [10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120, 130, 140, 150]
           },
           {
               "demographic_sc" => "snapshot_demographic_mgb",
               "format_sc" => "planning_format_transport_airport_internal",
               "market_sc" => "market_brisbane",
               "number_of_days_1" => "28",
               "reaches_1" => [2.87090992232734, 4.32124182606911, 5.71886409827509, 6.81144696574939, 7.79334779145655, 8.44098592194876, 9.1808538504397, 9.72537251351114, 10.1451405108194, 10.3325573645569, 10.6550842521082, 11.2873909931242, 11.3614723968687, 11.5871516190433, 11.8813240625229],
               "number_of_days_2" => "84",
               "reaches_2" => [6.48166293906139, 9.51011867895374, 12.3738128996298, 14.5963670193588, 16.4685258654041, 17.5639662927046, 18.935360637841, 19.963723812672, 20.6971558623581, 20.9725174776095, 21.4047404206397, 22.5572278089598, 22.7131221268259, 23.0916536996931, 23.5604674252567],
               "x_labels" => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
           },
           {
               "demographic_sc" => "snapshot_demographic_mgb",
               "format_sc" => "planning_format_transport_bus_rail_platform_concourse",
               "market_sc" => "market_brisbane",
               "number_of_days_1" => "7",
               "reaches_1" => [8.47466784025756, 10.6926432143244, 12.5962963959319, 13.7175208487307, 14.5665996448451, 15.2687521961921, 15.9752500621699, 16.4561310490167, 16.8279258168733, 17.2581216927024, 17.5197281172758, 17.7198692379334, 18.0206125902605, 18.3037798195282, 18.5447193904592, 18.6920424820851, 18.8611476729602, 19.0877838952496, 19.2494772867187, 19.3772619432566],
               "number_of_days_2" => "14",
               "reaches_2" => [11.4622191656869, 14.1659249886995, 16.3825376634299, 17.6945318507254, 18.7114689264003, 19.5694956839686, 20.4130183852214, 21.0026188518488, 21.4265728907793, 21.9391032228012, 22.2878911792853, 22.5269266756525, 22.9032363475858, 23.240958369421, 23.5133614195129, 23.6972735686985, 23.8773631856578, 24.1539058229009, 24.3760711626885, 24.5364128774427],
               "x_labels" => [10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120, 130, 140, 150, 160, 170, 180, 190, 200]
           },
           {
               "demographic_sc" => "snapshot_demographic_mgb",
               "market_sc" => "market_brisbane",
               "format_sc" => "planning_format_roadside_transit_external",
               "number_of_days_1" => "14",
               "reaches_1" => [4.68387757649702, 7.53094487059537, 10.6437558862564, 13.3414309556888, 15.8019679395397, 18.1072066082446, 20.1378187167423, 22.1146266284763, 23.6551974043979, 25.41627419348, 26.913994632873, 28.4551997449937, 29.6960584130109, 30.9858098240237, 32.02228458994],
               "number_of_days_2" => "28",
               "reaches_2" => [8.49420837930384, 13.1295581944408, 17.9635202214937, 21.8913169912105, 25.2670651958976, 28.3104705389007, 30.8774435641636, 33.296641689911, 35.1283297982192, 37.1474295644082, 38.8341304268545, 40.519995439295, 41.8283685448807, 43.1626806077935, 44.2696958115454],
               "x_labels" => [10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120, 130, 140, 150]
           }
]

samples.each do |sample|
  Refinery::Snapshots::Snapshot.create(sample)
end

