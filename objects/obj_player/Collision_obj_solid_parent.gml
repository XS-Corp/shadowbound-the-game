if (global.player_in_light) {
    var l1 = bbox_left;
    var r1 = bbox_right;
    var t1 = bbox_top;
    var b1 = bbox_bottom;

    var l2 = other.bbox_left;
    var r2 = other.bbox_right;
    var t2 = other.bbox_top;
    var b2 = other.bbox_bottom;

    var l_overlap = r1 - l2;
    var r_overlap = r2 - l1;
    var t_overlap = b1 - t2;
    var b_overlap = b2 - t1;

    if (l_overlap <= 0) l_overlap = 1000000000;
    if (r_overlap <= 0) r_overlap = 1000000000;
    if (t_overlap <= 0) t_overlap = 1000000000;
    if (b_overlap <= 0) b_overlap = 1000000000;

    var m = min(l_overlap, r_overlap);
    m = min(m, t_overlap);
    m = min(m, b_overlap);

    if (m == l_overlap) {
        x -= (l_overlap + 1);
    } else if (m == r_overlap) {
        x += (r_overlap + 1);
    } else if (m == t_overlap) {
        y -= (t_overlap + 1);
    } else {
        y += (b_overlap + 1);
    }
}
