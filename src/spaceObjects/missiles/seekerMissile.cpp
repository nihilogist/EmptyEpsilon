#include "seekerMissile.h"
#include "particleEffect.h"
#include "spaceObjects/electricExplosionEffect.h"

REGISTER_MULTIPLAYER_CLASS(SeekerMissile, "SeekerMissile");
SeekerMissile::SeekerMissile()
: MissileWeapon("SeekerMissile", MissileWeaponData::getDataFor(MW_Seeker))
{
}

void SeekerMissile::hitObject(P<SpaceObject> object)
{
    DamageInfo info(owner, DT_Kinetic, getPosition());
    object->takeDamage(category_modifier * 10, info);

}
