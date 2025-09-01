/// @function save_globals_to_ini(filename, section)
/// @param filename
/// @param section

function save_globals_to_ini(_file, _section) {
    ini_open(_file);

    var keys = [
        "passed",
		"shadowcoins",
		"bought_sprint",
		"bought_timestop",
		"bought_ltime",
		"bought_mores",
		"stole_item",
		"ecutscene"
    ];

    for (var i = 0; i < array_length(keys); i++) {
        var key = keys[i];
        if (variable_global_exists(key)) {
            ini_write_string(_section, key, string(variable_global_get(key)));
        }
    }

    ini_close();
}
