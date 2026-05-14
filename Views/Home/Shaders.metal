//
//  Shaders.metal
//  PomodoroCat
//
//  Created by Syazlina Aasim on 13/05/2026.
//

#include <metal_stdlib>
#include <SwiftUI/SwiftUI_Metal.h>
using namespace metal;

[[ stitchable ]]
half4 pixelate(float2 position, SwiftUI::Layer layer, float pixelSize) {
    float2 pixelPosition = floor(position / pixelSize) * pixelSize;
    return layer.sample(pixelPosition);
}
