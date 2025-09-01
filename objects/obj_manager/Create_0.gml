if (!load_save_if_exists("save.ini", "GameData")) {
    global.passed = 0;
	global.shadowcoins = 0;
	global.bought_sprint = false;
	global.bought_timestop = false;
	global.bought_ltime = false;
	global.bought_mores = false;
	global.stole_item = false;
	global.ecutscene = false;
}
if (!variable_global_exists("passed")) {
    global.passed = 0;
}
if (!variable_global_exists("shadowcoins")) {
    global.shadowcoins = 0;
}
if (!variable_global_exists("bought_sprint")) {
    global.bought_sprint = false;
}
if (!variable_global_exists("bought_timestop")) {
    global.bought_timestop = false;
}
if (!variable_global_exists("bought_ltime")) {
    global.bought_ltime = false;
}
if (!variable_global_exists("bought_mores")) {
    global.bought_mores = false;
}
if (!variable_global_exists("stole_item")) {
    global.stole_item = false;
}
if (!variable_global_exists("ecutscene")) {
    global.ecutscene = false;
}

global.playerx = 395;
global.playery = 410;
global.paused = false;
