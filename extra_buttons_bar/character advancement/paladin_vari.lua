-- Documentation {5176, 2, 0, 1} {Spellid, Ability Essence,  Talent Essence, Required Level}
-- Make sure to adjust Count if you add or subtract any spells
-- talent documentation {5,{16814,16814,16814,16814,16814},0,1,10,2,762} {number of ranks, {spellids}, AE cost, TE cost, required level,
-- 																															column, talentId}
-- talents tab variables refers to talenttab dbc

paladin_holy_spells = {{635, 2, 0, 1}, {20154, 2, 0, 1}, {1152, 2, 0, 8}, {633, 2, 0, 10}, {7328, 2, 0, 12}, {19742, 2, 0, 14},
{26573, 2, 0, 20}, {879, 2, 0, 20}, {19750, 2, 0, 20}, {5502, 1, 0 ,20}, {19746, 2, 0, 22}, {10326, 2, 0, 24},
{20165, 2, 0, 30}, {20166, 2, 0, 38}, {4987, 2, 0, 42}, {2812, 2, 0, 50}, {54428, 2, 0, 71},
{53601, 2, 0, 80}}

paladin_holy_spells_count = 18
paladin_holy_bgs = {"Interface\\TalentFrame\\PaladinHoly-TopLeft", "Interface\\TalentFrame\\PaladinHoly-TopRight",
"Interface\\TalentFrame\\PaladinHoly-BottomLeft", "Interface\\TalentFrame\\PaladinHoly-BottomRight"}

paladin_holy_talents = {{5,{20205,20206,20207,20209,20208},0,1,10,2,1432}, {5,{20224,20225,20330,20331,20332},0,1,10,3,1463}, 
{3,{20237,20238,20239},0,1,15,1,1444}, {5,{20257,20258,20259,20260,20261},0,1,15,2,1449}, {2,{9453,25836},0,1,15,3,1628}, 
{1,{31821},2,1,20,1,1435}, {5,{20210,20212,20213,20214,20215},0,1,20,2,1461}, {2,{20234,20235},0,1,20,3,1443}, 
{3,{20254,20255,20256},0,1,25,1,1450}, {2,{20244,20245},0,1,25,3,1446}, {2,{53660,53661},0,1,25,4,2198}, 
{2,{31822,31823},0,1,30,1,1742}, {1,{20216},2,1,30,2,1433}, {3,{20359,20360,20361},0,1,30,3,1465}, 
{2,{31825,31826},0,1,35,1,1743}, {5,{5923,5924,5925,5926,25829},0,1,35,3,1627}, 
{3,{31833,31835,31836},0,1,40,1,1745}, {1,{20473},2,1,40,2,1502}, {3,{31828,31829,31830},0,1,40,3,1744}, 
{3,{53551,53552,53553},0,1,45,1,2190}, {5,{31837,31838,31839,31840,31841},0,1,45,3,1746}, 
{1,{31842},2,1,50,1,1747}, {5,{53671,53673,54151,54154,54155},0,1,50,3,2199}, 
{2,{53569,53576},0,1,55,2,2193}, {2,{53556,53557},0,1,55,3,2191}, 
{1,{53563},3,1,60,2,2192}}

paladin_holy_talents_tab = 26



paladin_retribution_spells = {{19740, 2, 0, 4}, {20271, 2, 0 ,4}, {53408, 2, 0, 12}, {7294, 2, 0, 16}, {53407, 2, 0, 28},
{24275, 2, 0, 44}, {32223, 2, 0, 62}, {31801, 2, 0, 64}, {31884, 2, 0, 70}}

paladin_retribution_spells_count = 9
paladin_retribution_bgs = {"Interface\\TalentFrame\\Paladincombat-TopLeft", "Interface\\TalentFrame\\Paladincombat-TopRight",
"Interface\\TalentFrame\\Paladincombat-BottomLeft", "Interface\\TalentFrame\\Paladincombat-BottomRight"}

