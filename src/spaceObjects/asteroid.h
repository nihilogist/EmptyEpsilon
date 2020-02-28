#ifndef ASTEROID_H
#define ASTEROID_H

#include "spaceObject.h"

class Asteroid : public SpaceObject
{
public:
    float rotation_speed;
    float z;
    float size;
    int model_number;
    // The structural integrity of the asteroid.
    float integrity;

    Asteroid();
    
    virtual void draw3D();

    virtual void drawOnRadar(sf::RenderTarget& window, sf::Vector2f position, float scale, bool long_range);

    virtual void collide(Collisionable* target, float force) override;

    virtual void takeDamage(float damageAmount, DamageInfo info) override;

    virtual bool canBeTargetedBy(P<SpaceObject> other) override;
    
    void setSize(float size);
    
    virtual string getExportLine() { return "Asteroid():setPosition(" + string(getPosition().x, 0) + ", " + string(getPosition().y, 0) + ")"; }
};

class VisualAsteroid : public SpaceObject
{
public:
    float rotation_speed;
    float z;
    float size;
    int model_number;

    VisualAsteroid();

    virtual void draw3D();
    
    void setSize(float size);

    virtual string getExportLine() { return "VisualAsteroid():setPosition(" + string(getPosition().x, 0) + ", " + string(getPosition().y, 0) + ")"; }
};

#endif//ASTEROID_H
