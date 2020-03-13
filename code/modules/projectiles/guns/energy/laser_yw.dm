///START OF GAUSS WEAPONRY -Radiantflash ///
/obj/item/weapon/gun/energy/soapenergy/gauss
	name = "gauss pistol"
	icon = 'icons/obj/gun_yw.dmi'
	icon_state = "gausspistol"
	item_state = "gauss"
	desc = "An older model of the experimental Gauss weapon series produced by Hephaestus industries. As it is unable to pass through glass, it was phased out during the mars-sol conflict due to the invention of laser carbines.Nevertheless, it still packs a punch and is easy to maintain, making it a favorite amongst sol privateers."
	force = 5
	fire_sound = 'sound/weapons/laser4.ogg' //lighter damage sound
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	w_class = 2
	projectile_type = /obj/item/projectile/energy/gauss
	origin_tech = null
	charge_cost = 250
	self_recharge = 1
	charge_meter = 1
	fire_delay = 10 //old technology

/obj/item/weapon/gun/energy/soapenergy/gaussrifle
	name = "gauss rifle"
	icon = 'icons/obj/gun_yw.dmi'
	icon_state = "gaussrifle"
	item_state = "gaussrifle"
	desc = "An older model of the experimental Gauss weapon series produced by Hephaestus industries. As it is unable to pass through glass, it was phased out during the mars-sol conflict due to the invention of laser carbines.Nevertheless, it still packs a punch and is easy to maintain, making it a favorite amongst sol privateers."
	force = 5
	fire_sound = 'sound/weapons/Gauss_shoot.ogg'
	slot_flags = SLOT_BELT|SLOT_BACK
	w_class = 4
	projectile_type = /obj/item/projectile/energy/gaussrifle
	origin_tech = null
	charge_cost =400
	self_recharge = 1
	charge_meter = 1
	recoil = 1
	fire_delay = 27 //old technology
///END OF GAUSS WEAPONRY///

/obj/item/weapon/gun/energy/laser/pumped
	name = "DCP laser carbine"
	desc = "A new model of laser carbine for the civilian market, the G42 utilizes Hephaestus Industries' proprietary new 'Dynamic Compression Pump' technology, requiring the operator prime the emitter between shots using a manual pump built into the foregrip. This doesn't actually make it any more powerful, but the delay it adds to operation is said to make users more cautious. It has only the single firing mode in exchange."
	var/recentpump = 0
	var/primed = 0
	var/action_sound = 'sound/weapons/shotgunpump.ogg'
	var/failed_sound = 'sound/machines/defib_failed.ogg'
	projectile_type = /obj/item/projectile/beam/burstlaser	//slightly weaker beam
	//charge_cost = 240 //default value for reference, could reduce?
	firemodes = null

/obj/item/weapon/gun/energy/laser/pumped/special_check(mob/user)
	if(!primed)
		to_chat(user, "<span class='warning'>The emitter isn't primed!</span>")
		return 0
	return ..()

/obj/item/weapon/gun/energy/laser/pumped/attack_self(mob/living/user as mob)
	if(world.time >= recentpump + 10 && primed >= 1) //on the offchance someone *somehow* sets it to more than 1
		to_chat(user, "<span class='warning'>The emitter is already primed!</span>")
		recentpump = world.time
	else if(world.time >= recentpump + 10 && power_supply.charge >= charge_cost && primed == 0)
		playsound(user, action_sound, 60, 1)
		primed = 1
		to_chat(user, "<span class='warning'>You prime the laser's emitter!</span>")
		recentpump = world.time
	else if(world.time >= recentpump + 10 && power_supply.charge < charge_cost)
		playsound(user, failed_sound, 60, 1)
		to_chat(user, "<span class='warning'>Insufficient power!</span>")
		recentpump = world.time

/obj/item/weapon/gun/energy/laser/pumped/handle_post_fire(mob/user, atom/target, var/pointblank=0, var/reflex=0)
	..()
	primed = 0