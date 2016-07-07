-- Documentation {5176, 2, 0, 1} {Spellid, Ability Essence,  Talent Essence, Required Level}
-- Make sure to adjust Count if you add or subtract any spells
-- talent documentation {5,{16814,16814,16814,16814,16814},0,1,10,2,762} {number of ranks, {spellids}, AE cost, TE cost, required level,
-- 																															column, talentId}
-- talents tab variables refers to talenttab dbc

priest_discipline_spells = {{1243, 2, 0, 1}, {17, 2, 0, 6}, {588, 2, 0, 12}, {527, 2, 0, 18}, {9484, 2, 0, 20},
{6346, 2, 0, 20}, {8129, 2, 0, 24}, {14752, 2, 0, 30}, {1706, 2, 0, 34}, {21562, 2, 0, 48}, {27681, 2, 0, 60},
{32375, 2, 0, 70}}

priest_discipline_spells_count = 12
priest_discipline_bgs = {"Interface\\TalentFrame\\PriestDiscipline-TopLeft", "Interface\\TalentFrame\\PriestDiscipline-TopRight",
"Interface\\TalentFrame\\PriestDiscipline-BottomLeft", "Interface\\TalentFrame\\PriestDiscipline-BottomRight"}

priest_discipline_talents = {{5,{14522,14788,14789,14790,14791},0,1,10,2,342},{5,{47586,47587,47588,52802,52803},0,1,10,3,1898}, 
{3,{14523,14784,14785},0,1,15,1,352}, {3,{14747,14770,14771},0,1,15,2,346}, {2,{14749,14767},0,1,15,3,344}, {2,{14531,14774},0,1,15,4,321}, 
{3,{14521,14776,14777},0,1,20,1,347}, {1,{14751},2,1,20,2,348}, {3,{14748,14768,14769},0,1,20,3,343}, 
{3,{33167,33171,33172},0,1,25,1,1769}, {3,{14520,14780,14781},0,1,25,2,341}, {2,{14750,14772},0,1,25,4,350}, 
{2,{33201,33202},0,1,30,1,2268}, {5,{18551,18552,18553,18554,18555},0,1,30,2,1201}, {1,{63574},0,1,30,3,351}, 
{2,{33186,33190},0,1,35,1,1771}, {3,{34908,34909,34910},0,1,35,3,1772}, 
{3,{45234,45243,45244},0,1,40,1,1858}, {1,{10060},2,1,40,2,322}, {3,{63504,63505,63506},0,1,40,3,1773},
{2,{57470,57472},0,1,45,1,2235}, {3,{47535,47536,47537},0,1,45,2,1896}, {2,{47507,47508},0,1,45,3,1894}, 
{3,{47509,47511,47515},0,1,50,1,1895}, {1,{33206},2,1,50,2,1774}, {2,{47516,47517},0,1,50,3,1901}, 
{5,{52795,52797,52798,52799,52800},0,1,55,2,1202}, 
{1,{47540},2,1,60,2,1897}}

priest_discipline_talents_tab = 10



priest_holy_spells = {{2050, 2, 0, 1}, {585, 2, 0, 1}, {139, 2, 0, 8}, {2006, 2, 0, 10}, {528, 2, 0, 14},
{2054, 2, 0, 16}, {2061, 2, 0, 20}, {14914, 2, 0, 20}, {15237, 2, 0, 20}, {596, 2, 0, 30},
{552, 2, 0, 32}, {2060, 2, 0, 40}, {32546, 2, 0, 64}, {33076, 2, 0, 68}, {64843, 2, 0, 80}}

priest_holy_spells_count = 15
priest_holy_bgs = {"Interface\\TalentFrame\\PriestHoly-TopLeft", "Interface\\TalentFrame\\PriestHoly-TopRight",
"Interface\\TalentFrame\\PriestHoly-BottomLeft", "Interface\\TalentFrame\\PriestHoly-BottomRight"}

