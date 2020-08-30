cl /c -Iimgui-sfml -Icimgui\imgui -DIMGUI_USER_CONFIG="<imconfig-SFML.h>" -DIMGUI_USE_WCHAR32 /Foimgui.obj cimgui/imgui/imgui.cpp
cl /c -Iimgui-sfml -Icimgui\imgui -DIMGUI_USER_CONFIG="<imconfig-SFML.h>" -DIMGUI_USE_WCHAR32 /Foimgui_draw.obj cimgui/imgui/imgui_draw.cpp
cl /c -Iimgui-sfml -Icimgui\imgui -DIMGUI_USER_CONFIG="<imconfig-SFML.h>" -DIMGUI_USE_WCHAR32 /Foimgui_widgets.obj cimgui/imgui/imgui_widgets.cpp
cl /c -Iimgui-sfml -Icimgui\imgui -DIMGUI_USER_CONFIG="<imconfig-SFML.h>" -DIMGUI_USE_WCHAR32 /Foimgui_demo.obj cimgui/imgui/imgui_demo.cpp
cl /c -Iimgui-sfml -Icimgui\imgui -DIMGUI_USER_CONFIG="<imconfig-SFML.h>" -DIMGUI_USE_WCHAR32 /Focimgui.obj cimgui/cimgui.cpp
cl /c -Iimgui-sfml -Icimgui\imgui -DIMGUI_USER_CONFIG="<imconfig-SFML.h>" -DIMGUI_USE_WCHAR32 /Foimgui-sfml.obj imgui-sfml/imgui-SFML.cpp
cl /c -Iimgui-sfml -Icimgui\imgui -DIMGUI_USER_CONFIG="<imconfig-SFML.h>" -DIMGUI_USE_WCHAR32 /Fobinding.obj src/binding.cpp
lib /out:cimgui.lib *.obj sfml-graphics.lib sfml-window.lib sfml-system.lib OpenGL32.lib