paladin_retribution_talents = {{5,{20060,20061,20062,20063,20064},0,1,10,2,1403}, {5,{20101,20102,20103,20104,20105},0,1,10,3,1407}, 
{2,{25956,25957},0,1,15,1,1631}, {3,{20335,20336,20337},0,1,15,2,1464}, {2,{20042,20045},0,1,15,3,1401}, 
{2,{9452,26016},0,1,20,1,1633}, {5,{20117,20118,20119,20120,20121},0,1,20,2,1411}, {1,{20375},2,1,20,3,1481}, {2,{26022,26023},0,1,20,4,1634}, 
{2,{9799,25988},0,1,25,1,1632}, {3,{32043,35396,35397},0,1,25,3,1761}, {3,{31866,31867,31868},0,1,25,4,1755}, 
{3,{20111,20112,20113},0,1,30,1,1410}, {1,{31869},1,1,30,3,1756}, 
{3,{20049,20056,20057},0,1,35,2,1402}, {2,{31871,31872},0,1,35,3,1757}, 
{2,{53486,53488},0,1,40,1,2176}, {1,{20066},2,1,40,2,1441}, {3,{31876,31877,31878},0,1,40,3,1758}, 
{3,{31879,31880,31881},0,1,45,2,1759}, {2,{53375,53376},0,1,45,3,2147}, 
{3,{53379,53484,53648},0,1,50,1,2148}, {1,{35395},2,1,50,2,1823}, {3,{53501,53502,53503},0,1,50,3,2179}, 
{3,{53380,53381,53382},0,1,55,2,2149}, 
{1,{53385},3,1,60,2,2150}}

paladin_retribution_talents_tab = 25



paladin_protection_spells = {{465, 2, 0, 1}, {498, 2, 0, 6}, {853, 2, 0, 8}, {1022, 2, 0, 10}, {31789, 2, 0, 14},
{62124, 2, 0, 16}, {25780, 2, 0, 16}, {1044, 2, 0, 18}, {20217, 2, 0, 20}, {20164, 2, 0, 22}, {1038, 2, 0, 26},
{19876, 2, 0, 28}, {19752, 2, 0, 30}, {19888, 2, 0, 32}, {642, 2, 0, 34}, {19891, 2, 0, 36}, {6940, 2, 0, 46}, {53600, 2, 0, 75}}

paladin_protection_spells_count = 18
paladin_protection_bgs = {"Interface\\TalentFrame\\PaladinProtection-TopLeft", "Interface\\TalentFrame\\PaladinProtection-TopRight",
"Interface\\TalentFrame\\PaladinProtection-BottomLeft", "Interface\\TalentFrame\\PaladinProtection-BottomRight"}

paladin_protection_talents = {{5,{63646,63647,63648,63649,63650},0,1,10,2,1442}, {5,{20262,20263,20264,20265,20266},0,1,10,3,2185}, 
{3,{31844,31845,53519},0,1,15,1,1748}, {2,{20174,20175},0,1,15,2,1425}, {5,{20096,20097,20098,20099,20100},0,1,15,3,1629}, 
{1,{64205},2,1,20,1,2280}, {3,{20468,20469,20470},0,1,20,2,1501}, {5,{20143,20144,20145,20146,20147},0,1,20,3,1423}, 
{2,{53527,53530},0,1,25,1,2281}, {2,{20487,20488},0,1,25,2,1521}, {3,{20138,20139,20140},0,1,25,3,1422}, 
{1,{20911},2,1,30,2,1431}, {5,{20177,20179,20181,20180,20182},0,1,30,3,1426}, 
{2,{31848,31849},0,1,35,1,1750}, {3,{20196,20197,20198},0,1,35,3,1429}, 
{2,{31785,33776},0,1,40,1,2282}, {1,{20925},2,1,40,2,1430}, {3,{31850,31851,31852},0,1,40,3,1751}, 
{3,{20127,20130,20135},0,1,45,1,1421}, {3,{31858,31859,31860},0,1,45,3,1753}, 
{3,{53590,53591,53592},0,1,50,1,2195}, {1,{31935},2,1,50,2,1754}, {2,{53583,53585},0,1,50,3,2194}, 
{3,{53709,53710,53711},0,1,55,2,2204}, {2,{53695,53696},0,1,55,3,2200}, 
{1,{53595},3,1,60,2,2196}}

paladin_protection_talents_tab = 27



