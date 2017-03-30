local AIO = AIO or require ("AIO")

if AIO.AddAddon() then
	return
end

local tTHandler = AIO.AddHandlers ("TooltipAIO", {})

local TipNum

local TipID

local spellCheck = false

local modCost

local modCastTime

local modRange

local modCooldown

local tempNum

local pTemplateTable

local skipCheck

currentlyProcessing = false


--TODO: Polish passes on spell entries
--TODO: Deal with "request interference"
--TODO: make the tooltips pretty(?)


--used to read tooltip
local tab = {}

--format: [spellid] = templateNumber
--templateNumber refers to the templateTable.
local TaggedSpells = 
{
	[100] = 1,
	[6178] = 1,
	[11578] = 1,
	[772] = 2,
	[6546] = 2,
	[6547] = 2,
	[6548] = 2,
	[11572] = 2,
	[11573] = 2,
	[11574] = 2,
	[25208] = 2,
	[46845] = 2,
	[47465] = 2,
	[6343] = 3,
	[8198] = 3,
	[8204] = 3,
	[8205] = 3,
	[11580] = 3,
	[11581] = 3,
	[25264] = 3,
	[47501] = 3,
	[47501] = 3,
	[6673] = 4,
	[5242] = 4,
	[6192] = 4,
	[11549] = 4,
	[11550] = 4,
	[11551] = 4,
	[25289] = 4,
	[2048] = 4,
	[47436] = 4,
	[34428] = 5,
	[72] = 6,
	[1671] = 6,
	[1672] = 6,
	[29704] = 6,
	[78] = 4,
	[284] = 4,
	[285] = 4,
	[1608] = 4,
	[11564] = 4,
	[11565] = 4,
	[11566] = 4,
	[11567] = 4,
	[25286] = 4,
	[29707] = 4,
	[30324] = 4,
	[47449] = 4,
	[47450] = 4,
	[469] = 4,
	[47439] = 4,
	[47440] = 4,
	[676] = 6,
	[694] = 6,
	[7400] = 6,
	[7402] = 6,
	[20559] = 6,
	[20560] = 6,
	[25266] = 6,
	[47504] = 6,
	[845] = 4,
	[7369] = 4,
	[11608] = 4,
	[11609] = 4,
	[20569] = 4,
	[25231] = 4,
	[47519] = 4,
	[47520] = 4,
	[871] = 7,
	[1160] = 4,
	[6190] = 4,
	[11554] = 4,
	[11555] = 4,
	[11556] = 4,
	[25202] = 4,
	[25203] = 4,
	[47437] = 4,
	[1161] = 3,
	[1464] = 8,
	[8820] = 8,
	[11604] = 8,
	[11605] = 8,
	[25241] = 8,
	[25242] = 8,
	[47474] = 8,
	[47475] = 8,
	[1680] = 3,
	[1715] = 2,
	[1719] = 9,
	[2565] = 9,
	[2687] = 10,
	[3411] = 6,
	[5246] = 6,
	[5308] = 2,
	[20658] = 2,
	[20660] = 2,
	[20661] = 2,
	[20662] = 2,
	[25234] = 2,
	[25236] = 2,
	[47470] = 2,
	[47471] = 2,
	[6552] = 6,
	[6554] = 6,
	[6572] = 6,
	[6574] = 6,
	[7379] = 6,
	[11600] = 6,
	[11601] = 6,
	[25288] = 6,
	[25269] = 6,
	[30357] = 6,
	[57823] = 6,
	[7384] = 6,
	[7887] = 6,
	[11584] = 6,
	[11585] = 6,
	[18499] = 7,
	[20230] = 9,
	[20252] = 6,
	[20616] = 6,
	[20617] = 6,
	[25272] = 6,
	[25275] = 6,
	[12294] = 6,
	[21551] = 6,
	[21552] = 6,
	[21553] = 6,
	[25248] = 6,
	[30330] = 6,
	[47485] = 6,
	[47486] = 6,
	[23920] = 3,
	[23922] = 6,
	[23923] = 6,
	[23924] = 6,
	[23925] = 6,
	[25258] = 6,
	[30356] = 6,
	[47487] = 6,
	[47488] = 6,
	[20243] = 2,
	[30016] = 2,
	[30022] = 2,
	[47497] = 2,
	[47498] = 2,
	[55694] = 3,
	[57755] = 1,
	[64382] = 11,
	[498] = 12,
	[635] = 13,
	[639] = 13,
	[647] = 13,
	[1026] = 13,
	[1042] = 13,
	[3472] = 13,
	[10328] = 13,
	[10329] = 13,
	[25292] = 13,
	[27135] = 13,
	[27136] = 13,
	[48781] = 13,
	[48782] = 13,
	[19740] = 14,
	[19834] = 14,
	[19835] = 14,
	[19836] = 14,
	[19837] = 14,
	[19838] = 14,
	[25291] = 14,
	[27140] = 14,
	[48931] = 14,
	[48932] = 14,
	[19742] = 14,
	[19850] = 14,
	[19852] = 14,
	[19853] = 14,
	[19854] = 14,
	[25290] = 14,
	[27142] = 14,
	[48935] = 14,
	[48936] = 14,
	[20911] = 14,
	[25898] = 14,
	[25782] = 14,
	[25916] = 14,
	[27141] = 14,
	[48933] = 14,
	[48934] = 14,
	[25899] = 14,
	[25894] = 14,
	[25918] = 14,
	[27143] = 14,
	[48937] = 14,
	[48938] = 14,
	[1044] = 15,
	[1038] = 15,
	[1022] = 15,
	[5599] = 15,
	[10278] = 15,
	[6940] = 15,
	[20271] = 15,
	[633] = 1,
	[2800] = 1,
	[10310] = 1,
	[27154] = 1,
	[48788] = 1,
	[642] = 12,
	[853] = 15,
	[5588] = 15,
	[5589] = 15,
	[10308] = 15,	
	[879] = 16,
	[5614] = 16,
	[5615] = 16,
	[10312] = 16,
	[10313] = 16,
	[10314] = 16,
	[27138] = 16,
	[48800] = 16,
	[48801] = 16,
	[1152] = 14,
	[4987] = 14,
	[2812] = 12,
	[10318] = 12,
	[27139] = 12,
	[48816] = 12,
	[48817] = 12,
	[7328] = 13,
	[10322] = 13,
	[10324] = 13,
	[20772] = 13,
	[20773] = 13,
	[48949] = 13,
	[48950] = 13,
	[10326] = 13,
	[19750] = 13,
	[19939] = 13,
	[19940] = 13,
	[19941] = 13,
	[19942] = 13,
	[19943] = 13,
	[27137] = 13,
	[48784] = 13,
	[48785] = 13,
	[19752] = 1,
	[20116] = 12,
	[26573] = 12,
	[20922] = 12,
	[20923] = 12,
	[20924] = 12,
	[27173] = 12,
	[48818] = 12,
	[48819] = 12,
	[20164] = 17,
	[20165] = 17,
	[20166] = 17,
	[20217] = 14,
	[20925] = 12,
	[20927] = 12,
	[20928] = 12,
	[27179] = 12,
	[48951] = 12,
	[48952] = 12,
	[20473] = 18,
	[20929] = 18,
	[20930] = 18,
	[27174] = 18,
	[33072] = 18,
	[48824] = 18,
	[48825] = 18,
	[24275] = 16,
	[24274] = 16,
	[24239] = 16,
	[27180] = 16,
	[48805] = 16,
	[48806] = 16,
	[31789] = 1,
	[31884] = 12,
	[31935] = 15,
	[32699] = 15,
	[32700] = 15,
	[48826] = 15,
	[48827] = 15,
	[53407] = 16,
	[53408] = 16,
	[53600] = 15,
	[61411] = 15,
	[53601] = 14,
	[53720] = 17,
	[54428] = 9,
	[62124] = 15,
	[116] = 13,
	[205] = 13,
	[837] = 13,
	[7322] = 13,
	[8406] = 13,
	[8407] = 13,
	[8408] = 13,
	[10179] = 13,
	[10180] = 13,
	[10181] = 13,
	[25304] = 13,
	[27071] = 13,
	[27072] = 13,
	[38697] = 13,
	[42841] = 13,
	[42842] = 13,
	[133] = 13,
	[143] = 13,
	[145] = 13,
	[3140] = 13,
	[8400] = 13,
	[8401] = 13,
	[8402] = 13,
	[10148] = 13,
	[10149] = 13,
	[10150] = 13,
	[10151] = 13,
	[25306] = 13,
	[27070] = 13,
	[38692] = 13,
	[42832] = 13,
	[42833] = 13,
	[1459] = 14,
	[1460] = 14,
	[1461] = 14,
	[10156] = 14,
	[10157] = 14,
	[27126] = 14,
	[42995] = 14,
	[2136] = 15,
	[2137] = 15,
	[2138] = 15,
	[8412] = 15,
	[8413] = 15,
	[10197] = 15,
	[10199] = 15,
	[27078] = 15,
	[27079] = 15,
	[42872] = 15,
	[42873] = 15,
	[10] = 13,
	[6141] = 13,
	[8427] = 13,
	[10185] = 13,
	[10186] = 13,
	[10187] = 13,
	[27085] = 13,
	[42939] = 13,
	[42940] = 13,
	[66] = 12,
	[118] = 13,
	[12824] = 13,
	[12825] = 13,
	[12826] = 13,
	[28271] = 13,
	[28272] = 13,
	[61025] = 13,
	[61305] = 13,
	[61721] = 13,
	[61780] = 13,
	[71319] = 13,
	[120] = 12,
	[8492] = 12,
	[10159] = 12,
	[10160] = 12,
	[10161] = 12,
	[27087] = 12,
	[42930] = 12,
	[42931] = 12,
	[122] = 12,
	[865] = 12,
	[6131] = 12,
	[10230] = 12,
	[27088] = 12,
	[42917] = 12,
	[130] = 14,
	[475] = 14,
	[543] = 12,
	[8457] = 12,
	[8458] = 12,
	[10223] = 12,
	[10225] = 12,
	[27128] = 12,
	[43010] = 12,
	[6143] = 12,
	[8461] = 12,
	[8462] = 12,
	[10177] = 12,
	[28609] = 12,
	[32796] = 12,
	[43012] = 12,
	[604] = 14,
	[8450] = 14,
	[8451] = 14,
	[10173] = 14,
	[10174] = 14,
	[33944] = 14,
	[43015] = 14,
	[759] = 19,
	[5513] = 19,
	[8007] = 19,
	[8008] = 19,
	[22044] = 19,
	[33312] = 19,
	[5349] = 19,
	[1113] = 19,
	[1487] = 19,
	[990] = 19,
	[8075] = 19,
	[8076] = 19,
	[22895] = 19,
	[22019] = 19,
	[5350] = 19,
	[2288] = 19,
	[3772] = 19,
	[8077] = 19,
	[8078] = 19,
	[8079] = 19,
	[30703] = 19,
	[22018] = 19,
	[1008] = 14,
	[8455] = 14,
	[10169] = 14,
	[10170] = 14,
	[27130] = 14,
	[33946] = 14,
	[43017] = 14,
	[1449] = 17,
	[8437] = 17,
	[8438] = 17,
	[8439] = 17,
	[10201] = 17,
	[10202] = 17,
	[27080] = 17,
	[27082] = 17,
	[42920] = 17,
	[42921] = 17,
	[1463] = 17,
	[8494] = 17,
	[8495] = 17,
	[10191] = 17,
	[10192] = 17,
	[10193] = 17,
	[27131] = 17,
	[43019] = 17,
	[43020] = 17,
	[1953] = 12,
	[2120] = 13,
	[2121] = 13,
	[8422] = 13,
	[8423] = 13,
	[10215] = 13,
	[10216] = 13,
	[27086] = 13,
	[42925] = 13,
	[42926] = 13,
	[2139] = 15,
	[2948] = 13,
	[8444] = 13,
	[8445] = 13,
	[8446] = 13,
	[10205] = 13,
	[10206] = 13,
	[10207] = 13,
	[27073] = 13,
	[27074] = 13,
	[42858] = 13,
	[42859] = 13,
	[5143] = 14,
	[5144] = 14,
	[5145] = 14,
	[8416] = 14,
	[8417] = 14,
	[10211] = 14,
	[10212] = 14,
	[25345] = 14,
	[27075] = 14,
	[38699] = 14,
	[38704] = 14,
	[42843] = 14,
	[42846] = 14,
	[6117] = 17,
	[22782] = 17,
	[22783] = 17,
	[27125] = 17,
	[43023] = 17,
	[43024] = 17,
	[168] = 17,
	[7300] = 17,
	[7301] = 17,
	[7302] = 17,
	[7320] = 17,
	[10219] = 17,
	[10220] = 17,
	[27124] = 17,
	[43008] = 17,
	[12051] = 9,
	[11366] = 13,
	[12505] = 13,
	[12522] = 13,
	[12523] = 13,
	[12524] = 13,
	[12525] = 13,
	[12526] = 13,
	[18809] = 13,
	[27132] = 13,
	[33938] = 13,
	[42890] = 13,
	[42891] = 13,
	[11113] = 12,
	[13018] = 12,
	[13019] = 12,
	[13020] = 12,
	[13021] = 12,
	[27133] = 12,
	[33933] = 12,
	[42944] = 12,
	[42945] = 12,
	[11426] = 12,
	[13031] = 12,
	[13032] = 12,
	[13033] = 12,
	[27134] = 12,
	[33405] = 12,
	[43038] = 12,
	[43039] = 12,
	[23028] = 14,
	[27127] = 14,
	[43002] = 14,
	[30449] = 14,
	[30451] = 13,
	[42894] = 13,
	[42896] = 13,
	[42897] = 13,
	[30455] = 14,
	[42913] = 14,
	[42914] = 14,
	[30482] = 17,
	[43045] = 17,
	[43046] = 17,
	[31661] = 12,
	[33041] = 12,
	[33042] = 12,
	[33043] = 12,
	[42949] = 12,
	[42950] = 12,
	[42955] = 19,
	[43523] = 19,
	[43987] = 12,
	[58659] = 12,
	[44614] = 13,
	[47610] = 13,
	[44425] = 14,
	[44780] = 14,
	[44781] = 14,
	[45438] = 12,
	[55342] = 12,
	[44457] = 14,
	[55359] = 14,
	[55360] = 14,
	[172] = 14,
	[6222] = 14,
	[6223] = 14,
	[7648] = 14,
	[11671] = 14,
	[11672] = 14,
	[25311] = 14,
	[27216] = 14,
	[47812] = 14,
	[47813] = 14,
	[348] = 13,
	[707] = 13,
	[1094] = 13,
	[2941] = 13,
	[11665] = 13,
	[11667] = 13,
	[11668] = 13,
	[25309] = 13,
	[27215] = 13,
	[47810] = 13,
	[47811] = 13,
	[688] = 19,
	[697] = 19,
	[712] = 19,
	[691] = 19,
	[30146] = 19,
	[686] = 13,
	[695] = 13,
	[705] = 13,
	[1088] = 13,
	[1106] = 13,
	[7641] = 13,
	[11659] = 13,
	[11660] = 13,
	[11661] = 13,
	[25307] = 13,
	[27209] = 13,
	[47808] = 13,
	[47809] = 13,
	[702] = 14,
	[1108] = 14,
	[6205] = 14,
	[7646] = 14,
	[11707] = 14,
	[11708] = 14,
	[27224] = 14,
	[30909] = 14,
	[50511] = 14,
	[126] = 19,
	[132] = 14,
	[603] = 15,
	[30910] = 15,
	[47867] = 15,
	[689] = 14,
	[699] = 14,
	[709] = 14,
	[7651] = 14,
	[11699] = 14,
	[11700] = 14,
	[27219] = 14,
	[27220] = 14,
	[47857] = 14,
	[693] = 19,
	[16892] = 19,
	[16893] = 19,
	[16895] = 19,
	[16896] = 19,
	[22116] = 19,
	[36895] = 19,
	[687] = 17,
	[696] = 17,
	[706] = 17,
	[1086] = 17,
	[11733] = 17,
	[11734] = 17,
	[11735] = 17,
	[27260] = 17,
	[47793] = 17,
	[47889] = 17,
	[698] = 12,
	[710] = 13,
	[18647] = 13,
	[755] = 20,
	[3698] = 20,
	[3699] = 20,
	[3700] = 20,
	[11693] = 20,
	[11694] = 20,
	[11695] = 20,
	[27259] = 20,
	[47856] = 20,
	[980] = 14,
	[1014] = 14,
	[6217] = 14,
	[11711] = 14,
	[11712] = 14,
	[11713] = 14,
	[27218] = 14,
	[47863] = 14,
	[47864] = 14,
	[1098] = 13,
	[11725] = 13,
	[11726] = 13,
	[61191] = 13,
	[1120] = 14,
	[8288] = 14,
	[8289] = 14,
	[11675] = 14,
	[27217] = 14,
	[47855] = 14,
	[1490] = 14,
	[11721] = 14,
	[11722] = 14,
	[27228] = 14,
	[47865] = 14,
	[1714] = 14,
	[11719] = 14,
	[1949] = 17,
	[11683] = 17,
	[11684] = 17,
	[27213] = 17,
	[47823] = 17,
	[2362] = 19,
	[41192] = 19,
	[41193] = 19,
	[41194] = 19,
	[41195] = 19,
	[41196] = 19,
	[6366] = 19,
	[41169] = 19,
	[41171] = 19,
	[41172] = 19,
	[40773] = 19,
	[41173] = 19,
	[41174] = 19,
	[5138] = 14,
	[5484] = 19,
	[17928] = 19,
	[5576] = 13,
	[17919] = 13,
	[17920] = 13,
	[17921] = 13,
	[17922] = 13,
	[17923] = 13,
	[27210] = 13,
	[30459] = 13,
	[47814] = 13,
	[47815] = 13,
	[5697] = 14,
	[6201] = 19,
	[6202] = 19,
	[5699] = 19,
	[11729] = 19,
	[11730] = 19,
	[27230] = 19,
	[47871] = 19,
	[47878] = 19,
	[5740] = 14,
	[6219] = 14,
	[11677] = 14,
	[11678] = 14,
	[27212] = 14,
	[47819] = 14,
	[47820] = 14,
	[5782] = 13,
	[6213] = 13,
	[6215] = 13,
	[6229] = 12,
	[11739] = 12,
	[11740] = 12,
	[28610] = 12,
	[47890] = 12,
	[47891] = 12,
	[6353] = 13,
	[17924] = 13,
	[27211] = 13,
	[30545] = 13,
	[47824] = 13,
	[47825] = 13,
	[6789] = 15,
	[17925] = 15,
	[17926] = 15,
	[27223] = 15,
	[47859] = 15,
	[47860] = 15,
	[17877] = 15,
	[18867] = 15,
	[18868] = 15,
	[18869] = 15,
	[18870] = 15,
	[18871] = 15,
	[27263] = 15,
	[30546] = 15,
	[47826] = 15,
	[47827] = 15,
	[18220] = 5,
	[18937] = 5,
	[18938] = 5,
	[27265] = 5,
	[59092] = 5,
	[27243] = 13,
	[47835] = 13,
	[47836] = 13,
	[28176] = 17,
	[28189] = 17,
	[47892] = 17,
	[47893] = 17,
	[29722] = 13,
	[32231] = 13,
	[47837] = 13,
	[47838] = 13,
	[29858] = 10,
	[29893] = 15,
	[58887] = 15,
	[30108] = 13,
	[30404] = 13,
	[30405] = 13,
	[47841] = 13,
	[47843] = 13,
	[30283] = 15,
	[30413] = 15,
	[30414] = 15,
	[47846] = 15,
	[47847] = 15,
	[47897] = 12,
	[61290] = 12,
	[48018] = 19,
	[48020] = 15,
	[48181] = 15,
	[59161] = 15,
	[59163] = 15,
	[59164] = 15,
	[50796] = 16,
	[59170] = 16,
	[59171] = 16,
	[59172] = 16,
	[53] = 21,
	[921] = 5,
	[1757] = 21,
	[1752] = 21,
	[1776] = 22,
	[1784] = 9,
	[408] = 22,
	[703] = 21,
	[1725] = 22,
	[1758] = 21,
	[1759] = 21,
	[1760] = 21,
	[1766] = 22,
	[1785] = 9,
	[1786] = 9,
	[1787] = 9,
	[1804] = 23,
	[1833] = 21,
	[1842] = 23, 
	[1856] = 9, 
	[1857] = 9,
	[1860] = 24,
	[1966] = 22,
	[2070] = 21,
	[2094] = 22, 
	[2589] = 21,
	[2590] = 21,
	[2591] = 21, 
	[2836] = 24,
	[2983] = 9,
	[3127] = 24,
	[5171] = 25,
	[5277] = 9, 
	[5938] = 21,
	[6760] = 21,
	[6761] = 21,
	[6762] = 21,
	[6768] = 22,
	[6770] = 21,
	[6774] = 25,
	[8621] = 21,
	[8623] = 21,
	[8624] = 21,
	[8631] = 21,
	[8632] = 21,
	[8633] = 21,
	[8637] = 22,
	[8639] = 21,
	[8640] = 21,
	[8643] = 22,
	[8647] = 21,
	[8649] = 21,
	[8650] = 21,
	[8676] = 21,
	[8696] = 9,
	[8721] = 21,
	[8724] = 21,
	[8725] = 21,
	[11197] = 21,
	[11198] = 21,
	[11267] = 21,
	[11268] = 21,
	[11269] = 21,
	[11273] = 21,
	[11274] = 21,
	[11275] = 21,
	[11279] = 21,
	[11280] = 21,
	[11281] = 21,
	[11289] = 21,
	[11290] = 21,
	[11293] = 21,
	[11294] = 21,
	[11297] = 21,
	[11299] = 21,
	[11300] = 21,
	[11303] = 22,
	[11305] = 9,
	[17347] = 21,
	[17348] = 21,
	[25300] = 21,
	[25302] = 22,
	[26669] = 9,
	[26679] = 22,
	[26839] = 21,
	[26861] = 21,
	[26862] = 21,
	[26863] = 21,
	[26864] = 21,
	[26865] = 21,
	[26866] = 21,
	[26867] = 21,
	[26884] = 21,
	[26889] = 9,
	[27441] = 21,
	[27448] = 22,
	[31016] = 21,
	[31224] = 9,
	[32645] = 21,
	[32684] = 21,
	[34411] = 21,
	[34412] = 21,
	[34413] = 21,
	[48637] = 21,
	[48638] = 21,
	[48656] = 21,
	[48657] = 21,
	[48658] = 22,
	[48659] = 22,
	[48660] = 21,
	[48663] = 21,
	[48666] = 21,
	[48667] = 21,
	[48668] = 21,
	[48669] = 21,
	[48671] = 21,
	[48672] = 21,
	[48673] = 22,
	[48674] = 22,
	[48675] = 21,
	[48676] = 21,
	[48689] = 21,
	[48690] = 21,
	[48691] = 21,
	[51722] = 22,
	[51723] = 25,
	[51724] = 21,
	[57934] = 22,
	[57992] = 21,
	[57993] = 21,
	[17] = 15,
	[592] = 15,
	[600] = 15,
	[3747] = 15,
	[6065] = 15,
	[6066] = 15,
	[10898] = 15,
	[10899] = 15,
	[10900] = 15,
	[10901] = 15,
	[25217] = 15,
	[25218] = 15,
	[48065] = 15,
	[48066] = 15,
	[589] = 14,
	[594] = 14,
	[970] = 14,
	[992] = 14,
	[2767] = 14,
	[10892] = 14,
	[10893] = 14,
	[10894] = 14,
	[25367] = 14,
	[25368] = 14,
	[48124] = 14,
	[48125] = 14,
	[585] = 13,
	[591] = 13,
	[598] = 13,
	[984] = 13,
	[1004] = 13,
	[6060] = 13,
	[10933] = 13,
	[10934] = 13,
	[25363] = 13,
	[25364] = 13,
	[48122] = 13,
	[48123] = 13,
	[1243] = 14,
	[1244] = 14,
	[1245] = 14,
	[2791] = 14,
	[10937] = 14,
	[10938] = 14,
	[25389] = 14,
	[48161] = 14,
	[2050] = 13,
	[2052] = 13,
	[2053] = 13,
	[139] = 14,
	[6074] = 14,
	[6075] = 14,
	[6076] = 14,
	[6077] = 14,
	[6078] = 14,
	[10927] = 14,
	[10928] = 14,
	[10929] = 14,
	[25221] = 14,
	[25222] = 14,
	[25315] = 14,
	[48067] = 14,
	[48068] = 14,
	[453] = 14,
	[527] = 26,
	[988] = 26,
	[528] = 14,
	[552] = 14,
	[586] = 12,
	[588] = 17,
	[7128] = 17,
	[602] = 17,
	[1006] = 17,
	[10951] = 17,
	[10952] = 17,
	[25431] = 17,
	[48040] = 17,
	[48168] = 17,
	[596] = 13,
	[996] = 13,
	[10960] = 13,
	[10961] = 13,
	[25316] = 13,
	[25308] = 13,
	[48072] = 13,
	[605] = 13,
	[976] = 14,
	[10957] = 14,
	[10958] = 14,
	[25433] = 14,
	[48169] = 14,
	[1706] = 14,
	[2006] = 13,
	[2010] = 13,
	[10880] = 13,
	[10881] = 13,
	[20770] = 13,
	[25435] = 13,
	[48171] = 13,
	[2054] = 13,
	[2055] = 13,
	[6063] = 13,
	[6064] = 13,
	[2060] = 13,
	[10963] = 13,
	[10964] = 13,
	[10965] = 13,
	[25314] = 13,
	[25210] = 13,
	[25213] = 13,
	[48062] = 13,
	[48063] = 13,
	[2061] = 13,
	[9472] = 13,
	[9473] = 13,
	[9474] = 13,
	[10915] = 13,
	[10916] = 13,
	[10917] = 13,
	[25233] = 13,
	[25235] = 13,
	[48070] = 13,
	[48071] = 13,
	[2096] = 14,
	[10909] = 14,
	[2944] = 14,
	[19276] = 14,
	[19277] = 14,
	[19278] = 14,
	[19279] = 14,
	[19280] = 14,
	[25467] = 14,
	[48299] = 14,
	[48300] = 14,
	[6346] = 15,
	[8092] = 16,
	[8102] = 16,
	[8103] = 16,
	[8104] = 16,
	[8105] = 16,
	[8106] = 16,
	[10945] = 16,
	[10946] = 16,
	[10947] = 16,
	[25372] = 16,
	[25375] = 16,
	[48126] = 16,
	[48127] = 16,
	[8122] = 12,
	[8124] = 12,
	[10888] = 12,
	[10890] = 12,
	[8129] = 13,
	[9484] = 13,
	[9485] = 13,
	[10955] = 13,
	[14752] = 14,
	[14818] = 14,
	[14819] = 14,
	[27841] = 14,
	[25312] = 14,
	[48073] = 14,
	[14914] = 16,
	[15262] = 16,
	[15263] = 16,
	[15264] = 16,
	[15265] = 16,
	[15266] = 16,
	[15267] = 16,
	[15261] = 16,
	[25384] = 16,
	[48134] = 16,
	[48135] = 16,
	[15237] = 17,
	[15430] = 17,
	[15431] = 17,
	[27799] = 17,
	[27800] = 17,
	[27801] = 17,
	[25331] = 17,
	[48077] = 17,
	[48078] = 17,
	[15407] = 14,
	[17311] = 14,
	[17312] = 14,
	[17313] = 14,
	[17314] = 14,
	[18807] = 14,
	[25387] = 14,
	[48155] = 14,
	[48156] = 14,
	[19238] = 12,
	[19236] = 12,
	[19240] = 12,
	[19241] = 12,
	[19242] = 12,
	[19243] = 12,
	[25437] = 12,
	[48172] = 12,
	[48173] = 12,
	[21562] = 14,
	[21564] = 14,
	[25392] = 14,
	[48162] = 14,
	[27681] = 14,
	[32999] = 14,
	[48074] = 14,
	[27683] = 14,
	[39374] = 14,
	[48170] = 14,
	[724] = 16,
	[27870] = 16,
	[27871] = 16,
	[28275] = 16,
	[48086] = 16,
	[48087] = 16,
	[32375] = 13,
	[32379] = 15,
	[32996] = 15,
	[48157] = 15,
	[48158] = 15,
	[32546] = 13,
	[48119] = 13,
	[48120] = 13,
	[33076] = 15,
	[48112] = 15,
	[48113] = 15,
	[34433] = 1,
	[34861] = 14,
	[34863] = 14,
	[34864] = 14,
	[34865] = 14,
	[34866] = 14,
	[48088] = 14,
	[48089] = 14,
	[34914] = 13,
	[34916] = 13,
	[34917] = 13,
	[48159] = 13,
	[48160] = 13,
	[48045] = 14,
	[53023] = 14,
	[47540] = 28,
	[53005] = 28,
	[53006] = 28,
	[53007] = 28,
	[64843] = 12,
	[64901] = 1,
	[331] = 13,
	[332] = 13,
	[2484] = 12,
	[8017] = 17,
	[8042] = 15,
	[131] = 14,
	[325] = 25,
	[370] = 14,
	[421] = 16,
	[526] = 14,
	[403] = 13,
	[529] = 13,
	[546] = 14,
	[547] = 13,
	[548] = 13,
	[556] = 27,
	[913] = 13,
	[915] = 13,
	[930] = 16,
	[939] = 13,
	[943] = 13,
	[959] = 13,
	[1064] = 13,
	[1535] = 15,
	[2008] = 13,
	[2062] = 12,
	[2645] = 19,
	[2825] = 12,
	[2860] = 16,
	[2894] = 12,
	[3738] = 17,
	[5675] = 17,
	[5730] = 12,
	[6041] = 13,
	[6196] = 13,
	[6363] = 17,
	[3599] = 17,
	[6364] = 17,
	[6365] = 17,
	[6375] = 17,
	[6377] = 17,
	[6390] = 12,
	[6391] = 12,
	[6392] = 12,
	[6495] = 17,
	[8004] = 13,
	[8005] = 13,
	[8008] = 13,
	[8010] = 13,
	[8012] = 14,
	[8018] = 17,
	[8019] = 17,
	[8024] = 17,
	[8027] = 17,
	[8030] = 17,
	[8033] = 17,
	[8038] = 17,
	[8042] = 15,
	[8044] = 15,
	[8045] = 15,
	[8046] = 15,
	[8050] = 15,
	[8052] = 15,
	[8053] = 15,
	[8056] = 15,
	[8058] = 15,
	[8075] = 17,
	[8143] = 17,
	[8071] = 17,
	[8154] = 17,
	[8155] = 17,
	[8160] = 17,
	[8161] = 17,
	[8170] = 17,
	[8177] = 12,
	[8181] = 17,
	[8184] = 17,
	[8190] = 17,
	[8227] = 17,
	[8232] = 17,
	[8235] = 17,
	[8249] = 17,
	[8498] = 15,
	[8499] = 15,
	[8512] = 17,
	[10391] = 13,
	[10392] = 13,
	[10395] = 13,
	[10396] = 13,
	[10399] = 17,
	[10406] = 17,
	[10407] = 17,
	[10408] = 17,
	[10412] = 15,
	[10413] = 15,
	[10414] = 15,
	[10427] = 12,
	[10428] = 12,
	[10437] = 17,
	[10438] = 17,
	[10442] = 17,
	[10447] = 15,
	[10448] = 15,
	[10456] = 17,
	[10462] = 17,
	[10463] = 17,
	[10466] = 13,
	[10467] = 13,
	[10468] = 13,
	[10472] = 15,
	[10473] = 15,
	[10478] = 17,
	[10479] = 17,
	[10486] = 17,
	[10495] = 17,
	[10496] = 17,
	[10497] = 17,
	[10526] = 17,	
	[10537] = 17,
	[10538] = 17,
	[10585] = 17,
	[10586] = 17,
	[10587] = 17,
	[10595] = 17,
	[10600] = 17,
	[10601] = 17,
	[10605] = 16,
	[10622] = 13,
	[10623] = 13,
	[11314] = 15,
	[11315] = 15,
	[15207] = 13,
	[15208] = 13,
	[16339] = 17,
	[16341] = 17,
	[16342] = 17,
	[16355] = 17,
	[16356] = 17,
	[16362] = 17,
	[16387] = 17,
	[20609] = 13,
	[20610] = 13,
	[20776] = 13,
	[20777] = 13,
	[25357] = 13,
	[25361] = 17,
	[25391] = 13,
	[25396] = 13,
	[25420] = 13,
	[25422] = 13,
	[25423] = 13,
	[25439] = 16,
	[25442] = 16,
	[25448] = 13,
	[25449] = 13,
	[25454] = 15,
	[25457] = 15,
	[25464] = 15,
	[25489] = 17,
	[25500] = 17,
	[25505] = 17,
	[25508] = 17,
	[25509] = 17,
	[25525] = 12,
	[25528] = 17,
	[25533] = 17,
	[25546] = 15,
	[25547] = 15,
	[25552] = 17,
	[25557] = 17,
	[25560] = 17,
	[25563] = 17,
	[25567] = 17,
	[25570] = 17,	
	[25574] = 17,
	[25590] = 13,
	[29228] = 15,
	[32182] = 12,
	[32593] = 14,
	[32594] = 14,
	[49230] = 15,
	[49231] = 15,
	[49232] = 15,
	[49233] = 15,
	[49235] = 15,
	[49236] = 15,
	[49237] = 13,
	[49238] = 13,
	[49270] = 16,
	[49271] = 16,
	[49272] = 13,
	[49273] = 13,
	[49275] = 13,
	[49276] = 13,
	[49277] = 13,
	[49283] = 14,
	[49284] = 14,
	[51505] = 16,
	[51514] = 16,
	[51730] = 17,
	[51988] = 17,
	[51991] = 17,
	[51992] = 17,
	[51993] = 17,
	[51994] = 17,
	[55458] = 13,
	[55459] = 13,
	[57622] = 17,
	[57720] = 17,
	[57721] = 17,
	[57722] = 17,
	[57994] = 15,
	[58580] = 12,
	[58581] = 12,
	[58582] = 12,
	[58643] = 17,
	[58649] = 17,
	[58652] = 17,
	[58656] = 17,
	[58699] = 17,
	[58703] = 17,
	[58704] = 17,
	[58731] = 17,
	[58734] = 17,
	[58737] = 17,
	[58739] = 17,
	[58741] = 17,
	[58745] = 17,
	[58746] = 17,
	[58749] = 17,
	[58751] = 17,
	[58753] = 17,
	[58755] = 17,
	[58756] = 17,
	[58757] = 17,
	[58771] = 17,
	[58773] = 17,
	[58774] = 17,
	[58785] = 17,
	[58789] = 17,
	[58790] = 17,
	[58794] = 17,
	[58795] = 17,
	[58796] = 17,
	[58801] = 17,
	[58803] = 17,
	[58804] = 17,	
	[59156] = 9,
	[59158] = 9,
	[59159] = 9,
	[60043] = 16,
	[61299] = 15,
	[61300] = 15,
	[61301] = 15,
	[61649] = 15,
	[61657] = 15,
	[1130] = 14,
	[14323] = 14,
	[14324] = 14,
	[14325] = 14,
	[53338] = 14,
	[1978] = 14,
	[13549] = 14,
	[13550] = 14,
	[13551] = 14,
	[13552] = 14,
	[13553] = 14,
	[13554] = 14,
	[13555] = 14,
	[25295] = 14,
	[27016] = 14,
	[49000] = 14,
	[49001] = 14,
	[3044] = 15,
	[14281] = 15,
	[14282] = 15,
	[14283] = 15,
	[14284] = 15,
	[14285] = 15,
	[14286] = 15,
	[14287] = 15,
	[27019] = 15,
	[49044] = 15,
	[49045] = 15,
	[136] = 14,
	[3111] = 14,
	[3661] = 14,
	[3662] = 14,
	[13542] = 14,
	[13543] = 14,
	[13544] = 14,
	[27046] = 14,
	[48989] = 14,
	[48990] = 14,
	[781] = 12,
	[1002] = 13,
	[1462] = 14,
	[1495] = 15,
	[14269] = 15,
	[14270] = 15,
	[14271] = 15,
	[36916] = 15,
	[53339] = 15,
	[1499] = 12,
	[14310] = 12,
	[14311] = 12,
	[1510] = 14,
	[14294] = 14,
	[14295] = 14,
	[27022] = 14,
	[58431] = 14,
	[58434] = 14,
	[1513] = 16,
	[14326] = 16,
	[14327] = 16,
	[1543] = 15,
	[2643] = 15,
	[14288] = 15,
	[14289] = 15,
	[14290] = 15,
	[25294] = 15,
	[27021] = 15,
	[49047] = 15,
	[48048] = 15,
	[2974] = 14,
	[3034] = 15,
	[3043] = 14,
	[3045] = 12,
	[5116] = 15,
	[5384] = 12,
	[6197] = 14,
	[13795] = 12,
	[14302] = 12,
	[14303] = 12,
	[14304] = 12,
	[14305] = 12,
	[27023] = 12,
	[49055] = 12,
	[49056] = 12,
	[13809] = 12,
	[13813] = 12,
	[14316] = 12,
	[14317] = 12,
	[27025] = 12,
	[49066] = 12,
	[49067] = 12,
	[2973] = 12,
	[14260] = 12,
	[14261] = 12,
	[14262] = 12,
	[14263] = 12,
	[14264] = 12,
	[14265] = 12,
	[14266] = 12,
	[27014] = 12,
	[48995] = 12,
	[48996] = 12,
	[19263] = 7,
	[19801] = 15,
	[20736] = 15,
	[19434] = 15,
	[20900] = 15,
	[20901] = 15,
	[20902] = 15,
	[20903] = 15,
	[20904] = 15,
	[27065] = 15,
	[49049] = 15,
	[49050] = 15,
	[19306] = 15,
	[20909] = 15,
	[20910] = 15,
	[27067] = 15,
	[48998] = 15,
	[48999] = 15,
	[19386] = 15,
	[24132] = 15,
	[24133] = 15,
	[27068] = 15,
	[49011] = 15,
	[49012] = 15,
	[34026] = 15,
	[56641] = 13,
	[34120] = 13,
	[49051] = 13,
	[49052] = 13,
	[34477] = 15,
	[34600] = 12,
	[53271] = 15,
	[53351] = 15,
	[61005] = 15,
	[61006] = 15,
	[53301] = 15,
	[60051] = 15,
	[60052] = 15,
	[60053] = 15,
	[60192] = 15,
	[62757] = 4,
	[3674] = 15,
	[63668] = 15,
	[63669] = 15,
	[63670] = 15,
	[63671] = 15,
	[63672] = 15,
	[19577] = 15,
	[19574] = 15,
	[34490] = 15,
	[19503] = 15,
	[53209] = 15,
	[12042] = 9,
	[12043] = 9,
	[31589] = 14,
	[12472] = 12,
	[11958] = 9,
	[31687] = 12,
	[44572] = 15,
	[20216] = 12,
	[53563] = 14,
	[53595] = 14,
	[20375] = 17,
	[35395] = 15,
	[53385] = 12,
	[20066] = 15,
	[14751] = 7,
	[10060] = 15,
	[33206] = 15,
	[47788] = 15,
	[15487] = 15,
	[15473] = 12,
	[47585] = 7,
	[64044] = 15,
	[51662] = 21,
	[13877] = 29,
	[13750] = 7,
	[51690] = 29,
	[14278] = 22,
	[16511] = 21,
	[36554] = 22,
	[51713] = 7,
	[16166] = 7,
	[30706] = 17,
	[51490] = 7,
	[17364] = 15,
	[60103] = 15,
	[51533] = 12,
	[16188] = 7,
	[974] = 14,
	[61295] = 15,
	[18223] = 14,
	[19028] = 14,
	[18708] = 7,
	[47193] = 12,
	[12328] = 3,
	[46924] = 3,
	[12323] = 4,
	[12292] = 3,
	[23881] = 6,
	[23892] = 6,
	[23893] = 6,
	[23894] = 6,
	[25251] = 6,
	[30335] = 6,
	[12809] = 6,
	[50720] = 5,
	[46968] = 3
	
--Blink uses templateNumber 1.
--so does Fire Blast
}

