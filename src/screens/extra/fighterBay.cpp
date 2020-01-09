#include "fighterBay.h"

#include "playerInfo.h"
#include "spaceObjects/playerSpaceship.h"
#include "screenComponents/shieldFreqencySelect.h"
#include "screenComponents/shipInternalView.h"
#include "screenComponents/customShipFunctions.h"
#include "screenComponents/radarView.h"

#include "gui/gui2_keyvaluedisplay.h"
#include "gui/gui2_autolayout.h"

FighterBayScreen::FighterBayScreen(GuiContainer* owner)
: GuiOverlay(owner, "FIGHTER_LAUNCH_SCREEN", colorConfig.background)
{
    radar = new GuiRadarView(this, "RELAY_RADAR", 3000.0f, nullptr);
    radar->longRange()->enableWaypoints()->enableCallsigns()->setStyle(GuiRadarView::Rectangular)->setFogOfWarStyle(GuiRadarView::FriendlysShortRangeFogOfWar);
    radar->setAutoCentering(true);
    radar->setPosition(0, 0, ATopLeft)->setSize(GuiElement::GuiSizeMax, GuiElement::GuiSizeMax);
   
    (new GuiCustomShipFunctions(this, fighterBay, ""))->setPosition(-20, 240, ATopRight)->setSize(250, GuiElement::GuiSizeMax);

}

void FighterBayScreen::onDraw(sf::RenderTarget& window)
{
    GuiOverlay::onDraw(window);
    
    
}
