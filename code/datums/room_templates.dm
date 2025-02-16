/*
    room_templates.dm
    
    This file handles placing semi-random rooms from template files in _maps/rooms
    The map_template datums are initialized in the mapping subsystem. Everything else is selfcontained here.

    To make and place map templates first decide where/what you want your template to be.
    (i.e. engineering, research rooms, maintenance rooms)
    
    Decide the size of your room (width, height).
    Create a .dmm file in _maps/rooms
    Define a datum for it (/datum/map_template/room/...)
    Create a room placer landmark (/obj/effect/landmark/room_placer/...)

    Remember: BYOND maps start on the bottom left (0,0) and extend to the top right (9999, 9999), so place a landmark in the bottom left.

*/

/datum/map_template/room
    name = "Station room"
    var/room_id
/datum/map_template/room/Large35x
    name = "35x35 template"
    width = 35
    height = 35
// 35x35 templates    
/datum/map_template/room/Large35x/supermatter
    room_id = "supermatter35x"
    name = "Supermatter 35x35"
    mappath = "_maps/rooms/35x35_engine_sm.dmm"

/datum/map_template/room/Large35x/singularity
    room_id = "singularity35x"
    name = "Singularity 35x35"
    mappath = "_maps/rooms/35x35_engine_singularity.dmm"

/datum/map_template/room/Large35x/tesla
    room_id = "tesla35x"
    name = "Tesla 35x35"
    mappath = "_maps/rooms/35x35_engine_tesla.dmm"

/datum/map_template/room/Large35x/diy
    room_id = "diy35x"
    name = "DIY Empty 35x35"
    mappath = "_maps/rooms/35x35_engine_diy.dmm"

/datum/map_template/room/Large35x/empty
    room_id = "empty35x"
    name = "DIY Empty 35x35"
    mappath = "_maps/rooms/35x35_engine_empty_diy.dmm"

/datum/map_template/room/Large35x/teg
    room_id = "teg35x"
    name = "TEG 35x35"
    mappath = "_maps/rooms/35x35_engine_teg.dmm"

// spawner landmarks
/obj/effect/landmark/room_placer/
    var/datum/map_template/room_template = null

/obj/effect/landmark/room_placer/Destroy() //might not be neccessary
	room_template = null 

/obj/effect/landmark/room_placer/Initialize(mapload)
    ..()

    if(room_template != null)
        var/turf/room_loc = get_turf(src)
        var/datum/map_template/room/N = new room_template()
        N.load(room_loc, centered = FALSE)

    return INITIALIZE_HINT_QDEL

// 35x35 spawners (engines mainly)
/obj/effect/landmark/room_placer/Large35x
    icon = 'icons/effects/rooms35x35.dmi'

/obj/effect/landmark/room_placer/Large35x/engine/
    icon_state = "engine"

// static engines spawners
/obj/effect/landmark/room_placer/Large35x/engine/supermatter
    name = "Supermatter 35x35"
    room_template = /datum/map_template/room/Large35x/supermatter

/obj/effect/landmark/room_placer/Large35x/engine/sinuglo
    name = "Singularity 35x35"
    room_template = /datum/map_template/room/Large35x/singularity

/obj/effect/landmark/room_placer/Large35x/engine/tesla
    name = "Tesla 35x35"
    room_template = /datum/map_template/room/Large35x/tesla

/obj/effect/landmark/room_placer/Large35x/engine/diy
    name = "DIY 35x35"
    room_template = /datum/map_template/room/Large35x/diy

/obj/effect/landmark/room_placer/Large35x/engine/empty // the doors literally open to space
    name = "DIY Empty 35x35"
    room_template = /datum/map_template/room/Large35x/empty

/obj/effect/landmark/room_placer/Large35x/engine/teg
    name = "TEG 35x35"
    room_template = /datum/map_template/room/Large35x/teg

// RANDOM engine spawner

/obj/effect/landmark/room_placer/Large35x/engine/random // could make a subtype that has a different potential engine list i.e. /normal /zany
    name = "Random 35x35 engine"

    var/list/normal_engines = list (
        /datum/map_template/room/Large35x/supermatter = 20,
        /datum/map_template/room/Large35x/singularity = 10,
        /datum/map_template/room/Large35x/tesla = 10,
        /datum/map_template/room/Large35x/teg = 5,
    )

    var/list/uncommon_engines = list ( // eventually i'll add something other than DIY
        /datum/map_template/room/Large35x/diy = 2,
        /datum/map_template/room/Large35x/empty = 1,
        
    )

/obj/effect/landmark/room_placer/Large35x/engine/random/Initialize(mapload)
    ..()

    if(prob(80))
        room_template = pickweight(normal_engines)
    else
        room_template = pickweight(uncommon_engines)

    if(room_template != null)
        var/turf/room_loc = get_turf(src)
        var/datum/map_template/room/N = new room_template()
        N.load(room_loc, centered = FALSE)


    return INITIALIZE_HINT_QDEL


    




