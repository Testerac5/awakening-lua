-- Documentation {5176, 2, 0, 1} {Spellid, Ability Essence,  Talent Essence, Required Level}
-- Make sure to adjust Count if you add or subtract any spells
-- talent documentation {5,{16814,16814,16814,16814,16814},0,1,10,2,762} {number of ranks, {spellids}, AE cost, TE cost, required level,
-- 																															column, talentId}
-- talents tab variables refers to talenttab dbc

mage_arcane_spells = {{1459, 2, 0, 1}, {5504, 2, 0, 4}, {587, 2, 0, 6}, {5143, 2, 0, 8}, {118, 2, 0, 8},
{475, 2, 0, 10}, {604, 2, 0, 12}, {130, 2, 0, 12}, {1449, 2, 0, 14}, {1008, 2, 0, 18}, {1463, 2, 0, 20},
{1953, 2, 0, 20}, {818045, 2, 0, 20}, {12051, 2, 0, 20}, {2139, 2, 0, 24}, {759, 2, 0, 28}, {6117, 2, 0, 34},
{30451, 2, 0, 64}, {66, 2, 0, 68}, {43987, 2, 0, 70}, {30449, 2, 0, 70}, {55342, 2, 0, 80}}

mage_arcane_spells_count = 22
mage_arcane_bgs = {"Interface\\TalentFrame\\MageArcane-TopLeft", "Interface\\TalentFrame\\MageArcane-TopRight",
"Interface\\TalentFrame\\MageArcane-BottomLeft", "Interface\\TalentFrame\\MageArcane-BottomRight"}

mage_arcane_talents = {{2,{11210,12592},0,1,10,1,74}, {3,{11222,12839,12840},0,1,10,2,76}, {5,{11237,12463,12464,16769,16770},0,1,10,3,80}, 
{3,{28574,54658,54659},0,1,15,1,85}, {2,{29441,29444},0,1,15,2,1650}, {5,{11213,12574,12575,12576,12577},0,1,15,3,75}, 
{2,{11247,12606},0,1,20,1,82}, {3,{11242,12467,12469},0,1,20,2,81}, {3,{44397,44398,44399},0,1,20,3,1845}, {1,{54646},2,1,20,4,2211}, 
{2,{11252,12605},0,1,25,1,83}, {2,{11255,12598},0,1,25,2,88}, {3,{18462,18463,18464},0,1,25,3,1142}, {3,{29447,55339,55340},0,1,25,4,2222}, 
{2,{31569,31570},0,1,30,1,1724}, {1,{12043},2,1,30,2,86}, {5,{11232,12500,12501,12502,12503},0,1,30,4,77}, 
{3,{31574,31575,54354},0,1,35,1,1726}, {3,{15058,15059,15060},0,1,35,2,421}, {2,{31571,31572},0,1,35,3,1725}, 
{3,{31579,31582,31583},0,1,40,1,1727}, {1,{12042},2,1,40,2,87}, {3,{44394,44395,44396},0,1,40,3,1844}, 
{2,{44378,44379},0,1,45,2,1843}, {5,{31584,31585,31586,31587,31588},0,1,45,3,1728}, 
{1,{31589},2,1,50,2,1729}, {5,{44404,54486,54488,54489,54490},0,1,50,3,2209}, 
{3,{44400,44402,44403},0,1,55,2,1846}, {2,{35578,35581},0,1,55,3,1826}, 
{1,{44425},3,1,60,2,1847}}

mage_arcane_talents_tab = 3



mage_fire_spells = {{2136, 2, 0, 6}, {133, 2, 0, 6}, {2120, 2, 0, 16}, {543, 2, 0, 20}, {2948, 2, 0, 22},
{30482, 2, 0, 62}, {44614, 2, 0, 75}}

mage_fire_spells_count = 7
mage_fire_bgs = {"Interface\\TalentFrame\\MageFire-TopLeft", "Interface\\TalentFrame\\MageFire-TopRight",
"Interface\\TalentFrame\\MageFire-BottomLeft", "Interface\\TalentFrame\\MageFire-BottomRight"}

