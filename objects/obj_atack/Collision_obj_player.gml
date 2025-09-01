if(global.timestop) exit;

effect_create_above(ef_explosion, x, y, 1, c_yellow);

global.hp -= 10;

instance_destroy();
