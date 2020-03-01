#include "warpAnomaly.h"
#include "main.h"
#include "gameGlobalInfo.h"
#include "scriptInterface.h"

REGISTER_SCRIPT_SUBCLASS(WarpAnomaly, SpaceObject) {

}


REGISTER_MULTIPLAYER_CLASS(WarpAnomaly, "WarpAnomaly");

WarpAnomaly::WarpAnomaly()
    : SpaceObject(10, "WarpAnomaly") {
        updateDelta = 0.0;


}

void WarpAnomaly::update(float delta) {
    updateDelta = delta;
    if (updateDelta == 0.0) {
        return;
    }
    // loop through all player ships
    for (int i = 0; i < 4; i++) {
        P<PlayerSpaceship> ship = gameGlobalInfo->getPlayerShip(i);
        if (ship) {
            sf::Vector2f diff = getPosition() - ship->getPosition();
            float distance = sf::length(diff);
            if (distance > 12000) {
                float force = ((distance - 12000) / 10000) * ((distance - 12000) / 10000);
                ship->setPosition(ship->getPosition() + diff * (force / 10000));
            }
        }
        
    }
}

void WarpAnomaly::drawOnRadar(sf::RenderTarget& window, sf::Vector2f position, float scale, bool long_range) {
    // sf::Sprite object_sprite;
    // textureManager.setTexture(object_sprite, "WarpShadow1.png");
    // object_sprite.setRotation(getRotation());
    // object_sprite.setPosition(position + sf::Vector2f(2500, 500) * scale);
    // float size = getRadius() * scale / object_sprite.getTextureRect().width;
    // object_sprite.setScale(size, size);
    // object_sprite.setColor(sf::Color(255, 255, 255));
    // window.draw(object_sprite, sf::BlendAdd);
}

void WarpAnomaly::drawOnGMRadar(sf::RenderTarget& window, sf::Vector2f position, float scale, bool long_range) {
    // sf::Sprite object_sprite;
    // textureManager.setTexture(object_sprite, "WarpShadowGM.png");
    // object_sprite.setRotation(getRotation());
    // object_sprite.setPosition(position + sf::Vector2f(2500, 500) * scale);
    // float size = getRadius() * scale / object_sprite.getTextureRect().width;
    // object_sprite.setScale(size, size);
    // object_sprite.setColor(sf::Color(255, 255, 255));
    // window.draw(object_sprite, sf::BlendAdd);
}
