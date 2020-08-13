@[Link("cimgui")]
{% unless flag?(:win32) %}
  @[Link(ldflags: "-L#{__DIR__}/..")]
{% end %}
lib LibImGuiSFML
  alias SF_Color = Void
  alias SF_Event = Void
  alias SF_FloatRect = Void
  alias SF_Joystick_Axis = LibC::Int
  alias SF_RenderTexture = Void
  alias SF_RenderWindow = Void
  alias SF_Sprite = Void
  alias SF_Texture = Void
  alias SF_Time = Void
  alias SF_Vector2f = Void
  alias SF_Vector2i = Void
  alias SF_Window = Void

  fun ImGui_SFML_InitW(window : SF_RenderWindow*, loadDefaultFont : Bool)
  fun ImGui_SFML_InitWT(window : SF_Window*, target : SF_RenderTexture*, loadDefaultFont : Bool)
  fun ImGui_SFML_InitWW(window : SF_Window*, target : SF_RenderWindow*, loadDefaultFont : Bool)
  fun ImGui_SFML_InitWV(window : SF_Window*, displaySize : SF_Vector2f*, loadDefaultFont : Bool)

  fun ImGui_SFML_ProcessEvent(event : SF_Event*)

  fun ImGui_SFML_UpdateW(window : SF_RenderWindow*, dt : SF_Time*)
  fun ImGui_SFML_UpdateWT(window : SF_Window*, target : SF_RenderTexture*, dt : SF_Time*)
  fun ImGui_SFML_UpdateWW(window : SF_Window*, target : SF_RenderWindow*, dt : SF_Time*)
  fun ImGui_SFML_UpdateVV(mousePos : SF_Vector2i*, displaySize : SF_Vector2f*, dt : SF_Time*)

  fun ImGui_SFML_RenderT(target : SF_RenderTexture*)
  fun ImGui_SFML_RenderW(target : SF_RenderWindow*)
  fun ImGui_SFML_Render()

  fun ImGui_SFML_Shutdown()

  fun ImGui_SFML_UpdateFontTexture()
  fun ImGui_SFML_GetFontTexture() : SF_Texture*

  fun ImGui_SFML_SetActiveJoystickId(joystickId : LibC::UInt)
  fun ImGui_SFML_SetJoytickDPadThreshold(threshold : LibC::Float)
  fun ImGui_SFML_SetJoytickLStickThreshold(threshold : LibC::Float)

  fun ImGui_SFML_SetJoystickMapping(action : LibC::Int, joystickButton : LibC::UInt)
  fun ImGui_SFML_SetDPadXAxis(dPadXAxis : SF_Joystick_Axis, inverted : Bool)
  fun ImGui_SFML_SetDPadYAxis(dPadYAxis : SF_Joystick_Axis, inverted : Bool)
  fun ImGui_SFML_SetLStickXAxis(lStickXAxis : SF_Joystick_Axis, inverted : Bool)
  fun ImGui_SFML_SetLStickYAxis(lStickYAxis : SF_Joystick_Axis, inverted : Bool)

  fun ImGui_ImageTCC(texture : SF_Texture*, tintColor : SF_Color*, borderColor : SF_Color*)
  fun ImGui_ImageTVCC(texture : SF_Texture*, size : SF_Vector2f*, tintColor : SF_Color*, borderColor : SF_Color*)
  fun ImGui_ImageTRCC(texture : SF_Texture*, textureRect : SF_FloatRect*, tintColor : SF_Color*, borderColor : SF_Color*)
  fun ImGui_ImageTVRCC(texture : SF_Texture*, size : SF_Vector2f*, textureRect : SF_FloatRect*, tintColor : SF_Color*, borderColor : SF_Color*)

  fun ImGui_ImageSCC(sprite : SF_Sprite*, tintColor : SF_Color*, borderColor : SF_Color*)
  fun ImGui_ImageSVCC(sprite : SF_Sprite*, size : SF_Vector2f*, tintColor : SF_Color*, borderColor : SF_Color*)

  fun ImGui_ImageButtonTICC(texture : SF_Texture*, framePadding : LibC::Int, bgColor : SF_Color*, tintColor : SF_Color*) : Bool
  fun ImGui_ImageButtonTVICC(texture : SF_Texture*, size : SF_Vector2f*, framePadding : LibC::Int, bgColor : SF_Color*, tintColor : SF_Color*) : Bool

  fun ImGui_ImageButtonSICC(sprite : SF_Sprite*, framePadding : LibC::Int, bgColor : SF_Color*, tintColor : SF_Color*) : Bool
  fun ImGui_ImageButtonSVICC(sprite : SF_Sprite*, size : SF_Vector2f*, framePadding : LibC::Int, bgColor : SF_Color*, tintColor : SF_Color*) : Bool

  fun ImGui_DrawLine(a : SF_Vector2f*, b : SF_Vector2f*, col : SF_Color*, thickness : LibC::Float)
  fun ImGui_DrawRect(rect : SF_FloatRect*, color : SF_Color*, rounding : LibC::Float, rounding_corners : LibC::Int, thickness : LibC::Float)
  fun ImGui_DrawRectFilled(rect : SF_FloatRect*, color : SF_Color*, rounding : LibC::Float, rounding_corners : LibC::Int)
end
