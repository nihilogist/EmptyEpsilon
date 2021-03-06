#ifndef STARFIGHTER_PILOT_SCREEN_H
#define STARFIGHTER_PILOT_SCREEN_H

#include "gui/gui2_overlay.h"
#include "screenComponents/targetsContainer.h"

class GuiViewport3D;
class GuiMissileTubeControls;
class GuiRadarView;
class GuiKeyValueDisplay;
class GuiToggleButton;
class GuiRotationDial;

class StarfighterPilotScreen : public GuiOverlay
{
private:
    GuiOverlay* background_gradient;
    GuiOverlay* background_crosses;

    GuiElement* left_panel;

    GuiKeyValueDisplay* energy_display;
    GuiKeyValueDisplay* heading_display;
    GuiKeyValueDisplay* velocity_display;
    GuiKeyValueDisplay* shields_display;
    GuiKeyValueDisplay* plasmaDriveStatus;
    GuiKeyValueDisplay* weaponsStatus;
    GuiKeyValueDisplay* voidShieldStatus;
    
    TargetsContainer targets;
    GuiRadarView* radar;
    GuiRadarView* navRadar;
    GuiMissileTubeControls* tube_controls;
public:
    StarfighterPilotScreen(GuiContainer* owner);
    
    virtual void onDraw(sf::RenderTarget& window);
    virtual void onHotkey(const HotkeyResult& key) override;
};

#endif//STARFIGHTER_PILOT_SCREEN_H