--format: [templateNumber] = {powerLine, powerType, cooldownLine, rangeLine, castLine}
--powerLine tells which line cost is located. powerType is the type of resource.
--cooldownLine is which line cooldowns are located.
local TemplateTable = 
{
	[1] = {0, 0, 6, 3, 0},
	[2] = {3, 1, 0, 4, 0},
	[3] = {3, 1, 6, 0, 0},
	[4] = {3, 1, 0, 0, 0},
	[5] = {0, 0, 0, 3, 0},
	[6] = {3, 1, 6, 4, 0},
	[7] = {0, 0, 3, 0, 0},
	[8] = {3, 1, 0, 4, 5},
	[9] = {0, 0, 4, 0, 0},
	[10] = {3, 4294967294, 6, 0, 0},
	[11] = {3, 1, 6, 4, 5},
	[12] = {3, 0, 6, 0, 0},
	[13] = {3, 0, 0, 4, 5},
	[14] = {3, 0, 0, 4, 0},
	[15] = {3, 0, 6, 4, 0},
	[16] = {3, 0, 6, 4, 5},
	[17] = {3, 0, 0, 0, 0},
	[18] = {5, 0, 8, 6, 7},
	[19] = {3, 0, 0, 0, 5},
	[20] = {3, 4294967294, 0, 4, 0},
 	[21] = {3, 3, 0, 4, 0},
 	[22] = {3, 3, 6, 4, 0},
 	[23] = {0, 0, 0, 3, 5},
 	[24] = {0, 0, 0, 0, 0},
 	[25] = {3, 3, 0, 0, 0},
	[26] = {5, 0, 0, 6, 0}, 
	[27] = {3, 0, 6, 0, 5},
	[28] = {5, 0, 8, 6, 0},
	[29] = {3, 3, 6, 0, 0}
--This reads as "Template Number 1 has a Mana Cost value on line 3, and a cooldown on line 6."
}

