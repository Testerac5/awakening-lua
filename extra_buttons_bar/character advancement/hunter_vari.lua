-- Documentation {5176, 2, 0, 1} {Spellid, Ability Essence,  Talent Essence, Required Level}
-- Make sure to adjust Count if you add or subtract any spells
-- talent documentation {5,{16814,16814,16814,16814,16814},0,1,10,2,762} {number of ranks, {spellids}, AE cost, TE cost, required level,
-- 																															column, talentId}
-- talents tab variables refers to talenttab dbc

hunter_beastmastery_spells = {{13163, 2, 0, 4}, {883, 2, 0, 10}, {1515, 2, 0, 10}, {2641, 2, 0, 10}, {6991, 2, 0, 10}, {13165, 2, 0, 10},
{982, 2, 0, 10}, {136, 2, 0, 12}, {6197, 2, 0, 14}, {1513, 2, 0, 14}, {1002, 2, 0, 14}, {5118, 2, 0, 16},
{34074, 2, 0, 20}, {1462, 2, 0, 24}, {13161, 2, 0, 30}, {13159, 2, 0, 40}, {20043, 2, 0, 46}, {34026, 2, 0, 66},
{61846, 2, 0, 74}, {53271, 2, 0, 75}, {62757, 2, 0, 80}}

hunter_beastmastery_spells_count = 21
hunter_beastmastery_bgs = {"Interface\\TalentFrame\\HunterBeastmastery-TopLeft", "Interface\\TalentFrame\\HunterBeastmastery-TopRight",
"Interface\\TalentFrame\\HunterBeastmastery-BottomLeft", "Interface\\TalentFrame\\HunterBeastmastery-BottomRight"}

hunter_beastmastery_talents = {{5,{19552,19553,19554,19555,19556},0,1,10,2,1382}, {5,{19583,19584,19585,19586,19587},0,1,10,3,1389}, 
{2,{35029,35030},0,1,15,1,1624},{3,{19549,19550,19551},0,1,15,2,1381}, {3,{19609,19610,19612},0,1,15,3,1395}, {2,{24443,19575},0,1,15,4,1625}, 
{2,{19559,19560},0,1,20,1,1384}, {1,{53265},0,1,20,2,2138}, {5,{19616,19617,19618,19619,19620},0,1,20,3,1396}, 
{2,{19572,19573},0,1,25,2,1385}, {5,{19598,19599,19600,19601,19602},0,1,25,3,1393}, 
{2,{19578,20895},0,1,30,1,1388}, {1,{19577},2,1,30,2,1387}, {2,{19590,19592},0,1,30,4,1390}, 
{2,{34453,34454},0,1,35,1,1799}, {5,{19621,19622,19623,19624,19625},0,1,35,3,1397}, 
{3,{34455,34459,34460},0,1,40,1,1800}, {1,{19574},2,1,40,2,1386}, {3,{34462,34464,34465},0,1,40,3,1801}, 
{2,{53252,53253},0,1,45,1,2136}, {5,{34466,34467,34468,34469,34470},0,1,45,3,1802}, 
{3,{53262,53263,53264},0,1,50,1,2140}, {1,{34692},0,1,50,2,1803}, {3,{53256,53259,53260},0,1,50,3,2137}, 
{5,{56314,56315,56316,56317,56318},0,1,55,2,2227}, 
{1,{53270},3,1,60,2,2139}}

hunter_beastmastery_talents_tab = 22



hunter_marksmanship_spells = {{75, 2, 0, 1}, {1978, 2, 0, 4}, {3044, 2, 0, 6}, {1130, 2, 0, 6}, {5116, 2, 0, 8},
{20736, 2, 0, 12}, {2643, 2, 0, 18}, {3043, 2, 0, 22}, {3045, 2, 0, 26}, {1543, 2, 0, 32}, {3034, 2, 0, 36}, 
{1510, 2, 0, 40}, {56641, 2, 0, 50}, {19801, 2, 0, 60}, {53351, 2, 0, 71}}

hunter_marksmanship_spells_count = 15
hunter_marksmanship_bgs = {"Interface\\TalentFrame\\HunterMarksmanship-TopLeft", "Interface\\TalentFrame\\HunterMarksmanship-TopRight",
"Interface\\TalentFrame\\HunterMarksmanship-BottomLeft", "Interface\\TalentFrame\\HunterMarksmanship-BottomRight"}

