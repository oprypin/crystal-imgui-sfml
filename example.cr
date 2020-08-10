require "crsfml"
require "crimgui/lib"
require "./src/imgui-sfml"

window = SF::RenderWindow.new(SF::VideoMode.new(1280, 720), "ImGui + SFML = <3")
window.framerate_limit = 60
ImGui::SFML.init(window)

shape = SF::CircleShape.new(100)
shape.fill_color = SF::Color::Green

delta_clock = SF::Clock.new
while window.open?
  while (event = window.poll_event)
    ImGui::SFML.process_event(event)

    if event.is_a? SF::Event::Closed
      window.close
    end
  end

  ImGui::SFML.update(window, delta_clock.restart)

  LibImGui.ig_show_demo_window(nil)

  LibImGui.ig_begin("Hello, world!", nil, LibImGui::ImGuiWindowFlags::None)
  LibImGui.ig_button("Look at this pretty button", ImVec2.new(0, 0))
  LibImGui.ig_end

  window.clear
  window.draw(shape)
  ImGui::SFML.render
  window.display
end

ImGui::SFML.shutdown