--Don't touch this table if you're editing tooltips, it's used for optimization and data storing.
--data table for tooltip correction
--format [spellid] = {powerLine, powerVal, powerType, cooldownLine, CD val, rangeLine, rangeVal, updateVal?, castLine, castVal}
local dataTable = {}



local function GetTipNum()
	TipNum = GameTooltip:NumLines()
end

local function GetID()
	_, _, TipID = GameTooltip:GetSpell()
end


local function RequestIDCheck(spellid)
	
	AIO.Handle("TooltipAIO", "HasSpellID", spellid)

end


function tTHandler.ReceiveIDCheck(player, check)
	spellCheck = check
end

function RequestSpellCost(spellid) 

	if(dataTable[spellid]) then 

		if(dataTable[spellid][8]) then 
			AIO.Handle("TooltipAIO", "CostGrabber", spellid)
			AIO.Handle("TooltipAIO", "CooldownGrabber", spellid)
			dataTable[spellid][8] = false
			--print("updating values")
			skipCheck = true
		else 
			--print("no need to updates values")
			skipCheck = false
		end	
	else

		AIO.Handle("TooltipAIO", "CostGrabber", spellid)

		local skipCheck = true
		local tmpTemplate = TemplateTable[TaggedSpells[spellid]]
		local insertFmt = {tmpTemplate[1], 0, tmpTemplate[2], tmpTemplate[3], 0, tmpTemplate[4], 0, true, tmpTemplate[5], 0}
		dataTable[spellid] = insertFmt


		dataTable[spellid][8] = false
	end

