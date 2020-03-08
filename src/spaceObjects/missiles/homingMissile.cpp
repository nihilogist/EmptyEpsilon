#include "homingMissile.h"
#include "particleEffect.h"
#include "spaceObjects/explosionEffect.h"
#include "spaceObjects/cpuShip.h"

REGISTER_MULTIPLAYER_CLASS(HomingMissile, "HomingMissile");
HomingMissile::HomingMissile()
: MissileWeapon("HomingMissile", MissileWeaponData::getDataFor(MW_Homing))
{
}

void HomingMissile::hitObject(P<SpaceObject> object)
{
    float damageAmount = 35.0;
    // Calculate damage
    P<CpuShip> cpuShipHit = P<CpuShip>(object);
    if (cpuShipHit) { // if we hit a CPU ship with the missile, then add chance to do extra damage.
        float criticalChance = random(0.0, 1.0);
        if (criticalChance < 0.1) {
            damageAmount = 50;
        }
    }

    DamageInfo info(owner, DT_Torpedo, getPosition());
    object->takeDamage(category_modifier * damageAmount, info);
    P<ExplosionEffect> e = new ExplosionEffect();
    e->setSize(category_modifier * 30);
    e->setPosition(getPosition());
    e->setOnRadar(true);
}
