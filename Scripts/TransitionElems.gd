extends Control
class_name TransitionElems

@export var trans_mat:ShaderMaterial
@export var transition_settings:Array[TransitionSetting]
@export var animations_container:Node
var animations:Array[Node]

@export var mais_rapido:Control

const TRANS_DURATION := 0.2
var current_setting:TransitionSetting
var current_anim

func accelerate():
	add_child(mais_rapido)
	
	current_setting = transition_settings.pick_random()
	trans_mat.set_shader_parameter(&"mask_texture", current_setting.trans_mask)
	
	var tween = get_tree().create_tween();
	tween.tween_method(set_shader_value, current_setting.final_progress, 0, TRANS_DURATION);

func _ready() -> void:
	remove_child(mais_rapido)
	animations = animations_container.get_children()
	for animation in animations:
		animations_container.remove_child(animation)
		
	current_anim = animations.pick_random()
	animations_container.add_child(current_anim)

func fade():
	current_setting = transition_settings.pick_random()
	trans_mat.set_shader_parameter(&"mask_texture", current_setting.trans_mask)
	
	var tween = get_tree().create_tween();
	await tween.tween_method(set_shader_value, 0, current_setting.final_progress, TRANS_DURATION);
	
	if current_anim:
		animations_container.remove_child(current_anim)
		current_anim = null
	else:
		remove_child(mais_rapido)

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
