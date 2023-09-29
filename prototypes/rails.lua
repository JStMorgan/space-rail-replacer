hash = {}

subelements = {"stone_path", "stone_path_background", "ties"}
straight_picture_ids = 
{
	{"straight_rail_horizontal", "straight-rail-horizontal"},
	{"straight_rail_vertical", "straight-rail-vertical"},
	{"straight_rail_diagonal_left_top", "straight-rail-diagonal"},
	{"straight_rail_diagonal_right_top", "straight-rail-diagonal"},
	{"straight_rail_diagonal_right_bottom", "straight-rail-diagonal"},
	{"straight_rail_diagonal_left_bottom", "straight-rail-diagonal"}
}

ptype = table.deepcopy(data.raw["straight-rail"]["straight-rail"])
for _, id in ipairs(straight_picture_ids) do
    for _, element in ipairs(subelements) do
        ptype.pictures[id[1]][element].filename = string.format("__space-exploration-graphics__/graphics/entity/space-rail/sr/%s.png", id[2][element])
        --ptype.pictures[id[1]][element].hr_version.filename = string.format("__space-exploration-graphics__/graphics/entity/space-rail/hr/hr-%s.png", id[2][element])
    end
end

table.insert(hash, ptype)