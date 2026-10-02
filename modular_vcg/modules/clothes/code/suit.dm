/obj/item/clothing/suit/vampire/toggled
	var/toggle_noun = "zip"

/obj/item/clothing/suit/vampire/toggled/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/toggle_icon, toggle_noun)

/obj/item/clothing/suit/vampire/toggled/bomber_jacket
	name = "bomber jacket"
	desc = "A bomber jacket."
	icon = 'modular_vcg/modules/clothes/icons/clothing.dmi'
	worn_icon = 'modular_vcg/modules/clothes/icons/worn.dmi'
	icon_state = "fur1"
	ONFLOOR_ICON_HELPER('modular_vcg/modules/clothes/icons/clothing_onfloor.dmi')

/obj/item/clothing/suit/vampire/toggled/bomber_jacket/inverted
	name = "bomber jacket"
	desc = "A fancy bomber jacket."
	icon_state = "fur2"

/obj/item/clothing/suit/vampire/toggled/plain_jacket
	name = "plain brown jacket"
	desc = "A plain brown jacket."
	icon = 'modular_vcg/modules/clothes/icons/clothing.dmi'
	worn_icon = 'modular_vcg/modules/clothes/icons/worn.dmi'
	icon_state = "plain1"
	ONFLOOR_ICON_HELPER('modular_vcg/modules/clothes/icons/clothing_onfloor.dmi')

/obj/item/clothing/suit/vampire/toggled/plain_jacket/black
	name = "plain black jacket"
	desc = "A plain black jacket."
	icon_state = "plain2"

/obj/item/clothing/suit/vampire/toggled/military_jacket
	name = "military jacket"
	desc = "A military jacket."
	icon = 'modular_vcg/modules/clothes/icons/clothing.dmi'
	worn_icon = 'modular_vcg/modules/clothes/icons/worn.dmi'
	icon_state = "m65"
	ONFLOOR_ICON_HELPER('modular_vcg/modules/clothes/icons/clothing_onfloor.dmi')

/obj/item/clothing/suit/vampire/racing_jacket
	name = "Black and Yellow racing jacket"
	desc = "A black and yellow japanese racing jacket."
	icon = 'modular_vcg/modules/clothes/icons/clothing.dmi'
	worn_icon = 'modular_vcg/modules/clothes/icons/worn.dmi'
	icon_state = "blackyellow_racejacket"
	ONFLOOR_ICON_HELPER('modular_vcg/modules/clothes/icons/clothing_onfloor.dmi')
	armor_type = /datum/armor/racing_jacket

/datum/armor/racing_jacket
	melee = 30
	bullet = 25
	laser = 5
	energy = 5
	bomb = 35
	fire = 35
	acid = 10
	wound = 35

/obj/item/clothing/suit/vampire/racing_jacket/blackblue
	name = "Black and Blue racing jacket"
	desc = "A black and blue japanese racing jacket."
	icon_state = "blackblue_racejacket"

/obj/item/clothing/suit/vampire/racing_jacket/whitered
	name = "White and Red racing jacket"
	desc = "A white and red japanese racing jacket."
	icon_state = "whitered_racejacket"

/obj/item/clothing/suit/vampire/racing_jacket/whiteyellow
	name = "White and Yellow racing jacket"
	desc = "A white and yellow japanese racing jacket."
	icon_state = "whiteyellow_racejacket"

/obj/item/clothing/suit/vampire/racing_jacket/bluewhite
	name = "Blue and White racing jacket"
	desc = "A blue and white japanese racing jacket."
	icon_state = "bluewhite_racejacket"

/obj/item/clothing/suit/vampire/racing_jacket/redwhite
	name = "Red and White racing jacket"
	desc = "A red and white japanese racing jacket."
	icon_state = "redwhite_racejacket"

/obj/item/clothing/suit/hooded/flight_suit
	name = "flight suit"
	desc = "This hulking armor seems to possess some kind of dark force within; howling in rage, hungry for carnage. \
		The self-sealing stem bolts that allowed this suit to be spaceworthy have long since corroded. However, the entity \
		sealed within the suit seems to hunger for the fleeting lifeforce found in the remains left in the remains of drakes. \
		Feeding it drake remains seems to empower a suit piece, though turns the remains back to lifeless ash."
	icon_state = "berserker"
	icon = 'icons/obj/clothing/suits/armor.dmi'
	worn_icon = 'icons/mob/clothing/suits/armor.dmi'
	hoodtype = /obj/item/clothing/head/hooded/flight_suit
	armor_type = /datum/armor/flight_suit
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT
	resistance_flags = FIRE_PROOF | ACID_PROOF
	clothing_flags = THICKMATERIAL|HEADINTERNALS

/obj/item/clothing/suit/hooded/flight_suit/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/item_equipped_movement_rustle, SFX_PLATE_ARMOR_RUSTLE, 8)

