/datum/design/item/weapon/phase/AssembleDesignName()
	..()
	name = "Blaster prototype ([item_name])"
	
// Excursion Prototype Blasters
/datum/design/item/weapon/blaster/pistol
	id = "blasterpistol"
	req_tech = list(TECH_COMBAT = 4, TECH_MAGNET = 2, TECH_POWER = 3, TECH_BLUESPACE = 3)
	materials = list(DEFAULT_WALL_MATERIAL = 4000, "glass" = 500, "uranium" = 500, "gold" = 500, "diamond" = 250)
	build_path = /obj/item/weapon/gun/energy/excursion/pistol
	sort_string = "MACAA"
	
/datum/design/item/weapon/blaster/carbine
	id = "blastercarbine"
	req_tech = list(TECH_COMBAT = 4, TECH_MAGNET = 3, TECH_POWER = 3, TECH_BLUESPACE = 3)
	materials = list(DEFAULT_WALL_MATERIAL = 6000, "glass" = 1000, "uranium" = 500, "gold" = 1000, "diamond" = 500)
	build_path = /obj/item/weapon/gun/energy/excursion/carbine
	sort_string = "MACAB"
	
/datum/design/item/weapon/blaster/rifle
	id = "blasterrifle"
	req_tech = list(TECH_COMBAT = 4, TECH_MAGNET = 3, TECH_POWER = 3, TECH_BLUESPACE = 3)
	materials = list(DEFAULT_WALL_MATERIAL = 8000, "glass" = 1000, "uranium" = 500, "gold" = 1500, "diamond" = 750)
	build_path = /obj/item/weapon/gun/energy/excursion/rifle
	sort_string = "MACAC"
	
/datum/design/item/weapon/blaster/dmr
	id = "blasterdmr"
	req_tech = list(TECH_COMBAT = 4, TECH_MAGNET = 4, TECH_POWER = 4, TECH_BLUESPACE = 3)
	materials = list(DEFAULT_WALL_MATERIAL = 10000, "glass" = 2000, "uranium" = 1500, "gold" = 2500, "diamond" = 1000)
	build_path = /obj/item/weapon/gun/energy/excursion/dmr
	sort_string = "MACAD"