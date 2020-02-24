#ifndef WARP_ANOMALY_H
#define WARP_ANOMALY_H

#include "spaceObject.h"

class AnomalyCloud
{
public:
    sf::Vector2f offset;
    int texture;
    float size;
};

class WarpAnomaly : public SpaceObject {

    static PVector<WarpAnomaly> warpAnomalyList;
    static const int cloud_count = 32;
    AnomalyCloud clouds[cloud_count];

    public:
        WarpAnomaly();

        #if FEATURE_3D_RENDERING
            virtual void draw3DTransparent();
        #endif

        

        virtual void drawOnRadar(sf::RenderTarget& window, sf::Vector2f position, float scale, bool long_range);
        virtual void drawOnGMRadar(sf::RenderTarget& window, sf::Vector2f position, float scale, bool long_range);


};

#endif//WARP_ANOMALY_H