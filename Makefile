obj_files := imgui.o imgui_draw.o imgui_widgets.o imgui_demo.o cimgui.o imgui-sfml.o binding.o
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

imgui_flags := -fPIC -Iimgui-sfml -Icimgui/imgui -DIMGUI_USER_CONFIG='<imconfig-SFML.h>' -DIMGUI_USE_WCHAR32

%.o: cimgui/imgui/%.cpp cimgui/imgui/imgui.h
	$(CXX) $(imgui_flags) $(CXXFLAGS) -o $@ -c $<

cimgui.o: $(cimgui_src) cimgui/imgui/imgui.h
	$(CXX) $(imgui_flags) $(CXXFLAGS) -o $@ -c $<

imgui-sfml.o: $(imgui_sfml_src) cimgui/imgui/imgui.h
	$(CXX) $(imgui_flags) $(CXXFLAGS) -o $@ -c $<

binding.o: src/binding.cpp imgui-sfml/imgui-SFML.h cimgui/imgui/imgui.h
	$(CXX) $(imgui_flags) $(CXXFLAGS) -o $@ -c $<

.PRECIOUS: $(imgui_sfml_src) $(cimgui_src) $(imgui_src)

.INTERMEDIATE: imgui_sfml_src
$(imgui_sfml_src): imgui_sfml_src ;
imgui_sfml_src:
	git submodule update --init imgui-sfml

.INTERMEDIATE: cimgui_src
$(cimgui_src): cimgui_src ;
cimgui_src:
	git submodule update --init cimgui

.INTERMEDIATE: imgui_src
$(imgui_src): imgui_src ;
imgui_src: cimgui_src
	cd cimgui && git submodule update --init imgui

.PHONY: clean
clean:
	rm -f $(obj_files)
