require "crsfml"
require "imgui"
require "./src/imgui-sfml"

window = SF::RenderWindow.new(SF::VideoMode.new(1280, 720), "ImGui + SFML = <3")
window.framerate_limit = 60
ImGui::SFML.init(window)

shape = SF::CircleShape.new(100)
shape.fill_color = SF::Color::Green

buf = ImGui::TextBuffer.new(100)
f = 0.6f32

delta_clock = SF::Clock.new
while window.open?
  while (event = window.poll_event)
    ImGui::SFML.process_event(event)

    if event.is_a? SF::Event::Closed
      window.close
    end
  end

  ImGui::SFML.update(window, delta_clock.restart)

  ImGui.show_demo_window

  ImGui.begin("Hello, world!")
  if ImGui.button("Save")
    p! buf.to_s, f # Executed when the button gets clicked
  end
  ImGui.input_text("string", buf)
  ImGui.slider_float("float", pointerof(f), 0.0, 1.0)
  ImGui.end

  window.clear
  window.draw(shape)
  ImGui::SFML.render(window)
  window.display
end

ImGui::SFML.shutdown
