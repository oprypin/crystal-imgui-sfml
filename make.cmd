cl /c -Iimgui-sfml -Icimgui\imgui -DIMGUI_USER_CONFIG="<imconfig-SFML.h>" /Foimgui.obj cimgui/imgui/imgui.cpp
cl /c -Iimgui-sfml -Icimgui\imgui -DIMGUI_USER_CONFIG="<imconfig-SFML.h>" /Foimgui_draw.obj cimgui/imgui/imgui_draw.cpp
cl /c -Iimgui-sfml -Icimgui\imgui -DIMGUI_USER_CONFIG="<imconfig-SFML.h>" /Foimgui_widgets.obj cimgui/imgui/imgui_widgets.cpp
cl /c -Iimgui-sfml -Icimgui\imgui -DIMGUI_USER_CONFIG="<imconfig-SFML.h>" /Foimgui_demo.obj cimgui/imgui/imgui_demo.cpp
cl /c -Iimgui-sfml -Icimgui\imgui -DIMGUI_USER_CONFIG="<imconfig-SFML.h>" /Focimgui.obj cimgui/cimgui.cpp
cl /c -Iimgui-sfml -Icimgui\imgui -DIMGUI_USER_CONFIG="<imconfig-SFML.h>" /Foimgui-sfml.obj imgui-sfml/imgui-SFML.cpp
cl /c -Iimgui-sfml -Icimgui\imgui -DIMGUI_USER_CONFIG="<imconfig-SFML.h>" /Fobinding.obj src/binding.cpp
lib /out:cimgui.lib *.obj sfml-graphics.lib sfml-window.lib sfml-system.lib OpenGL32.lib
