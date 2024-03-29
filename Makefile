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
	$(CXX) -std=c++11 -fPIC -shared -lsfml-graphics -lsfml-window -lsfml-system $(opengl) -o $@ $(obj_files)

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
	curl -s -L https://github.com/oprypin/cimgui/archive/2e79a491949e1089be270aac25dd39a3328562e9.tar.gz | tar -xz --strip-components=1 -C cimgui

.INTERMEDIATE: imgui_src
$(imgui_src): imgui_src ;
imgui_src: cimgui_src
	curl -s -L https://github.com/ocornut/imgui/archive/fef33891579dda780028a10401e851ddb828e983.tar.gz | tar -xz --strip-components=1 -C cimgui/imgui

.PHONY: clean
clean:
	rm -f $(obj_files)
