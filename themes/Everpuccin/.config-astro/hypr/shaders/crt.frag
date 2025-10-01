precision highp float;
varying vec2 v_texcoord;
uniform sampler2D tex;

void main() {
	vec2 tc = vec2(v_texcoord.x, v_texcoord.y);
	
	// Distance from center for various effects
	float dx = abs(0.5-tc.x);
	float dy = abs(0.5-tc.y);
	float dist_from_center = distance(tc, vec2(0.5, 0.5));
	
	// Enhanced barrel distortion
	dx *= dx;
	dy *= dy;
	tc.x -= 0.5;
	tc.x *= 1.0 + (dy * 0.05);
	tc.x += 0.5;
	tc.y -= 0.5;
	tc.y *= 1.0 + (dx * 0.05);
	tc.y += 0.5;
	
	// CRT-Guest-Advanced style blur and blending for low-res feel
	vec2 texel_size = vec2(1.0/1920.0, 1.0/1080.0);
	
	// Multi-directional chromatic aberration - subtle but in all directions
	float aberration_strength = 0.0005 + dist_from_center * 0.0008;
	vec2 red_offset = vec2(aberration_strength * cos(0.0), aberration_strength * sin(0.0));
	vec2 green_offset = vec2(aberration_strength * cos(2.094), aberration_strength * sin(2.094));
	vec2 blue_offset = vec2(aberration_strength * cos(4.188), aberration_strength * sin(4.188));
	
	// Sample with chromatic aberration
	float r = texture2D(tex, tc + red_offset).r;
	float g = texture2D(tex, tc + green_offset).g;
	float b = texture2D(tex, tc + blue_offset).b;
	vec4 cta = vec4(r, g, b, 1.0);
	
	// CRT-style horizontal blur for that soft low-res blending effect
	vec4 blur_h = texture2D(tex, tc);
	blur_h += texture2D(tex, tc + vec2(texel_size.x, 0.0)) * 0.8;
	blur_h += texture2D(tex, tc - vec2(texel_size.x, 0.0)) * 0.8;
	blur_h += texture2D(tex, tc + vec2(texel_size.x * 2.0, 0.0)) * 0.4;
	blur_h += texture2D(tex, tc - vec2(texel_size.x * 2.0, 0.0)) * 0.4;
	blur_h /= 4.0;
	
	// Vertical blur (less aggressive)
	vec4 blur_v = blur_h;
	blur_v += texture2D(tex, tc + vec2(0.0, texel_size.y)) * 0.6;
	blur_v += texture2D(tex, tc - vec2(0.0, texel_size.y)) * 0.6;
	blur_v /= 2.2;
	
	// Mix original with blurred for that CRT soft pixel combining
	cta.rgb = mix(cta.rgb, blur_v.rgb, 0.4);
	
	// Phosphor orange tint (more subtle)
	vec3 phosphor_tint = vec3(1.03, 1.0, 0.95);
	cta.rgb *= phosphor_tint;
	
	// Realistic scanlines - soft gradients, not harsh lines
	float scanline_pos = tc.y * 600.0; // Higher resolution scanlines
	float scanline = abs(sin(scanline_pos * 3.14159));
	scanline = pow(scanline, 0.8); // Softer falloff
	scanline = mix(0.85, 1.0, scanline); // Much more subtle intensity
	cta.rgb *= scanline;
	
	// Phosphor RGB pattern (very subtle)
	vec2 phosphor_pos = tc * vec2(1920.0, 1080.0);
	float phosphor_r = sin(phosphor_pos.x * 6.283 * 3.0) * 0.015;
	float phosphor_g = sin(phosphor_pos.x * 6.283 * 3.0 + 2.094) * 0.015;
	float phosphor_b = sin(phosphor_pos.x * 6.283 * 3.0 + 4.188) * 0.015;
	cta.r += phosphor_r;
	cta.g += phosphor_g;
	cta.b += phosphor_b;
	
	// Center-focused bloom like in reference image
	float luminance = dot(cta.rgb, vec3(0.299, 0.587, 0.114));
	float bloom_strength = luminance * luminance; // Brighter areas bloom more
	
	// Multiple bloom passes with different radii for realistic falloff
	vec4 bloom1 = texture2D(tex, tc + vec2(texel_size.x * 2.0, 0.0));
	bloom1 += texture2D(tex, tc - vec2(texel_size.x * 2.0, 0.0));
	bloom1 += texture2D(tex, tc + vec2(0.0, texel_size.y * 2.0));
	bloom1 += texture2D(tex, tc - vec2(0.0, texel_size.y * 2.0));
	bloom1 /= 4.0;
	
	vec4 bloom2 = texture2D(tex, tc + vec2(texel_size.x * 4.0, 0.0));
	bloom2 += texture2D(tex, tc - vec2(texel_size.x * 4.0, 0.0));
	bloom2 += texture2D(tex, tc + vec2(0.0, texel_size.y * 4.0));
	bloom2 += texture2D(tex, tc - vec2(0.0, texel_size.y * 4.0));
	bloom2 /= 4.0;
	
	vec4 bloom3 = texture2D(tex, tc + vec2(texel_size.x * 8.0, 0.0));
	bloom3 += texture2D(tex, tc - vec2(texel_size.x * 8.0, 0.0));
	bloom3 += texture2D(tex, tc + vec2(0.0, texel_size.y * 8.0));
	bloom3 += texture2D(tex, tc - vec2(0.0, texel_size.y * 8.0));
	bloom3 /= 4.0;
	
	// Apply bloom with proper falloff - stronger in center, weaker at edges
	float bloom_falloff = 1.0 - dist_from_center * 1.2;
	bloom_falloff = clamp(bloom_falloff, 0.2, 1.0);
	
	cta.rgb += bloom1.rgb * bloom_strength * 0.15 * bloom_falloff;
	cta.rgb += bloom2.rgb * bloom_strength * 0.08 * bloom_falloff;
	cta.rgb += bloom3.rgb * bloom_strength * 0.04 * bloom_falloff;
	
	// Phosphor glow based on content brightness
	float phosphor_glow = 1.0 + luminance * 0.3;
	cta.rgb *= phosphor_glow;
	
	// Realistic vignette - not too harsh
	float vignette = 1.0 - (dx + dy) * 1.0;
	vignette = clamp(vignette, 0.4, 1.0);
	vignette = smoothstep(0.4, 0.7, vignette); // Smoother transition
	cta.rgb *= vignette;
	
	// Subtle glare effect for bright areas
	if (luminance > 0.7) {
		float glare = (luminance - 0.7) * 2.0;
		cta.rgb += glare * 0.1;
	}
	
	// Low-res dithering to enhance the retro feel
	float dither = fract(sin(dot(tc.xy * 100.0, vec2(12.9898, 78.233))) * 43758.5453) * 0.03;
	cta.rgb += dither;
	
	// Final contrast and saturation adjustment
	cta.rgb = (cta.rgb - 0.5) * 1.2 + 0.5;
	
	// Brightness boost for that CRT punch
	cta.rgb *= 1.1;
	
	// Edge cutoff
	if(tc.y > 1.0 || tc.x < 0.0 || tc.x > 1.0 || tc.y < 0.0)
		cta = vec4(0.0);
	
	gl_FragColor = cta;
}
