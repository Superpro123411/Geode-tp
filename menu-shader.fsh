uniform vec2 center; 
uniform vec2 resolution;
uniform float time;
uniform vec2 mouse; 
uniform float pulse1;
uniform float pulse2;
uniform float pulse3; 



const int waveCount = 5; 
vec3 waveColour[waveCount];
float waveOffset[waveCount];
float sineWave[waveCount * 5];

void main(){
    
    waveColour[0] = vec3(0.961, 0.682, 0.490); 
    waveColour[1] = vec3(0.925, 0.537, 0.486); 
    waveColour[2] = vec3(0.835, 0.412, 0.522); 
    waveColour[3] = vec3(0.678, 0.329, 0.573); 
    waveColour[4] = vec3(0.443, 0.290, 0.604); 
    
    
    waveOffset[0] = 0.8; 
    waveOffset[1] = 0.64; 
    waveOffset[2] = 0.48; 
    waveOffset[3] = 0.32; 
    waveOffset[4] = 0.16; 
    
    
    float waveAmplitude = 0.05; 
    float waveLength = -10.0; 
    float waveSlowdown = 3.0; 
    float transitionSmoothness = 0.002; 

    
    vec2 uv = gl_FragCoord.xy / resolution.xy;
    
    
    vec3 finalColour = vec3(0.956, 0.831, 0.557);
    
    
    for (float i = 0.0; i < float(waveCount); i++) {
        
        
        
        sineWave[0] = waveAmplitude * 1.0 * sin (waveLength * 1.0 * uv.x + (time / waveSlowdown));
        sineWave[1] = waveAmplitude * 2.1 * sin (waveLength * 1.21 * uv.x + (time / waveSlowdown));
        sineWave[2] = waveAmplitude * 1.2 * sin (waveLength * 1.337 * uv.x + (time / waveSlowdown));
        sineWave[3] = waveAmplitude * 1.3 * sin (waveLength * 1.69 * uv.x + (time / waveSlowdown));
        sineWave[4] = waveAmplitude * 1.9 * sin (waveLength * 0.6 * uv.x + (time / waveSlowdown));
        
        sineWave[5] = waveAmplitude * 2.2 * sin (waveLength * 1.2 * uv.x + (time / waveSlowdown / 2.0));
        sineWave[6] = waveAmplitude * 1.2 * sin (waveLength * 3.2 * uv.x + (time / waveSlowdown / 2.0));
        sineWave[7] = waveAmplitude * 2.1 * sin (waveLength * 0.75 * uv.x + (time / waveSlowdown / 2.0));
        sineWave[8] = waveAmplitude * 1.23 * sin (waveLength * 1.43 * uv.x + (time / waveSlowdown / 2.0));
        sineWave[9] = waveAmplitude * 0.22 * sin (waveLength * 0.56 * uv.x + (time / waveSlowdown / 2.0));
        
        sineWave[10] = waveAmplitude * 1.3 * cos (waveLength * 1.2 * uv.x + (time / waveSlowdown / 1.5));
        sineWave[11] = waveAmplitude * 1.7 * cos (waveLength * 2.5 * uv.x + (time / waveSlowdown / 1.5));
        sineWave[12] = waveAmplitude * 1.1 * cos (waveLength * 1.1 * uv.x + (time / waveSlowdown / 1.5));
        sineWave[13] = waveAmplitude * 1.43 * cos (waveLength * 1.6 * uv.x + (time / waveSlowdown / 1.5));
        sineWave[14] = waveAmplitude * 2.3 * cos (waveLength * 0.2 * uv.x + (time / waveSlowdown / 1.5));
        
        sineWave[15] = waveAmplitude * 1.6 * cos (waveLength * 2.54 * uv.x + (time / waveSlowdown / 3.0));
        sineWave[16] = waveAmplitude * 1.31 * cos (waveLength * 1.02 * uv.x + (time / waveSlowdown / 3.0));
        sineWave[17] = waveAmplitude * 2.02 * cos (waveLength * 0.92 * uv.x + (time / waveSlowdown / 3.0));
        sineWave[18] = waveAmplitude * 2.65 * cos (waveLength * 0.43 * uv.x + (time / waveSlowdown / 3.0));
        sineWave[19] = waveAmplitude * 1.92 * cos (waveLength * 0.2 * uv.x + (time / waveSlowdown / 3.0));
        
        sineWave[20] = waveAmplitude * 0.8 * sin (waveLength * 1.52 * uv.x + (- time / waveSlowdown));
        sineWave[21] = waveAmplitude * 1.4 * cos (waveLength * 0.97 * uv.x + (- time / waveSlowdown));
        sineWave[22] = waveAmplitude * 1.2 * sin (waveLength * 1.23 * uv.x + (- time / waveSlowdown));
        sineWave[23] = waveAmplitude * 0.7 * cos (waveLength * 0.83 * uv.x + (- time / waveSlowdown));
        sineWave[24] = waveAmplitude * 1.0 * sin (waveLength * 1.00 * uv.x + (- time / waveSlowdown));
        
        
        float sum = 0.0;
        for (float j = 0.0; j < float(waveCount); j++) {
            sum += sineWave[int(int(j) + int(5) * int(i))]; 
        }
        float finalWave = (sum / float(waveCount)) + waveOffset[int(i)]; 
        if (uv.y < (finalWave)) 
        {
            
            finalColour = mix(finalColour, waveColour[int(i)], smoothstep(finalWave, finalWave - transitionSmoothness, uv.y));
        }
        
    }
    
    
    gl_FragColor = vec4(finalColour, 1.0);
}