#include <imgui-SFML.h>
#include <SFML/Graphics/Color.hpp>
#include <SFML/Graphics/Rect.hpp>
#include <SFML/Graphics/RenderTexture.hpp>
#include <SFML/Graphics/RenderWindow.hpp>
#include <SFML/Graphics/Sprite.hpp>
#include <SFML/Graphics/Texture.hpp>
#include <SFML/System/Time.hpp>
#include <SFML/System/Vector2.hpp>
#include <SFML/Window/Event.hpp>
#include <SFML/Window/Joystick.hpp>
#include <SFML/Window/Window.hpp>

extern "C" {
    void ImGui_SFML_InitW(sf::RenderWindow* window, bool loadDefaultFont) {
        ImGui::SFML::Init(*window, loadDefaultFont);
    }
    void ImGui_SFML_InitWT(sf::Window* window, sf::RenderTexture* target, bool loadDefaultFont) {
        ImGui::SFML::Init(*window, *target, loadDefaultFont);
    }
    void ImGui_SFML_InitWW(sf::Window* window, sf::RenderWindow* target, bool loadDefaultFont) {
        ImGui::SFML::Init(*window, *target, loadDefaultFont);
    }
    void ImGui_SFML_InitWV(sf::Window* window, const sf::Vector2f* displaySize, bool loadDefaultFont) {
        ImGui::SFML::Init(*window, *displaySize, loadDefaultFont);
    }

    void ImGui_SFML_SetCurrentWindowW(const sf::Window* window) {
        ImGui::SFML::SetCurrentWindow(*window);
    }

    void ImGui_SFML_ProcessEventWE(const sf::Window* window, const sf::Event* event) {
        ImGui::SFML::ProcessEvent(*window, *event);
    }
    void ImGui_SFML_ProcessEventE(const sf::Event* event) {
        ImGui::SFML::ProcessEvent(*event);
    }

    void ImGui_SFML_UpdateW(sf::RenderWindow* window, const sf::Time* dt) {
        ImGui::SFML::Update(*window, *dt);
    }
    void ImGui_SFML_UpdateWT(sf::Window* window, sf::RenderTexture* target, const sf::Time* dt) {
        ImGui::SFML::Update(*window, *target, *dt);
    }
    void ImGui_SFML_UpdateWW(sf::Window* window, sf::RenderWindow* target, const sf::Time* dt) {
        ImGui::SFML::Update(*window, *target, *dt);
    }
    void ImGui_SFML_UpdateVV(const sf::Vector2i* mousePos, const sf::Vector2f* displaySize, const sf::Time* dt) {
        ImGui::SFML::Update(*mousePos, *displaySize, *dt);
    }

    void ImGui_SFML_RenderT(sf::RenderTexture* target) {
        ImGui::SFML::Render(*target);
    }
    void ImGui_SFML_RenderW(sf::RenderWindow* target) {
        ImGui::SFML::Render(*target);
    }
    void ImGui_SFML_Render() {
        ImGui::SFML::Render();
    }

    void ImGui_SFML_ShutdownW(const sf::Window* window) {
        ImGui::SFML::Shutdown(*window);
    }
    void ImGui_SFML_Shutdown() {
        ImGui::SFML::Shutdown();
    }

    void ImGui_SFML_UpdateFontTexture() {
        ImGui::SFML::UpdateFontTexture();
    }
    sf::Texture* ImGui_SFML_GetFontTexture() {
        return &ImGui::SFML::GetFontTexture();
    }

    void ImGui_SFML_SetActiveJoystickId(unsigned int joystickId) {
        ImGui::SFML::SetActiveJoystickId(joystickId);
    }
    void ImGui_SFML_SetJoytickDPadThreshold(float threshold) {
        ImGui::SFML::SetJoytickDPadThreshold(threshold);
    }
    void ImGui_SFML_SetJoytickLStickThreshold(float threshold) {
        ImGui::SFML::SetJoytickLStickThreshold(threshold);
    }

    void ImGui_SFML_SetJoystickMapping(int action, unsigned int joystickButton) {
        ImGui::SFML::SetJoystickMapping(action, joystickButton);
    }
    void ImGui_SFML_SetDPadXAxis(sf::Joystick::Axis dPadXAxis, bool inverted) {
        ImGui::SFML::SetDPadXAxis(dPadXAxis, inverted);
    }
    void ImGui_SFML_SetDPadYAxis(sf::Joystick::Axis dPadYAxis, bool inverted) {
        ImGui::SFML::SetDPadYAxis(dPadYAxis, inverted);
    }
    void ImGui_SFML_SetLStickXAxis(sf::Joystick::Axis lStickXAxis, bool inverted) {
        ImGui::SFML::SetLStickXAxis(lStickXAxis, inverted);
    }
    void ImGui_SFML_SetLStickYAxis(sf::Joystick::Axis lStickYAxis, bool inverted) {
        ImGui::SFML::SetLStickYAxis(lStickYAxis, inverted);
    }

    void ImGui_ImageTCC(const sf::Texture* texture, const sf::Color* tintColor, const sf::Color* borderColor) {
        ImGui::Image(*texture, *tintColor, *borderColor);
    }
    void ImGui_ImageTVCC(const sf::Texture* texture, const sf::Vector2f* size, const sf::Color* tintColor, const sf::Color* borderColor) {
        ImGui::Image(*texture, *size, *tintColor, *borderColor);
    }

    void ImGui_ImageRCC(const sf::RenderTexture* texture, const sf::Color* tintColor, const sf::Color* borderColor) {
        ImGui::Image(*texture, *tintColor, *borderColor);
    }
    void ImGui_ImageRVCC(const sf::RenderTexture* texture, const sf::Vector2f* size, const sf::Color* tintColor, const sf::Color* borderColor) {
        ImGui::Image(*texture, *size, *tintColor, *borderColor);
    }

    void ImGui_ImageSCC(const sf::Sprite* sprite, const sf::Color* tintColor, const sf::Color* borderColor) {
        ImGui::Image(*sprite, *tintColor, *borderColor);
    }
    void ImGui_ImageSVCC(const sf::Sprite* sprite, const sf::Vector2f* size, const sf::Color* tintColor, const sf::Color* borderColor) {
        ImGui::Image(*sprite, *size, *tintColor, *borderColor);
    }

    bool ImGui_ImageButtonTICC(const sf::Texture* texture, const int framePadding, const sf::Color* bgColor, const sf::Color* tintColor) {
        return ImGui::ImageButton(*texture, framePadding, *bgColor, *tintColor);
    }
    bool ImGui_ImageButtonTVICC(const sf::Texture* texture, const sf::Vector2f* size, const int framePadding, const sf::Color* bgColor, const sf::Color* tintColor) {
        return ImGui::ImageButton(*texture, *size, framePadding, *bgColor, *tintColor);
    }

    bool ImGui_ImageButtonRICC(const sf::RenderTexture* texture, const int framePadding, const sf::Color* bgColor, const sf::Color* tintColor) {
        return ImGui::ImageButton(*texture, framePadding, *bgColor, *tintColor);
    }
    bool ImGui_ImageButtonRVICC(const sf::RenderTexture* texture, const sf::Vector2f* size, const int framePadding, const sf::Color* bgColor, const sf::Color* tintColor) {
        return ImGui::ImageButton(*texture, *size, framePadding, *bgColor, *tintColor);
    }

    bool ImGui_ImageButtonSICC(const sf::Sprite* sprite, const int framePadding, const sf::Color* bgColor, const sf::Color* tintColor) {
        return ImGui::ImageButton(*sprite, framePadding, *bgColor, *tintColor);
    }
    bool ImGui_ImageButtonSVICC(const sf::Sprite* sprite, const sf::Vector2f* size, const int framePadding, const sf::Color* bgColor, const sf::Color* tintColor) {
        return ImGui::ImageButton(*sprite, *size, framePadding, *bgColor, *tintColor);
    }

    void ImGui_DrawLine(const sf::Vector2f* a, const sf::Vector2f* b, const sf::Color* col, float thickness) {
        ImGui::DrawLine(*a, *b, *col, thickness);
    }
    void ImGui_DrawRect(const sf::FloatRect* rect, const sf::Color* color, float rounding, int rounding_corners, float thickness) {
        ImGui::DrawRect(*rect, *color, rounding, rounding_corners, thickness);
    }
    void ImGui_DrawRectFilled(const sf::FloatRect* rect, const sf::Color* color, float rounding, int rounding_corners) {
        ImGui::DrawRectFilled(*rect, *color, rounding, rounding_corners);
    }
}
