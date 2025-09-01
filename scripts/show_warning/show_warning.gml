/// @function show_warning(text, px, py)
/// @param text
/// @param px
/// @param py

var text = argument0;
var px = argument1;
var py = argument2;

if (!is_real(px) || !is_real(py)) exit;
if (!layer_exists("Warnings")) exit;
if (!object_exists(obj_warning_text)) exit;

var inst = instance_create_layer(px, py, "Warnings", obj_warning_text);
inst.warning_text = text;
