#include "nuke.h"
#include "particleEffect.h"
#include "spaceObjects/explosionEffect.h"

REGISTER_MULTIPLAYER_CLASS(Nuke, "Nuke");
Nuke::Nuke()
: MissileWeapon("Nuke", MissileWeaponData::getDataFor(MW_Nuke))
{
}

void Nuke::hitObject(P<SpaceObject> object)
{
    DamageInfo info(owner, DT_Energy, getPosition());
    object->takeDamage(category_modifier * 6, info);

    P<ExplosionEffect> e = new ExplosionEffect();
    e->setSize(category_modifier * 10);
    e->setPosition(getPosition());
    e->setOnRadar(true);
    e->setExplosionSound("explosion.wav");
}