mage_fire_talents = {{2,{11078,11080},0,1,10,1,27}, {3,{18459,18460,54734},0,1,10,2,1141}, {5,{11069,12338,12339,12340,12341},0,1,10,3,26}, 
{5,{11119,11120,12846,12847,12848},0,1,15,1,34}, {2,{54747,54749},0,1,15,2,2212}, {3,{11108,12349,12350},0,1,15,3,31}, 
{2,{11100,12353},0,1,20,1,28}, {3,{11103,12357,12358},0,1,20,2,30}, {1,{11366},2,1,20,3,29}, {2,{11083,12351},0,1,20,4,23}, 
{3,{11095,12872,12873},0,1,25,1,25}, {2,{11094,13043},0,1,25,2,24}, {3,{29074,29075,29076},0,1,25,4,1639}, 
{3,{31638,31639,31640},0,1,30,1,1730}, {3,{11115,11367,11368},0,1,30,2,33}, {1,{11113},2,1,30,3,32}, 
{2,{31641,31642},0,1,35,1,1731}, {5,{11124,12378,12398,12399,12400},0,1,35,3,35}, 
{3,{34293,34295,34296},0,1,40,1,1733}, {1,{11129},2,1,40,2,36}, {2,{31679,31680},0,1,40,3,1732}, 
{2,{64353,64357},0,1,45,1,1848}, {3,{31656,31657,31658},0,1,45,3,1734}, 
{2,{44442,44443},0,1,50,1,1849}, {1,{31661},2,1,50,2,1735}, {3,{44445,44446,44448},0,1,50,3,1850}, 
{5,{44449,44469,44470,44471,44472},0,1,55,2,1851}, 
{1,{44457},3,1,60,2,1852}}

mage_fire_talents_tab = 1




mage_frost_spells = {{168, 2, 0, 1}, {116, 2, 0, 4}, {122, 2, 0, 10}, {10, 2, 0, 20}, {6143, 2, 0, 22},
{120, 2, 0, 26}, {45438, 2, 0, 30}, {30455, 2, 0, 66}}

mage_frost_spells_count = 8
mage_frost_bgs = {"Interface\\TalentFrame\\MageFrost-TopLeft", "Interface\\TalentFrame\\MageFrost-TopRight",
"Interface\\TalentFrame\\MageFrost-BottomLeft", "Interface\\TalentFrame\\MageFrost-BottomRight"}

mage_frost_talents = {{3,{11071,12496,12497},0,1,10,1,38}, {5,{11070,12473,16763,16765,16766},0,1,10,2,37}, {3,{31670,31672,55094},0,1,10,3,62}, 
{3,{11207,12672,15047},0,1,15,1,73}, {2,{11189,28332},0,1,15,2,70}, {3,{29438,29439,29440},0,1,15,3,1649}, {3,{11175,12569,12571},0,1,15,4,65}, 
{3,{11151,12952,12953},0,1,20,1,61}, {1,{12472},2,1,20,2,69}, {3,{11185,12487,12488},0,1,20,3,63}, 
{2,{16757,16758},0,1,25,1,741}, {3,{11160,12518,12519},0,1,25,2,66}, {3,{11170,12982,12983},0,1,25,3,67}, 
{1,{11958},2,1,30,2,72}, {3,{11190,12489,12490},0,1,30,3,64}, {3,{31667,31668,31669},0,1,30,4,1736}, 
{2,{55091,55092},0,1,35,1,1737}, {3,{11180,28592,28593},0,1,35,3,68}, 
{2,{44745,54787},0,1,40,1,2214}, {1,{11426},2,1,40,2,71}, {5,{31674,31675,31676,31677,31678},0,1,40,3,1738}, 
{2,{31682,31683},0,1,45,2,1740}, {2,{44543,44545},0,1,45,3,1853}, 
{3,{44546,44548,44549},0,1,50,1,1854}, {1,{31687},2,1,50,2,1741}, {3,{44557,44560,44561},0,1,50,3,1855}, 
{5,{44566,44567,44568,44570,44571},0,1,55,2,1856}, 
{1,{44572},3,1,60,2,1857}}

mage_frost_talents_tab = 2

