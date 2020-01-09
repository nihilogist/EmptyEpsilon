#ifndef FIGHTERBAY_H
#define FIGHTERBAY_H

#include "gui/gui2_overlay.h"
#include "shipTemplate.h"

class GuiKeyValueDisplay;
class GuiRadarView;

class FighterBayScreen : public GuiOverlay
{
private:
    GuiKeyValueDisplay* hull_display;
    GuiKeyValueDisplay* system_health[SYS_COUNT];
    GuiRadarView* radar;
public:
    FighterBayScreen(GuiContainer* owner);
    
    void onDraw(sf::RenderTarget& window) override;
};

#endif//FIGHTERBAY_H
