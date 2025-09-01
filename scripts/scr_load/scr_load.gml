/// @function load_save_if_exists(filename, section)
/// @param filename (save.ini)
/// @param section (gamedata)

function load_save_if_exists(_file, _section) {
    if (file_exists(_file)) {
        ini_open(_file);

        if (ini_key_exists(_section, "passed")) {
            global.passed = ini_read_real(_section, "passed", 0);
        }
		if (ini_key_exists(_section, "shadowcoins")) {
            global.shadowcoins = ini_read_real(_section, "shadowcoins", 0);
        }
		if (ini_key_exists(_section, "bought_sprint")) {
            global.bought_sprint = ini_read_real(_section, "bought_sprint", false);
        }
		if (ini_key_exists(_section, "bought_timestop")) {
            global.bought_timestop = ini_read_real(_section, "bought_timestop", false);
        }
		if (ini_key_exists(_section, "bought_ltime")) {
            global.bought_ltime = ini_read_real(_section, "bought_ltime", false);
        }
		if (ini_key_exists(_section, "bought_mores")) {
            global.bought_mores = ini_read_real(_section, "bought_mores", false);
        }
		if (ini_key_exists(_section, "stole_item")) {
            global.stole_item = ini_read_real(_section, "stole_item", false);
        }
		if (ini_key_exists(_section, "ecutscene")) {
            global.ecutscene = ini_read_real(_section, "ecutscene", false);
        }

        ini_close();
        return true;
    } else {
        return false;
    }
}
