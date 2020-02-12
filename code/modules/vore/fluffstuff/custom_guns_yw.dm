/* TUTORIAL
	"icon" is the file with the HUD/ground icon for the item
	"icon_state" is the iconstate in this file for the item
	"icon_override" is the file with the on-mob icons, can be the same file
	"item_state" is the iconstate for the on-mob icons:
		item_state_s is used for worn uniforms on mobs
		item_state_r and item_state_l are for being held in each hand

	"item_state_slots" can replace "item_state", it is a list:
		item_state_slots["slotname1"] = "item state for that slot"
		item_state_slots["slotname2"] = "item state for that slot"

	on guns, in particular:
	item_state being null makes it look for exactly the icon_state in the on-mob file,
		including any 0,75,etc appended from the energy bar setting
	item_state being present prevents different mode sprites, sadly, but you may
		be able to override this on the gun itself with a proc
*/

/* TEMPLATE
//ckey:Character Name
/obj/item/weapon/gun/type/fluff/charactername
	name = ""
	desc = ""

	icon = 'icons/vore/custom_guns_vr.dmi'
	icon_state = "myicon"

	icon_override = 'icons/vore/custom_guns_vr.dmi'
	item_state = "myicon"

*/

/obj/item/weapon/gun/energy/retro/dominelocked
	name = "Microchipped Retro Laser"
	desc = "A rather vintage model of laser pistol, with a distinctive blue square emblem near the front. An embedded RFID tag indicates that it's been outfitted with a safety interlock that prevents it from being used on any facility levels without authorization."
	
	icon = 'icons/vore/custom_items_yw.dmi'
	icon_state = "domine_retro"
	
	cell_type = null
	req_access = list(access_armory) //for toggling safety
	var/locked = 1

/obj/item/weapon/gun/energy/retro/dominelocked/attackby(obj/item/I, mob/user)
	var/obj/item/weapon/card/id/id = I.GetID()
	if(istype(id))
		if(check_access(id))
			locked = !locked
			to_chat(user, "<span class='warning'>You [locked ? "enable" : "disable"] the safety lock on \the [src].</span>")
		else
			to_chat(user, "<span class='warning'>Access denied.</span>")
		user.visible_message("<span class='notice'>[user] swipes \the [I] against \the [src].</span>")
	else
		return ..()

/obj/item/weapon/gun/energy/retro/dominelocked/emag_act(var/remaining_charges,var/mob/user)
	..()
	locked = !locked
	to_chat(user, "<span class='warning'>You [locked ? "enable" : "disable"] the safety lock on \the [src]!</span>")

/obj/item/weapon/gun/energy/retro/dominelocked/special_check(mob/user)
	if(locked)
		var/turf/T = get_turf(src)
		if(T.z in using_map.map_levels)
			to_chat(user, "<span class='warning'>The safety device prevents the gun from firing this close to the facility.</span>")
			return 0
	return ..()
	
/obj/item/weapon/gun/energy/retro/dominelocked/update_icon() //override the icon update proc and abort for now, we don't have charge level icon states
	return