end

function tTHandler.RefreshTable(player)

	for k,v in pairs(dataTable) do 
		dataTable[k][8] = true
	end
end

function tTHandler.ReceiveCostGrab(player, cost, powerType)
	--print(cost)

	modCost = cost
	dataTable[TipID][2] = modCost
	dataTable[TipID][3] = powerType
--print("ReceiveCostGrab Fired")
end

function tTHandler.ReceiveCDGrab(player, cooldown)
	--print(cooldown)
	modCooldown = (cooldown / 1000)
	dataTable[TipID][5] = modCooldown
	--print("ReceiveCDGrab Fired")	
end

function tTHandler.ReceiveRangeGrab(player, range)

	modRange = range
	dataTable[TipID][7] = modRange
end

function tTHandler.ReceiveCastTime(player, castTime)
	modCastTime = castTime
	dataTable[TipID][10] = modCastTime
end

local function EnumerateTooltipLines_helper(...)
	--this grabs all the lines from the original tooltip, and stores them.
	for x = 1, select("#", ...) do
		--print(x .. " Enumeratedtooltiplinevar")
		local region = select(x, ...)
		if region and region:GetObjectType() == "FontString" then
			local text = region:GetText() -- string or nil
			--print(x .. " was X, and the text is " .. text)
			--print(x)
			--print(text)
			tab[x] = text
		end
	end


