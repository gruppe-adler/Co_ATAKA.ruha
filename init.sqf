["BLU_F", "UsMPT"] call GRAD_Loadout_fnc_FactionSetLoadout;
["OPF_F", "RuFlora"] call GRAD_Loadout_fnc_FactionSetLoadout;

RHSDecalsOff = true;

// disable auto spotting and similar shit
enableSentences false;
enableRadio false;
showChat false;

{
	_x setMarkerAlphaLocal 0;
} forEach [
	"mrk_convoy_1",
	"mrk_convoy_2",
	"mrk_convoy_3",
	"mrk_convoy_4",
	"mrk_convoy_5"
];