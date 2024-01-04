/// @description Insert description here
// You can write your code in this editor


dialogue_storage = ds_map_create();

ds_map_add(dialogue_storage, "test", ds_list_create());
ds_map_add(dialogue_storage, "friend", ds_list_create());
ds_map_add(dialogue_storage, "polarbear_before", ds_list_create());
ds_map_add(dialogue_storage, "polarbear_after", ds_list_create());


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
add_dialogue("polarbear_before", "Hi, I'm a polar bear");
add_dialogue("polarbear_after", "Thanks for feeding me");


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