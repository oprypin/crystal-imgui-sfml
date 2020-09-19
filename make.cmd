cl /c -I. -Iimgui-sfml -Icimgui\imgui -DIMGUI_USER_CONFIG="<crystal-imgui-sfml.h>" /Foimgui.obj cimgui/imgui/imgui.cpp
cl /c -I. -Iimgui-sfml -Icimgui\imgui -DIMGUI_USER_CONFIG="<crystal-imgui-sfml.h>" /Foimgui_draw.obj cimgui/imgui/imgui_draw.cpp
cl /c -I. -Iimgui-sfml -Icimgui\imgui -DIMGUI_USER_CONFIG="<crystal-imgui-sfml.h>" /Foimgui_widgets.obj cimgui/imgui/imgui_widgets.cpp
cl /c -I. -Iimgui-sfml -Icimgui\imgui -DIMGUI_USER_CONFIG="<crystal-imgui-sfml.h>" /Foimgui_demo.obj cimgui/imgui/imgui_demo.cpp
cl /c -I. -Iimgui-sfml -Icimgui\imgui -DIMGUI_USER_CONFIG="<crystal-imgui-sfml.h>" /Focimgui.obj cimgui/cimgui.cpp
cl /c -I. -Iimgui-sfml -Icimgui\imgui -DIMGUI_USER_CONFIG="<crystal-imgui-sfml.h>" /Foimgui-sfml.obj imgui-sfml/imgui-SFML.cpp
cl /c -I. -Iimgui-sfml -Icimgui\imgui -DIMGUI_USER_CONFIG="<crystal-imgui-sfml.h>" /Fobinding.obj src/binding.cpp
lib /out:cimgui.lib *.obj sfml-graphics.lib sfml-window.lib sfml-system.lib OpenGL32.lib
