obj_files := imgui.o imgui_draw.o imgui_widgets.o imgui_demo.o cimgui.o imgui-sfml.o binding.o
config_src := crystal-imgui-sfml.h imgui-sfml/imconfig-SFML.h imgui-sfml/imgui-SFML_export.h
imgui_sfml_src := imgui-sfml/imgui-SFML.cpp imgui-sfml/imgui-SFML.h imgui-sfml/imgui-SFML_export.h imgui-sfml/imconfig-SFML.h
cimgui_src := cimgui/cimgui.cpp cimgui/cimgui.h
imgui_src := cimgui/imgui/imgui.h cimgui/imgui/imgui.cpp cimgui/imgui/imgui_draw.cpp cimgui/imgui/imgui_widgets.cpp cimgui/imgui/imgui_demo.cpp

ifeq ($(shell uname -s),Darwin)
	opengl := -framework OpenGL
else
	opengl := -lGL
endif

libcimgui.so: $(obj_files)
	$(CXX) -fPIC -shared -lsfml-graphics -lsfml-window -lsfml-system $(opengl) -o $@ $(obj_files)

config_flags := -fPIC -I. -Iimgui-sfml -Icimgui/imgui -DIMGUI_USER_CONFIG='<crystal-imgui-sfml.h>'

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
	curl -s -L https://github.com/eliasdaler/imgui-sfml/archive/a924119022cb766763821ed9a2313fcbffae1ea2.tar.gz | tar -xz --strip-components=1 -C imgui-sfml

.INTERMEDIATE: cimgui_src
$(cimgui_src): cimgui_src ;
cimgui_src:
	curl -s -L https://github.com/cimgui/cimgui/archive/2d8b3fb731cfa19d506ae7ac591229e8473af3eb.tar.gz | tar -xz --strip-components=1 -C cimgui

.INTERMEDIATE: imgui_src
$(imgui_src): imgui_src ;
imgui_src: cimgui_src
	curl -s -L https://github.com/ocornut/imgui/archive/95c99aaa4be611716093edcb6b01146ab9483f30.tar.gz | tar -xz --strip-components=1 -C cimgui/imgui

.PHONY: clean
clean:
	rm -f $(obj_files)
