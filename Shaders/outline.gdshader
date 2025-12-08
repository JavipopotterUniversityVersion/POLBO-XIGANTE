shader_type canvas_item;

uniform float outline_width : hint_range(0.0, 20.0) = 3.0;
uniform vec4 outline_color : source_color = vec4(1.0, 0.0, 0.0, 1.0);

void fragment() {
    vec4 base = texture(TEXTURE, UV);
    float alpha = base.a;

    vec2 texel = TEXTURE_PIXEL_SIZE * outline_width;

    float neighbor_alpha = 0.0;
    neighbor_alpha += texture(TEXTURE, UV + vec2( texel.x, 0.0)).a;
    neighbor_alpha += texture(TEXTURE, UV + vec2(-texel.x, 0.0)).a;
    neighbor_alpha += texture(TEXTURE, UV + vec2(0.0,  texel.y)).a;
    neighbor_alpha += texture(TEXTURE, UV + vec2(0.0, -texel.y)).a;
    neighbor_alpha += texture(TEXTURE, UV + vec2( texel.x,  texel.y)).a;
    neighbor_alpha += texture(TEXTURE, UV + vec2(-texel.x,  texel.y)).a;
    neighbor_alpha += texture(TEXTURE, UV + vec2( texel.x, -texel.y)).a;
    neighbor_alpha += texture(TEXTURE, UV + vec2(-texel.x, -texel.y)).a;

    float outline_alpha = clamp(neighbor_alpha, 0.0, 1.0) * (1.0 - alpha);

    vec4 outline = outline_color * outline_alpha;
    COLOR = mix(outline, base, alpha);
}