priest_holy_talents = {{2,{14913,15012},0,1,10,1,410}, {3,{14908,15020,17191},0,1,10,2,406}, {5,{14889,15008,15009,15010,15011},0,1,10,3,401}, 
{5,{27900,27901,27902,27903,27904},0,1,15,2,411}, {5,{18530,18531,18533,18534,18535},0,1,15,3,1181}, 
{1,{19236},2,1,20,1,442}, {3,{27811,27815,27816},0,1,20,2,1636}, {3,{14892,15362,15363},0,1,20,4,361}, 
{2,{27789,27790},0,1,25,1,1635}, {3,{14912,15013,15014},0,1,25,2,408}, {2,{14909,15017},0,1,25,3,403}, 
{2,{14911,15018},0,1,30,1,413}, {1,{20711},0,1,30,2,1561}, {5,{14901,15028,15029,15030,15031},0,1,30,3,402}, 
{2,{33150,33154},0,1,35,1,1766}, {5,{14898,15349,15354,15355,15356},0,1,35,3,404}, 
{3,{34753,34859,34860},0,1,40,1,1768}, {1,{724},2,1,40,2,1637}, {3,{33142,33145,33146},0,1,40,3,1765}, 
{2,{64127,64129},0,1,45,1,2279}, {5,{33158,33159,33160,33161,33162},0,1,45,2,1767}, {3,{63730,63733,63737},0,1,45,3,1904}, 
{3,{63534,63542,63543},0,1,50,1,1902}, {1,{34861},2,1,50,2,1815}, {3,{47558,47559,47560},0,1,50,3,1903}, 
{5,{47562,47564,47565,47566,47567},0,1,55,2,1905}, 
{1,{47788},2,1,60,2,1911}}

priest_holy_talents_tab = 11



priest_shadow_spells = {{589, 2, 0, 4}, {586, 2, 0, 8}, {8092, 2, 0, 10}, {8122, 2, 0, 10}, {2944, 2, 0, 20},
{453, 2, 0, 20}, {2096, 2, 0, 22}, {976, 2, 0, 30}, {605, 2, 0, 30}, {27683, 2, 0, 56}, {32379, 2, 0, 62},
{34433, 2, 0, 66}, {48045, 2, 0, 75}}

priest_shadow_spells_count = 13
priest_shadow_bgs = {"Interface\\TalentFrame\\PriestShadow-TopLeft", "Interface\\TalentFrame\\PriestShadow-TopRight",
"Interface\\TalentFrame\\PriestShadow-BottomLeft", "Interface\\TalentFrame\\PriestShadow-BottomRight"}

priest_shadow_talents = {{3,{15270,15335,15336},0,1,10,1,465}, {2,{15337,15338},0,1,10,2,2027}, {5,{15259,15307,15308,15309,15310},0,1,10,3,462}, 
{3,{15318,15272,15320},0,1,15,1,466}, {2,{15275,15317},0,1,15,2,482}, {3,{15260,15327,15328},0,1,15,3,463}, 
{2,{15392,15448},0,1,20,1,542}, {5,{15273,15312,15313,15314,15316},0,1,20,2,481}, {1,{15407},2,1,20,3,501}, 
{2,{15274,15311},0,1,25,2,483}, {2,{17322,17323},0,1,25,3,881}, {3,{15257,15331,15332},0,1,25,4,461}, 
{1,{15487},2,1,30,1,541}, {1,{15286},2,1,30,2,484}, {2,{27839,27840},0,1,30,3,1638}, {3,{33213,33214,33215},0,1,30,4,1777}, 
{2,{14910,33371},0,1,35,1,1781}, {3,{63625,63626,63627},0,1,35,3,2267}, 
{1,{15473},2,1,40,2,521}, {5,{33221,33222,33223,33224,33225},0,1,40,3,1778}, 
{2,{47569,47570},0,1,45,1,1906}, {3,{33191,33192,33193},0,1,45,3,1816}, 
{1,{64044},2,1,50,1,1908}, {1,{34914},2,1,50,2,1779}, {3,{47580,47581,47582},0,1,50,3,1909}, 
{5,{47573,47577,47578,51166,51167},0,1,55,3,1907}, 
{1,{47585},2,1,60,2,1910}}

priest_shadow_talents_tab = 12

