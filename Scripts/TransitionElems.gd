extends Control
class_name TransitionElems

@export var trans_mat:ShaderMaterial
@export var transition_settings:Array[TransitionSetting]
@export var animations_container:Node
var animations:Array[Node]

const TRANS_DURATION := 0.2
var current_setting:TransitionSetting
var current_anim

func _ready() -> void:
	animations = animations_container.get_children()
	for animation in animations:
		animations_container.remove_child(animation)
		
	current_anim = animations.pick_random()
	animations_container.add_child(current_anim)

func fade():
	current_setting = transition_settings.pick_random()
	trans_mat.set_shader_parameter(&"mask_texture", current_setting.trans_mask)
	
	var tween = get_tree().create_tween();
	tween.tween_method(set_shader_value, 0, current_setting.final_progress, TRANS_DURATION);
	
	animations_container.remove_child(current_anim)

func set_shader_value(value: float):
	trans_mat.set_shader_parameter(&"progress", value);
	trans_mat.set_shader_parameter(&"position", current_setting.get_pos(value));
	trans_mat.set_shader_parameter(&"grid_size", current_setting.get_grid_size(value));
	trans_mat.set_shader_parameter(&"angle", current_setting.get_angle(value));

func unfade():
	current_anim = animations.pick_random()
	animations_container.add_child(current_anim)
	
	current_setting = transition_settings.pick_random()
	trans_mat.set_shader_parameter(&"mask_texture", current_setting.trans_mask)
	
	var tween = get_tree().create_tween();
	tween.tween_method(set_shader_value, current_setting.final_progress, 0, TRANS_DURATION);
