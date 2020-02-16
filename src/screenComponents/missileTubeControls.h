#ifndef MISSILE_TUBE_CONTROLS_H
#define MISSILE_TUBE_CONTROLS_H

#include "gui/gui2_autolayout.h"
#include "missileWeaponData.h"
#include "gui/gui2_slider.h"
#include "gui/gui2_keyvaluedisplay.h"

class GuiButton;
class GuiProgressbar;
class GuiLabel;
class GuiToggleButton;

class GuiMissileTubeControls : public GuiAutoLayout
{
private:
    struct TubeRow {
        GuiAutoLayout* layout;
        GuiButton* load_button;
        GuiButton* fire_button;
        GuiProgressbar* loading_bar;
        GuiLabel* loading_label;
        GuiSlider* turretControl;
    };
    std::vector<TubeRow> rows;
    class TypeRow {
    public:
        GuiAutoLayout* layout;
        GuiToggleButton* button;
        GuiKeyValueDisplay* ammunitionReserve;
    };
    TypeRow load_type_rows[MW_Count];
    EMissileWeapons load_type;
    bool manual_aim;
    float missile_target_angle;
public:
    GuiMissileTubeControls(GuiContainer* owner, string id);
    
    virtual void onDraw(sf::RenderTarget& window) override;
    virtual void onHotkey(const HotkeyResult& key) override;
    
    void setMissileTargetAngle(float angle);
    float getMissileTargetAngle();
    
    void setManualAim(bool manual);
    bool getManualAim();

private:
    void selectMissileWeapon(EMissileWeapons type);
};

#endif//MISSILE_TUBE_CONTROLS_H
