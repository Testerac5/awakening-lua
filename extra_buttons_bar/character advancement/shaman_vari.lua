-- Documentation {5176, 2, 0, 1} {Spellid, Ability Essence,  Talent Essence, Required Level}
-- Make sure to adjust Count if you add or subtract any spells
-- talent documentation {5,{16814,16814,16814,16814,16814},0,1,10,2,762} {number of ranks, {spellids}, AE cost, TE cost, required level,
-- 																															column, talentId}
-- talents tab variables refers to talenttab dbc

shaman_elemental_spells = {{403, 2, 0, 1}, {8042, 2, 0, 4}, {2484, 2, 0, 6}, {5730, 2, 0, 8}, {8050, 2, 0, 10},
{3599, 2, 0, 10}, {1535, 2, 0, 12}, {370, 2, 0, 12}, {57994, 2, 0, 16}, {8056, 2, 0, 20}, {8190, 2, 0, 26}, 
{66842, 2, 0, 30}, {421, 2, 0, 32}, {66843, 2, 0, 40}, {66844, 2, 0, 50}, {2894, 2, 0, 68}, {51505, 2, 0, 75},
{51514, 2, 0, 80}}

shaman_elemental_spells_count = 18
shaman_elemental_bgs = {"Interface\\TalentFrame\\ShamanElementalcombat-TopLeft", "Interface\\TalentFrame\\ShamanElementalcombat-TopRight",
"Interface\\TalentFrame\\ShamanElementalcombat-BottomLeft", "Interface\\TalentFrame\\ShamanElementalcombat-BottomRight"}

shaman_elemental_talents = {{5,{16039,16109,16110,16111,16112},0,1,10,2,564}, {5,{16035,16105,16106,16107,16108},0,1,10,3,563}, 
{3,{16038,16160,16161},0,1,15,1,561}, {3,{28996,28997,28998},0,1,15,2,1640}, {3,{30160,29179,29180},0,1,15,3,1645}, 
{5,{16040,16113,16114,16115,16116},0,1,20,1,575}, {1,{16164},1,1,20,2,574}, {5,{16089,60184,60185,60187,60188},0,1,20,3,565}, 
{2,{16086,16544},0,1,25,1,567}, {3,{29062,29064,29065},0,1,25,4,1642}, 
{2,{28999,29000},0,1,30,1,1641}, {1,{16041},1,1,30,2,562}, {3,{30664,30665,30666},0,1,30,4,1682}, 
{3,{30672,30673,30674},0,1,35,1,1685}, {5,{16578,16579,16580,16581,16582},0,1,35,3,721}, 
{1,{16166},2,1,40,2,573}, {3,{51483,51485,51486},0,1,40,3,2052}, 
{2,{63370,63372},0,1,45,1,2262}, {2,{51466,51470},0,1,45,2,2049}, {3,{30675,30678,30679},0,1,45,3,1686}, 
{3,{51474,51478,51479},0,1,50,1,2050}, {1,{30706},2,1,50,2,1687}, {3,{51480,51481,51482},0,1,50,3,2051}, 
{5,{62097,62098,62099,62100,62101},0,1,55,2,2252}, 
{1,{51490},3,1,60,2,2053}}

shaman_elemental_talents_tab = 13


shaman_enhancement_spells = {{8017, 2, 0, 1}, {8071, 2, 0, 4}, {324, 2, 0, 8}, {8024, 2, 0, 10}, {8075, 2, 0, 10},
{2645, 2, 0, 20}, {8033, 2, 0, 20}, {131, 1, 0, 22}, {8181, 2, 0, 24}, {6196, 2, 0, 26}, {8184, 2, 0, 28},
{8227, 2, 0, 28}, {546, 1, 0, 28}, {10595, 2, 0, 30}, {8232, 2, 0, 30}, {556, 2, 0, 30}, {8177, 2, 0, 30},
{8512, 2, 0, 32}, {6495, 2, 0, 34}, {3738, 2, 0, 64}, {2825, 2, 0, 70}, {32182, 2, 0, 70}, {2062, 2, 0, 80}}

shaman_enhancement_spells_count = 23
shaman_enhancement_bgs = {"Interface\\TalentFrame\\ShamanEnhancement-TopLeft", "Interface\\TalentFrame\\ShamanEnhancement-TopRight",
"Interface\\TalentFrame\\ShamanEnhancement-BottomLeft", "Interface\\TalentFrame\\ShamanEnhancement-BottomRight"}

