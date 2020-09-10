# How Neumorphic in Flutter Works

## 3 components of Neumorphic

1. Color of surface
    - Color of surface should be the same as the background color (which will them be overriden by Gradient that mixes
    the background color with white and black)
2. Edge of the surface
    - Implemented using 2 Box Shadows from Decoration property, one with lights and one with shadows and position them according to your preferred source of light using Offset.
    - Essential Property of box shadow: blurRadius (double) and offset (in x and y using Offset class)
3. Gradient of the surface
    - Can be either Concave or Convex
    - Implemented using Gradient from Decoration Property to adjust the curvature by specifying colors (mixture from background color/color of the surface with white and black using color.lerp) and stop points.

## Tips:

1. Shadows is a tone darker than background (So to get shadow, mix the background color with a little bit of black using Color.lerp)
2. Lights are a tone lighter than the background (So to get lights, mix the background color with a little bit of white using Color.lerp)

## Examples:

1. You can find it in lib/main.dart.