shader_type canvas_item;

uniform sampler2D clean_texture;
uniform sampler2D dirty_texture;
uniform sampler2D dirt_mask;

uniform float dirt_strength : hint_range(0.0, 1.0) = 1.0;

void fragment() {
    vec4 clean_color = texture(clean_texture, UV);
    vec4 dirty_color = texture(dirty_texture, UV);
    float mask_value = texture(dirt_mask, UV).r;

    float adjusted_mask = mask_value * dirt_strength;
    float blend_factor = adjusted_mask * dirty_color.a;

    vec4 final_color = mix(clean_color, dirty_color, blend_factor);

    COLOR = final_color;
}
