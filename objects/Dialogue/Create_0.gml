/// @description Insert description here
// You can write your code in this editor


dialogue_storage = ds_map_create();

ds_map_add(dialogue_storage, "test", ds_list_create());
ds_map_add(dialogue_storage, "friend", ds_list_create());
ds_map_add(dialogue_storage, "polarbear_before", ds_list_create());
ds_map_add(dialogue_storage, "polarbear_after", ds_list_create());
ds_map_add(dialogue_storage, "polarbear_village", ds_list_create());
ds_map_add(dialogue_storage, "FishingSignPost", ds_list_create());
ds_map_add(dialogue_storage, "FishingHoleNoBait", ds_list_create());
ds_map_add(dialogue_storage, "VillageVacancy", ds_list_create());
ds_map_add(dialogue_storage, "VillageSign", ds_list_create());


function add_dialogue(character_key, _s) {
	var found = ds_map_find_value(dialogue_storage, character_key);
	if (is_undefined(found)) {
		show_debug_message("invalid character key");
	} else {
		ds_list_add(found, _s);
	}
}


add_dialogue("test", "I am a test");
add_dialogue("friend", "I am a friend");
add_dialogue("friend", "You can press a to talk to people... but you already knew that!");
add_dialogue("polarbear_before", "*grumble grumble* I need to hibernate for the winter! But I'm all out of fish...");
add_dialogue("polarbear_before", "Will you capture some fish for me? You will need to find some bait.");
add_dialogue("polarbear_before", "I need 5 fish.");
add_dialogue("polarbear_after", "Thanks for feeding me! I will join you in the village after this nap.");
add_dialogue("polarbear_after", "zzzzzzzz....");
add_dialogue("polarbear_village", "zzzzzzzz.... I... Can't... Wait... zzzzz Aurora.... Festival.... zzzzzz");
add_dialogue("FishingSignPost", "Continue Right for the Fishing Hole");
add_dialogue("FishingSignPost", "But consider climbing up to see the fabled magical worm!");
add_dialogue("FishingHoleNoBait", "You are out of bait. Press B to return to search for more worms!");
add_dialogue("VillageVacancy", "CLOSED");
add_dialogue("VillageSign", "Open!");

dialogue_queue = ds_queue_create();

margin = 50;
text_margin = 20;
height = 300;

function queue_dialogue(character_key) {
	var found = ds_map_find_value(dialogue_storage, character_key);
	if (is_undefined(found)) {
		show_debug_message("invalid character key");
	} else {
		// found is the list of dialogue, queue every message
		for (var i = 0; i < ds_list_size(found); i++) {
			ds_queue_enqueue(dialogue_queue, found[|i]);
		}
	}
}