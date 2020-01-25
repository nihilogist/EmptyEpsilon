#ifndef SEEKERMISSILE_H
#define SEEKERMISSILE_H

#include "missileWeapon.h"

/** Seeker missile
    Small, high-speed missile used to target fighter craft.
*/
class SeekerMissile : public MissileWeapon
{
public:
    SeekerMissile();
    
    virtual void hitObject(P<SpaceObject> object);
};

#endif//SEEKERMISSILE_H