/datum/armor/flight_suit
	melee = 30
	bullet = 30
	laser = 10
	energy = 20
	bomb = 50
	bio = 60
	fire = 100
	acid = 100
	wound = 10

///When EMPed, how long the suit will be disabled for.
#define EMP_TIMEOUT_DURATION (2 MINUTES)
///When hit by the rain, how long the suit will be disabled for.
#define RAIN_TIMEOUT_DURATION (5 MINUTES)

/obj/item/clothing/head/hooded/flight_suit
	name = "flight suit helmet"
	desc = "This burdensome helmet seems to possess some kind of dark force within; howling in rage, hungry for carnage. \
		The self-sealing stem bolts that allowed this helmet to be spaceworthy have long since corroded. However, the entity \
		sealed within the suit seems to hunger for the fleeting lifeforce found in the remains left in the remains of drakes. \
		Feeding it drake remains seems to empower a suit piece, though turns the remains back to lifeless ash."
	icon_state = "berserker"
	icon = 'icons/obj/clothing/head/helmet.dmi'
	worn_icon = 'icons/mob/clothing/head/helmet.dmi'
	armor_type = /datum/armor/flight_suit
	actions_types = list(/datum/action/item_action/toggle_flight_suit)
	cold_protection = HEAD
	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	heat_protection = HEAD
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	flags_inv = HIDEHAIR|HIDEFACE|HIDEEARS|HIDESNOUT
	resistance_flags = FIRE_PROOF | ACID_PROOF
	clothing_flags = SNUG_FIT|THICKMATERIAL

	///If we're unable to be used, this is how long we have left to wait.
	COOLDOWN_DECLARE(timeout_time)
	///Whether we're currently set to fly.
	var/active_flight = FALSE

/obj/item/clothing/head/hooded/flight_suit/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/item_equipped_movement_rustle, SFX_PLATE_ARMOR_RUSTLE, 8)

/obj/item/clothing/head/hooded/flight_suit/proc/toggle_flight(mob/living/user, forced_off = FALSE)
	active_flight = !active_flight
	if(active_flight && !forced_off)
		user.add_traits(list(TRAIT_MOVE_FLYING, TRAIT_PASSTABLE), REF(src))
	else
		user.remove_traits(list(TRAIT_MOVE_FLYING, TRAIT_PASSTABLE), REF(src))
	user.update_appearance(UPDATE_OVERLAYS)

/obj/item/clothing/head/hooded/flight_suit/equipped(mob/living/user, slot)
	. = ..()
	if(slot_flags & slot)
		if(COOLDOWN_FINISHED(src, timeout_time))
			ADD_TRAIT(user, TRAIT_MOVE_FLOATING, REF(src))
		RegisterSignal(user, COMSIG_ATOM_EXPOSE_REAGENTS, PROC_REF(on_wet))

/obj/item/clothing/head/hooded/flight_suit/dropped(mob/user)
	. = ..()
	if(active_flight)
		toggle_flight(user, forced_off = TRUE)
	REMOVE_TRAIT(user, TRAIT_MOVE_FLOATING, REF(src))
	UnregisterSignal(user, COMSIG_ATOM_EXPOSE_REAGENTS)

/obj/item/clothing/head/hooded/flight_suit/ui_action_click(mob/user, actiontype)
	if(!COOLDOWN_FINISHED(src, timeout_time))
		to_chat(user, span_warning("Your suit is deactivated."))
		return FALSE
	toggle_flight(user)

/obj/item/clothing/head/hooded/flight_suit/emp_act(severity)
	. = ..()
	if(. & EMP_PROTECT_SELF)
		return
	disable_suit(EMP_TIMEOUT_DURATION)

/obj/item/clothing/head/hooded/flight_suit/proc/on_wet(atom/source, list/reagents, datum/reagents/source, methods)
	SIGNAL_HANDLER

	if(!(methods & TOUCH))
		return
	if(locate(/datum/reagent/water) in reagents)
		disable_suit(RAIN_TIMEOUT_DURATION)

/obj/item/clothing/head/hooded/flight_suit/expose_reagents(list/reagents, datum/reagents/source, methods, volume_modifier, show_message)
	. = ..()
	INVOKE_ASYNC(src, PROC_REF(on_wet), loc, reagents, source, methods)

/obj/item/clothing/head/hooded/flight_suit/proc/disable_suit(timeout_duration)
	toggle_flight(loc, forced_off = TRUE)
	REMOVE_TRAIT(loc, TRAIT_MOVE_FLOATING, REF(src))
	COOLDOWN_START(src, timeout_time, timeout_duration)

#undef EMP_TIMEOUT_DURATION
#undef RAIN_TIMEOUT_DURATION

/datum/action/item_action/toggle_flight_suit
	name = "Toggle Flight"
