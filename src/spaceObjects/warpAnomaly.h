#ifndef WARP_ANOMALY_H
#define WARP_ANOMALY_H

#include "spaceObject.h"

class AnomalyCloud
{
public:
    sf::Vector2f offset;
    float size;
};

class WarpAnomaly : public SpaceObject, public Updatable {

    float updateDelta;


    public:
        WarpAnomaly();

        virtual void drawOnRadar(sf::RenderTarget& window, sf::Vector2f position, float scale, bool long_range);
        virtual void drawOnGMRadar(sf::RenderTarget& window, sf::Vector2f position, float scale, bool long_range);
        virtual void update(float delta);


};

#endif//WARP_ANOMALY_H