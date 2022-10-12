#!/bin/bash

# Don't forget to install GLFW dependencies : https://www.glfw.org/docs/3.3/compile.html

wget https://github.com/glfw/glfw/releases/download/3.3.8/glfw-3.3.8.zip && mv glfw-3.3.8.zip glfw.zip
unzip glfw.zip
mv glfw-3.3.8 glfw
cmake -S glfw -B glfw/build
cmake --build glfw/build
mkdir -pv lib/libglfw3
mv glfw/include/* include/
mv glfw/build/src/libglfw3.a lib/libglfw3/