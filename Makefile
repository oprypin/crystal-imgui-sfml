obj_files := imgui.o imgui_draw.o imgui_widgets.o imgui_tables.o imgui_demo.o cimgui.o imgui-sfml.o binding.o
config_src := crystal-imgui-sfml.h imgui-sfml/imconfig-SFML.h imgui-sfml/imgui-SFML_export.h
imgui_sfml_src := imgui-sfml/imgui-SFML.cpp imgui-sfml/imgui-SFML.h imgui-sfml/imgui-SFML_export.h imgui-sfml/imconfig-SFML.h
cimgui_src := cimgui/cimgui.cpp cimgui/cimgui.h
imgui_src := cimgui/imgui/imgui.h cimgui/imgui/imgui.cpp cimgui/imgui/imgui_draw.cpp cimgui/imgui/imgui_widgets.cpp cimgui/imgui/imgui_tables.cpp cimgui/imgui/imgui_demo.cpp

ifeq ($(shell uname -s),Darwin)
	opengl := -framework OpenGL
else
	opengl := -lGL
endif

libcimgui.so: $(obj_files)
	$(CXX) -std=c++11 -fPIC -shared -o $@ $(obj_files) -lsfml-graphics -lsfml-window -lsfml-system $(opengl)

config_flags := -std=c++11 -fPIC -I. -Iimgui-sfml -Icimgui/imgui -DIMGUI_USER_CONFIG='<crystal-imgui-sfml.h>'

%.o: cimgui/imgui/%.cpp cimgui/imgui/imgui.h $(config_src)
	$(CXX) $(config_flags) $(CXXFLAGS) -o $@ -c $<

cimgui.o: $(cimgui_src) cimgui/imgui/imgui.h $(config_src)
	$(CXX) $(config_flags) $(CXXFLAGS) -o $@ -c $<

imgui-sfml.o: $(imgui_sfml_src) cimgui/imgui/imgui.h $(config_src)
	$(CXX) $(config_flags) $(CXXFLAGS) -o $@ -c $<

binding.o: src/binding.cpp cimgui/imgui/imgui.h $(config_src)
	$(CXX) $(config_flags) $(CXXFLAGS) -o $@ -c $<

.PRECIOUS: $(imgui_sfml_src) $(cimgui_src) $(imgui_src)

.INTERMEDIATE: imgui_sfml_src
$(imgui_sfml_src): imgui_sfml_src ;
imgui_sfml_src:
	curl -s -L https://github.com/eliasdaler/imgui-sfml/archive/f0d8f72f073b367e9506b8794158cc91f015252e.tar.gz | tar -xz --strip-components=1 -C imgui-sfml

.INTERMEDIATE: cimgui_src
$(cimgui_src): cimgui_src ;
cimgui_src:
	curl -s -L https://github.com/cimgui/cimgui/archive/481cd32543f002888d5817b78a85c05f21de1efb.tar.gz | tar -xz --strip-components=1 -C cimgui

.INTERMEDIATE: imgui_src
$(imgui_src): imgui_src ;
imgui_src: cimgui_src
	curl -s -L https://github.com/ocornut/imgui/archive/6ccc561a2ab497ad4ae6ee1dbd3b992ffada35cb.tar.gz | tar -xz --strip-components=1 -C cimgui/imgui

.PHONY: clean
clean:
	rm -f $(obj_files)
