0 setFog [0.04,0.1,60];

40 setFog [0.04,0.1,31];

{ 
	_x setSkill ["aimingShake", 0.3]; 
	_x setSkill ["aimingSpeed", 0.9]; 
	_x setSkill ["endurance", 0.6]; 
	_x setSkill ["spotDistance", 1]; 
	_x setSkill ["spotTime", 0.9]; 
	_x setSkill ["spottingTime", 1]; 
	_x setSkill ["courage", 1]; 
	_x setSkill ["reloadSpeed", 1]; 
	_x setSkill ["commanding", 1];
	_x setSkill ["general", 1];

} forEach allUnits;