end

function EnumerateTooltipLines(tooltip)
	EnumerateTooltipLines_helper(tooltip:GetRegions())
end

function tTHandler.UpdateTooltips()

	local powerString
	if(dataTable[TipID][3] == 0) then
	powerString = " Mana"
	elseif(dataTable[TipID][3] == 1) then
	powerString = " Rage"
	elseif(dataTable[TipID][3] == 2) then 
	powerString = " Focus"
	elseif(dataTable[TipID][3] == 3) then 
	powerString = " Energy"
	elseif(dataTable[TipID][3] > 8) then
	powerString = " Health"	
	end
	


	for x = 10, 35 do 

		if(x == (dataTable[TipID][1] + 9)) then
			if(dataTable[TipID][3] == 1) then 
				tab[x] = (dataTable[TipID][2] / 10) .. powerString
			else 
				tab[x] = dataTable[TipID][2] .. powerString
			end

		end

		if(x == (dataTable[TipID][4] + 9)) then
			tab[x] = dataTable[TipID][5] .. " sec cooldown"
		end

		if(x == dataTable[TipID][6] + 9) then
			tab[x] = dataTable[TipID][7] .. " yds"
		end

		if(x == dataTable[TipID][9] + 9) then 
			tab[x] = (dataTable[TipID][10] / 1000) .. " sec cast"
		end
	
	end


	
	local i = 10
	GameTooltip:ClearLines ()
	while i <= 35 do
		if(i <= 13) then
			GameTooltip:AddDoubleLine (tab[i], tab[i+1])
			i = i + 2

		elseif (tab[i]) then
			GameTooltip:AddLine (tab[i], 1, 1, 1, true)
			i = i + 1
			else
			i = i + 1
		end
	end
	GameTooltip:Show()
	currentlyProcessing = false
	local o = 10
	while o <= 35 do
		tab[o] = nil
		o = o + 1
	end
