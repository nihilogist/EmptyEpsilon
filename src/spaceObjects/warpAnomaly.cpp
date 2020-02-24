#include <SFML/OpenGL.hpp>
#include "warpAnomaly.h"
#include "nebula.h"
#include "main.h"

REGISTER_SCRIPT_SUBCLASS(WarpAnomaly, SpaceObject) {

}

PVector<WarpAnomaly> WarpAnomaly::warpAnomalyList;

REGISTER_MULTIPLAYER_CLASS(WarpAnomaly, "WarpAnomaly");

WarpAnomaly::WarpAnomaly()
    : SpaceObject(5000, "WarpAnomaly") {
        // Create a vector of 5000 x 1000 and set this as the collision box of the anomaly
        setCollisionBox(sf::Vector2f(5000, 1000), sf::Vector2f(2500, 500));

    warpAnomalyList.push_back(this);

}

void WarpAnomaly::drawOnRadar(sf::RenderTarget& window, sf::Vector2f position, float scale, bool long_range) {
    sf::Sprite object_sprite;
    textureManager.setTexture(object_sprite, "WarpShadow1.png");
    object_sprite.setRotation(getRotation());
    object_sprite.setPosition(position + sf::Vector2f(2500, 500) * scale);
    float size = getRadius() * scale / object_sprite.getTextureRect().width;
    object_sprite.setScale(size, size);
    object_sprite.setColor(sf::Color(255, 255, 255));
    window.draw(object_sprite, sf::BlendAdd);
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

#if FEATURE_3D_RENDERING
void WarpAnomaly::draw3DTransparent()
{
    glRotatef(getRotation(), 0, 0, -1);
    glTranslatef(-getPosition().x, -getPosition().y, 0);
    for(int n=0; n<cloud_count; n++)
    {
        AnomalyCloud& cloud = clouds[n];

        sf::Vector3f position = sf::Vector3f(getPosition().x, getPosition().y, 0) + sf::Vector3f(cloud.offset.x, cloud.offset.y, 0);
        float size = cloud.size;
        
        float distance = sf::length(camera_position - position);
        float alpha = 1.0 - (distance / 10000.0f);
        if (alpha < 0.0)
            continue;

        ShaderManager::getShader("billboardShader")->setUniform("textureMap", *textureManager.getTexture("Nebula" + string(cloud.texture) + ".png"));
        sf::Shader::bind(ShaderManager::getShader("billboardShader"));
        glBegin(GL_QUADS);
        glColor4f(alpha * 0.8, alpha * 0.8, alpha * 0.8, size);
        glTexCoord2f(0, 0);
        glVertex3f(position.x, position.y, position.z);
        glTexCoord2f(1, 0);
        glVertex3f(position.x, position.y, position.z);
        glTexCoord2f(1, 1);
        glVertex3f(position.x, position.y, position.z);
        glTexCoord2f(0, 1);
        glVertex3f(position.x, position.y, position.z);
        glEnd();
    }
}
#endif//FEATURE_3D_RENDERING