hunter_marksmanship_talents = {{2,{19407,19412},0,1,10,1,1341}, {3,{53620,53621,53622},0,1,10,2,2197}, {5,{19426,19427,19429,19430,19431},0,1,10,3,1344}, 
{3,{34482,34483,34484},0,1,15,1,1806}, {3,{19421,19422,19423},0,1,15,2,1343}, {5,{19485,19487,19488,19489,19490},0,1,15,3,1349}, 
{2,{34950,34954},0,1,20,1,1818}, {3,{19454,19455,19456},0,1,20,2,1346}, {1,{19434},2,1,20,3,1345}, {2,{34948,34949},0,1,20,4,1819}, 
{3,{19464,19465,19466},0,1,25,2,1348}, {5,{19416,19417,19418,19419,19420},0,1,25,3,1342}, 
{2,{35100,35102},0,1,30,1,1351}, {1,{23989},2,1,30,2,1353}, {3,{19461,19462,24691},0,1,30,3,1347}, 
{2,{34475,34476},0,1,35,1,1804}, {3,{19507,19508,19509},0,1,35,4,1362}, 
{3,{53234,53237,53238},0,1,40,1,2130}, {1,{19506},2,1,40,2,1361}, {3,{35104,35110,35111},0,1,40,3,1821}, 
{5,{34485,34486,34487,34488,34489},0,1,45,2,1807}, {2,{53228,53232},0,1,45,3,2131}, 
{3,{53215,53216,53217},0,1,50,1,2132}, {1,{34490},2,1,50,2,1808}, {3,{53221,53222,53224},0,1,50,3,2133}, 
{5,{53241,53243,53244,53245,53246},0,1,55,2,2134}, 
{1,{53209},3,1,60,2,2135}}

hunter_marksmanship_talents_tab = 24


hunter_survival_spells = {{2973, 2, 0, 1}, {1494, 2, 0, 2}, {19883, 2, 0, 10}, {2974, 2, 0, 12}, {13795, 2, 0, 16},
{1495, 2, 0, 16}, {19884, 2, 0, 18}, {1499, 2, 0 ,20}, {781, 2, 0, 20}, {19885, 2, 0, 24}, {13809, 2, 0, 28},
{19880, 2, 0, 28}, {5384, 2, 0, 30}, {19878, 2, 0, 32}, {13813, 2, 0, 34}, {19882, 2, 0, 40}, {19879, 2, 0, 50},
{19263, 2, 0, 60}, {34600, 2, 0, 68}, {34477, 2, 0, 70}, {60192, 2, 0, 80}}

hunter_survival_spells_count = 21
hunter_survival_bgs = {"Interface\\TalentFrame\\HunterSurvival-TopLeft", "Interface\\TalentFrame\\HunterSurvival-TopRight",
"Interface\\TalentFrame\\HunterSurvival-BottomLeft", "Interface\\TalentFrame\\HunterSurvival-BottomRight"}

hunter_survival_talents = {{5,{52783,52785,52786,52787,52788},0,1,10,1,1623}, {3,{19498,19499,19500},0,1,10,2,1820}, {2,{19159,19160},0,1,10,3,1621}, 
{3,{19290,19294,24283},0,1,15,1,1310}, {3,{19184,19387,19388},0,1,15,2,1304}, {3,{19376,63457,63458},0,1,15,3,1305}, {2,{34494,34496},0,1,15,4,1810}, 
{5,{19255,19256,19257,19258,19259},0,1,20,1,1622}, {1,{19503},2,1,20,2,1814}, {3,{19295,19297,19298},0,1,20,3,1311}, {2,{19286,19287},0,1,20,4,1309}, 
{3,{56333,56336,56337},0,1,25,2,2229}, {3,{56342,56343,56344},0,1,25,4,1306}, 
{3,{56339,56340,56341},0,1,30,1,2228}, {3,{19370,19371,19373},0,1,30,2,1321}, {1,{19306},2,1,30,3,1312}, 
{5,{19168,19180,19181,24296,24297},0,1,35,1,1303}, {3,{34491,34492,34493},0,1,35,3,1809}, 
{3,{34500,34502,34503},0,1,40,1,1812}, {1,{19386},2,1,40,2,1325}, {3,{34497,34498,34499},0,1,40,3,1811}, 
{5,{34506,34507,34508,34838,34839},0,1,45,1,1813}, {3,{53295,53296,53297},0,1,45,2,2141}, 
{2,{53298,53299},0,1,50,1,2142}, {1,{3674},2,1,50,2,1322}, {3,{53302,53303,53304},0,1,50,4,2143}, 
{3,{53290,53291,53292},0,1,55,3,2144}, 
{1,{53301},3,1,60,2,2145}}

hunter_survival_talents_tab = 23

