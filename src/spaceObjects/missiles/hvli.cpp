#include "hvli.h"
#include "particleEffect.h"
#include "spaceObjects/explosionEffect.h"

REGISTER_MULTIPLAYER_CLASS(HVLI, "HVLI");
HVLI::HVLI()
: MissileWeapon("HVLI", MissileWeaponData::getDataFor(MW_HVLI))
{
}

void HVLI::drawOnRadar(sf::RenderTarget& window, sf::Vector2f position, float scale, bool long_range)
{
    if (long_range) return;

    sf::Sprite object_sprite;
    textureManager.setTexture(object_sprite, "RadarMacrocannon.png");
    object_sprite.setRotation(getRotation());
    object_sprite.setPosition(position);
    object_sprite.setColor(data.color);
    object_sprite.setScale(0.25 + 0.25 * category_modifier, 0.25 + 0.25 * category_modifier);
    window.draw(object_sprite);
}

void HVLI::hitObject(P<SpaceObject> object)
{
    DamageInfo info(owner, DT_Kinetic, getPosition());
    // float alive_for = MissileWeaponData::getDataFor(MW_HVLI).lifetime - lifetime;
    // if (alive_for > 2.0)
        object->takeDamage(category_modifier * 6, info);
    // else
    //     object->takeDamage(category_modifier * 6 * (alive_for / 2.0), info);
    // P<ExplosionEffect> e = new ExplosionEffect();
    // e->setSize(category_modifier * 20);
    // e->setPosition(getPosition());
    // e->setOnRadar(true);
    soundManager->playSound("sfx/macrocannon-impact-effect-mono.wav", getPosition(), 200.0, 1.0, 1.0f + random(-0.2f, 0.2f));
}