end

function locUpdateTooltips() 

	local powerString
	if(dataTable[TipID][3] == 0) then
		powerString = " Mana"
	elseif(dataTable[TipID][3] == 1) then
		powerString = " Rage"
	elseif(dataTable[TipID][3] == 2) then 
		powerString = " Focus"
	elseif(dataTable[TipID][3] == 3) then 
		powerString = " Energy"
	elseif(dataTable[TipID][3] > 8) then
		powerString = " Health"	
	end
	

	for x = 10, 35 do 

		if(x == (dataTable[TipID][1] + 9)) then
			if(dataTable[TipID][3] == 1) then 
				tab[x] = (dataTable[TipID][2] / 10) .. powerString
			else 
				tab[x] = dataTable[TipID][2] .. powerString
			end

		end

		if(x == (dataTable[TipID][4] + 9)) then
			tab[x] = dataTable[TipID][5] .. " sec cooldown"
		end

		if(x == dataTable[TipID][6] + 9) then
			tab[x] = dataTable[TipID][7] .. " yds"
		end
	
		if(x == dataTable[TipID][9] + 9) then 
			if(dataTable[TipID][10] == 0) then 
				tab[x] = "Instant cast"
			else 
				tab[x] = (dataTable[TipID][10] / 1000) .. " sec cast"
			end
		end
	end

	local i = 10
	GameTooltip:ClearLines ()

	while i <= 35 do
		if(i <= 13) then
			GameTooltip:AddDoubleLine (tab[i], tab[i+1])
			i = i + 2

		elseif (tab[i]) then
			GameTooltip:AddLine (tab[i], 1, 1, 1, true)
			i = i + 1
			else
			i = i + 1
		end
	end
	GameTooltip:Show()
	currentlyProcessing = false
	local o = 10
	while o <= 35 do
		tab[o] = nil
		o = o + 1
	end

