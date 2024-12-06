/datum/map_template/room
    name = "Station room"
    var/room_id
    


//35x35 rooms 
//engines (vm36)
/datum/map_template/room/Large35x
    name = "35x35 template"
    width = 35
    height = 35

/datum/map_template/room/Large35x/supermatter
    room_id = "supermatter35x"
    name = "Supermatter 35x35"
    mappath = "_maps/rooms/35x35_engine_sm.dmm"


/datum/map_template/room/Large35x/diy_stocked
    room_id = "diy35x"
    name = "DIY 35x35"
    mappath = "_maps/rooms/35x35_engine_diy.dmm"
//



//move to another file eventually
/obj/effect/landmark/room_placer/
    var/datum/map_template/room_template = null


/obj/effect/landmark/room_placer/Destroy() //might not be neccessary
	room_template = null 


/obj/effect/landmark/room_placer/Large35x/engine/
    icon = 'icons/effects/landmarks_static.dmi'
    icon_state = "random_35x35_engine"

/obj/effect/landmark/room_placer/Large35x/engine/random

/* //prefixed
/obj/effect/landmark/room_placer/35x35/engine/supermatter
/obj/effect/landmark/room_placer/35x35/engine/singularity
*/


// pre-fixed engines spawns
/obj/effect/landmark/room_placer/Large35x/engine/supermatter
    name = "Supermatter 35x35"
    icon_state = "random_35x35_engine"
    room_template = /datum/map_template/room/Large35x/supermatter


/obj/effect/landmark/room_placer/Large35x/engine/supermatter/Initialize(mapload)
    ..()

    var/turf/room_loc = get_turf(src)
    var/datum/map_template/room/N = new room_template()

    N.load(room_loc, centered = FALSE)

    //if(template != null)    
    return INITIALIZE_HINT_QDEL


