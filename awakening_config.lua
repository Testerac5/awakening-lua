--[[SYSTEM PREFERENCES
	------------------
	CustomClasses				- Are Shard's custom classes installed?
	EnableDeathAnnouncer		- Set to true if you wish PvP deaths to be announced globally.
	ClassColorCodes				- Table of color codes, correspond to default WoW classes.
]]
EnableDeathAnnouncer			= true
ClassColorCodes 				= {"C79C6E", "F58CBA", "ABD473", "FFF569", "FFFFFF", "C41F3B", "0070DE", "69CCF0", "9482C9", nil, "FF7D0A"}

--[[AWAKENING PREFERENCES
	-----------------
	SpellCooldownMult			- Affects the rate of cooldown for all shard_spell_table defined spells.
	StatPointsPerLevel			- Amount of Stat Allocation points granted upon Level Up.
	GroupBonusExpMultiplier		- This number will be multiplied by the level of the killed mob to calculate bonus EXP gain.
	GroupBonusExpLevelDiff		- The maximum levels higher a player can be than the mob he kills to gain bonus EXP.
	PvPLevelDiff				- Players that die to a player that has this much of a level advantage will not drop loot.
	xpdist						- Distance at which group members will gain bonus experience when another group member scores a PvE kill.
	tokenid						- ID of token to be given to player on levelup
]]
SpellCooldownMult				= 1
StatPointsPerLevel				= 5
GroupBonusExpMultiplier			= 0
GroupBonusExpLevelDiff			= 5
PvPLevelDiff					= 5
xpdist							= 74
tokenid							= 383080
talentid						= 383081
safety_ids						= {489, 529, 30, 562, 617, 559, 572, 566, 607}

--[[COMMAND PREFERENCES
	-------------------
	ReloadSpellsCommand			- Reloads the shard_spells_table data.
	CullCharactersCommand		- Sweeps through the various Shard tables and deletes characters that don't exist in the "characters" table.
]]

ReloadSpellsCommand 			= "%reload spells"
CullCharactersCommand			= "%cull characters"	--Disabled, incomplete/broken.