end

local function GetCorrection(spellID)
	--z var for ensuring ordered entries.

	tempNum = TaggedSpells[spellID]
	pTemplateTable = TemplateTable[tempNum]

end


local function ModifyTip ()
	if(currentlyProcessing == false) then 
		currentlyProcessing = true
		if(GameTooltip:GetSpell ()) then
			--skip check if training frame and spell is known--
				local frame =  GetMouseFocus()
				if (frame and frame:GetName()) then
					if string.find(frame:GetName(), "TrainingFrame") then
				 local spellname,rank,spellid = GameTooltip:GetSpell()
    				if (GameTooltip:GetSpell() and IsSpellLearned(spellid) and (GetItemCount(1101243) > 0)) then
        				return false
    				end
    			end
    			end
				-- end--
			GetID()
			if(TaggedSpells[TipID]) then 
				GetTipNum()
				GetCorrection(TipID)

				EnumerateTooltipLines(GameTooltip)
				RequestSpellCost(TipID)
				if((dataTable[TipID][8] == false) and (skipCheck == false)) then 
					locUpdateTooltips()
				end
			else 
			currentlyProcessing = false
			end
		else 
		currentlyProcessing = false
		end
	elseif(not GameTooltip:GetSpell()) then
		currentlyProcessing = false
	end
end

GameTooltip:HookScript("OnShow", ModifyTip)
