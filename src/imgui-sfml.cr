require "crsfml"
require "./lib"

module ImGui
  extend self

  module SFML
    extend self

    def init(window : SF::RenderWindow, load_default_font : Bool = true)
      LibImGuiSFML.ImGui_SFML_InitW(window, load_default_font)
    end

    def init(window : SF::Window, target : SF::RenderTarget, load_default_font : Bool = true)
      case target
      when SF::RenderTexture
        LibImGuiSFML.ImGui_SFML_InitWT(window, target, load_default_font)
      when SF::RenderWindow
        LibImGuiSFML.ImGui_SFML_InitWW(window, target, load_default_font)
      end
    end

    def init(window : SF::Window, display_size : SF::Vector2f, load_default_font : Bool = true)
      LibImGuiSFML.ImGui_SFML_InitWV(window, display_size, load_default_font)
    end

    def set_current_window(window : SF::Window)
      LibImGuiSFML.ImGui_SFML_SetCurrentWindowW(window)
    end

    def process_event(window : SF::Window, event : SF::Event)
      LibImGuiSFML.ImGui_SFML_ProcessEventWE(window, event)
    end

    @[Deprecated("Use `process_event(Window, Event)` instead")]
    def process_event(event : SF::Event)
      LibImGuiSFML.ImGui_SFML_ProcessEventE(event)
    end

    def update(window : SF::RenderWindow, dt : SF::Time)
      LibImGuiSFML.ImGui_SFML_UpdateW(window, dt)
    end

    def update(window : SF::Window, target : SF::RenderTarget, dt : SF::Time)
      case target
      when SF::RenderTexture
        LibImGuiSFML.ImGui_SFML_UpdateWT(window, target, dt)
      when SF::RenderWindow
        LibImGuiSFML.ImGui_SFML_UpdateWW(window, target, dt)
      end
    end

    def update(mouse_pos : SF::Vector2i, display_size : SF::Vector2f, dt : SF::Time)
      LibImGuiSFML.ImGui_SFML_UpdateVV(mouse_pos, display_size, dt)
    end

    def render(target : SF::RenderTarget)
      case target
      when SF::RenderTexture
        LibImGuiSFML.ImGui_SFML_RenderT(target)
      when SF::RenderWindow
        LibImGuiSFML.ImGui_SFML_RenderW(target)
      end
    end

    def render
      LibImGuiSFML.ImGui_SFML_Render
    end

    def shutdown(window : SF::Window)
      LibImGuiSFML.ImGui_SFML_ShutdownW(window)
    end

    def shutdown
      LibImGuiSFML.ImGui_SFML_Shutdown
    end

    def update_font_texture
      LibImGuiSFML.ImGui_SFML_UpdateFontTexture
    end

    def get_font_texture : SF::Texture
      SF::Texture::Reference.new(SF::TextureLibImGuiSFML.ImGui_SFML_GetFontTexture)
    end

    def set_active_joystick_id(joystick_id : Int)
      LibImGuiSFML.ImGui_SFML_SetActiveJoystickId(joystick_id.to_u)
    end

    def set_joystick_dpad_threshold(threshold : Number)
      LibImGuiSFML.ImGui_SFML_SetJoytickDPadThreshold(threshold.to_f32)
    end

    def set_joystick_l_stick_threshold(threshold : Number)
      LibImGuiSFML.ImGui_SFML_SetJoytickLStickThreshold(threshold.to_f32)
    end

    def set_joystick_mapping(action : Number, joystick_button : Number)
      LibImGuiSFML.ImGui_SFML_SetJoystickMapping(action.to_i, joystick_button.to_u)
    end

    def set_dpad_x_axis(dpad_x_axis : SF::Joystick::Axis, inverted : Bool = false)
      LibImGuiSFML.ImGui_SFML_SetDPadXAxis(dpad_x_axis, inverted)
    end

    def set_dpad_y_axis(dpad_y_axis : SF::Joystick::Axis, inverted : Bool = false)
      LibImGuiSFML.ImGui_SFML_SetDPadYAxis(dpad_y_axis, inverted)
    end

    def set_l_stick_x_axis(l_stick_x_axis : SF::Joystick::Axis, inverted : Bool = false)
      LibImGuiSFML.ImGui_SFML_SetLStickXAxis(l_stick_x_axis, inverted)
    end

    def set_l_stick_x_axis(l_stick_y_axis : SF::Joystick::Axis, inverted : Bool = false)
      LibImGuiSFML.ImGui_SFML_SetLStickYAxis(l_stick_y_axis, inverted)
    end
  end

  def image(texture : SF::Texture, tint_color : SF::Color = SF::Color::White, border_color : SF::Color = SF::Color::Transparent)
    LibImGuiSFML.ImGui_ImageTCC(texture, tint_color, border_color)
  end

  def image(texture : SF::Texture, size : SF::Vector2f, tint_color : SF::Color = SF::Color::White, border_color : SF::Color = SF::Color::Transparent)
    LibImGuiSFML.ImGui_ImageTVCC(texture, size, tint_color, border_color)
  end

  def image(texture : SF::RenderTexture, tint_color : SF::Color = SF::Color::White, border_color : SF::Color = SF::Color::Transparent)
    LibImGuiSFML.ImGui_ImageRCC(texture, tint_color, border_color)
  end

  def image(texture : SF::RenderTexture, size : SF::Vector2f, tint_color : SF::Color = SF::Color::White, border_color : SF::Color = SF::Color::Transparent)
    LibImGuiSFML.ImGui_ImageRVCC(texture, size, tint_color, border_color)
  end

  def image(sprite : SF::Sprite, tint_color : SF::Color = SF::Color::White, border_color : SF::Color = SF::Color::Transparent)
    LibImGuiSFML.ImGui_ImageSCC(sprite, tint_color, border_color)
  end

  def image(sprite : SF::Sprite, size : SF::Vector2f, tint_color : SF::Color = SF::Color::White, border_color : SF::Color = SF::Color::Transparent)
    LibImGuiSFML.ImGui_ImageSVCC(sprite, size, tint_color, border_color)
  end

  def image_button(texture : SF::Texture, frame_padding : Int = -1, bg_color : SF::Color = SF::Color::Transparent, tint_color : SF::Color = SF::Color::White) : Bool
    LibImGuiSFML.ImGui_ImageButtonTICC(texture, frame_padding.to_i, bg_color, tint_color)
  end

  def image_button(texture : SF::Texture, size : SF::Vector2f, frame_padding : Int = -1, bg_color : SF::Color = SF::Color::Transparent, tint_color : SF::Color = SF::Color::White) : Bool
    LibImGuiSFML.ImGui_ImageButtonTVICC(texture, size, frame_padding.to_i, bg_color, tint_color)
  end

  def image_button(texture : SF::RenderTexture, frame_padding : Int = -1, bg_color : SF::Color = SF::Color::Transparent, tint_color : SF::Color = SF::Color::White) : Bool
    LibImGuiSFML.ImGui_ImageButtonRICC(texture, frame_padding.to_i, bg_color, tint_color)
  end

  def image_button(texture : SF::RenderTexture, size : SF::Vector2f, frame_padding : Int = -1, bg_color : SF::Color = SF::Color::Transparent, tint_color : SF::Color = SF::Color::White) : Bool
    LibImGuiSFML.ImGui_ImageButtonRVICC(texture, size, frame_padding.to_i, bg_color, tint_color)
  end

  def image_button(sprite : SF::Sprite, frame_padding : Int = -1, bg_color : SF::Color = SF::Color::Transparent, tint_color : SF::Color = SF::Color::White) : Bool
    LibImGuiSFML.ImGui_ImageButtonSICC(sprite, frame_padding.to_i, bg_color, tint_color)
  end

  def image_button(sprite : SF::Sprite, size : SF::Vector2f, frame_padding : Int = -1, bg_color : SF::Color = SF::Color::Transparent, tint_color : SF::Color = SF::Color::White) : Bool
    LibImGuiSFML.ImGui_ImageButtonSVICC(sprite, size, frame_padding.to_i, bg_color, tint_color)
  end

  def draw_line(a : SF::Vector2f, b : SF::Vector2f, col : SF::Color, thickness : Number = 1.0)
    LibImGuiSFML.ImGui_DrawLine(a, b, col, thickness.to_f32)
  end

  def draw_rect(rect : SF::FloatRect, color : SF::Color, rounding : Number = 0.0, rounding_corners : Int = 0x0F, thickness : Number = 1.0)
    LibImGuiSFML.ImGui_DrawRect(rect, color, rounding.to_f32, rounding_corners.to_i, thickness.to_f32)
  end

  def draw_rect_filled(rect : SF::FloatRect, color : SF::Color, rounding : Number = 0.0, rounding_corners : Int = 0x0F)
    LibImGuiSFML.ImGui_DrawRectFilled(rect, color, rounding.to_f32, rounding_corners.to_i)
  end
end