shaman_enhancement_talents = {{3,{16259,16295,52456},0,1,10,1,610}, {2,{16043,16130},0,1,10,2,2101}, {5,{17485,17486,17487,17488,17489},0,1,10,3,614}, 
{2,{16258,16293},0,1,15,1,609}, {5,{16255,16302,16303,16304,16305},0,1,15,2,613}, {2,{16262,16287},0,1,15,3,605}, {3,{16261,16290,51881},0,1,15,4,607}, 
{3,{16266,29079,29080},0,1,20,1,611}, {1,{43338},1,1,20,3,617}, {3,{16254,16271,16272},0,1,20,4,601}, 
{5,{16256,16281,16282,16283,16284},0,1,25,2,602}, {5,{16252,16306,16307,16308,16309},0,1,25,3,615}, 
{2,{29192,29193},0,1,30,1,1647}, {1,{16268},1,1,30,2,616}, {3,{51883,51884,51885},0,1,30,3,2083}, 
{3,{30802,30808,30809},0,1,35,1,1689}, {3,{29082,29084,29086},0,1,35,3,1643}, {2,{63373,63374},0,1,35,4,2263}, 
{3,{30816,30818,30819},0,1,40,1,1692}, {1,{30798},1,0,40,2,1690}, {1,{17364},2,1,40,3,901}, 
{5,{51525,51526,51527,975065,975066},0,1,45,1,2055}, {1,{60103},2,1,45,2,2249}, {2,{51521,51522},0,1,45,3,2054}, 
{5,{30812,30813,30814,830815,830816},0,1,50,1,1691}, {1,{30823},2,1,50,2,1693}, {2,{51523,51524},0,1,50,3,2056}, 
{5,{51528,51529,51530,51531,51532},0,1,55,2,2057}, 
{1,{51533},3,1,60,2,2058}}

shaman_enhancement_talents_tab = 15



shaman_restoration_spells = {{331, 2, 0 , 1}, {2008, 2, 0, 12}, {526, 2, 0, 16}, {8143, 2, 0, 18}, {5394, 2, 0, 20},
{8004, 2, 0, 20}, {52127, 2, 0, 20}, {5675, 2, 0, 26}, {20608, 2, 0, 26}, {51730, 2, 0, 30}, {36936, 2, 0, 30}, {8170, 2, 0, 34},
{1064, 2, 0, 40}}

shaman_restoration_spells_count = 13
shaman_restoration_bgs = {"Interface\\TalentFrame\\ShamanRestoration-TopLeft", "Interface\\TalentFrame\\ShamanRestoration-TopRight",
"Interface\\TalentFrame\\ShamanRestoration-BottomLeft", "Interface\\TalentFrame\\ShamanRestoration-BottomRight"}

shaman_restoration_talents = {{5,{16182,16226,16227,16228,16229},0,1,10,2,586}, {5,{16173,16222,16223,16224,16225},0,1,10,3,595}, 
{2,{16184,16209},0,1,15,1,589}, {3,{29187,29189,29191},0,1,15,2,1646}, {5,{16179,16214,16215,16216,16217},0,1,15,3,593}, 
{3,{16180,16196,16198},0,1,20,1,583}, {3,{16181,16230,16232},0,1,20,2,587}, {1,{55198},2,1,20,3,582}, {3,{16176,16235,16240},0,1,20,4,581}, 
{3,{16187,16205,16206},0,1,25,2,588}, {5,{16194,16218,16219,16220,16221},0,1,25,3,594}, 
{3,{29206,29205,29202},0,1,30,1,1648}, {1,{16188},2,1,30,3,591}, {3,{30864,30865,30866},0,1,30,4,1695}, 
{5,{16178,16210,16211,16212,16213},0,1,35,3,592}, 
{5,{30881,30883,30884,30885,30886},0,1,40,1,1699}, {1,{16190},2,1,40,2,590}, {1,{51886},2,1,40,3,2084}, 
{2,{51554,51555},0,1,45,1,2060}, {2,{30872,30873},0,1,45,2,1697}, {3,{30867,30868,30869},0,1,45,3,1696}, 
{3,{51556,51557,51558},0,1,50,1,2061}, {1,{974},2,1,50,2,1698}, {2,{51560,51561},0,1,50,3,2059}, 
{5,{51562,51563,51564,51565,51566},0,1,55,2,2063}, 
{1,{61295},3,1,60,2,2064}}

shaman_restoration_talents_tab = 14

