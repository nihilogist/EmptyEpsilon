#include "missileWeaponData.h"

MissileWeaponData missile_data[MW_Count] =
{
    //                speed, turnrate, lifetime, color, homing_range
    MissileWeaponData(180.0f, 10.f, 140.0f, sf::Color(255, 200, 0), 200.0, "sfx/rlaunch.wav", 35.0, 7000, 9000),/*MW_Homing -- now used for torpedoes*/
    MissileWeaponData(1500.0f, 0.f, 2.0f, sf::Color(255, 100, 32), 0.0, "sfx/laser_fire.wav", 2.0, 700, 1000),/*MW_Nuke -- now used for lascannon batteries*/
    MissileWeaponData(100.0f,  0.f, 10.0f, sf::Color(255, 255, 255), 0.0, "missile_launch.wav", 100.0, 500, 1000),/*MW_Mine, lifetime is used at time which the mine is ejecting from the ship*/
    MissileWeaponData(200.0f, 10.f, 27.0f, sf::Color(100, 32, 255), 500.0, "sfx/rlaunch.wav", 1.0, 1000, 1500),/*MW_EMP*/
    MissileWeaponData(800.0f,  0.f, 13.5f, sf::Color(200, 200, 200), 0.0, "sfx/hvli_fire.wav", 6.0, 2000, 8000),/*MW_HVLI -- Now used for Macrocannon shells*/
    MissileWeaponData(600.0f,  50.f, 10.0f, sf::Color(200, 200, 200), 1500.0, "missile_launch.wav", 10.0, 2000, 2500),/*MW_AntiFighter- Now used for anitfighter missiles*/
};

MissileWeaponData::MissileWeaponData(float speed, float turnrate, float lifetime, sf::Color color, float homing_range, string fire_sound, float defaultDamage, float engagementRange, float maximumRange)
: speed(speed), turnrate(turnrate), lifetime(lifetime), color(color), homing_range(homing_range), fire_sound(fire_sound), defaultDamage(defaultDamage), engagementRange(engagementRange), maximumRange(maximumRange)
{
}

const MissileWeaponData& MissileWeaponData::getDataFor(EMissileWeapons type)
{
    if (type == MW_None)
        return missile_data[0];
    return missile_data[type];
}

#ifndef _MSC_VER
// MFC: GCC does proper external template instantiation, VC++ doesn't.
#include "missileWeaponData.hpp"
#endif
