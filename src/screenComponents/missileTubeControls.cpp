#include "playerInfo.h"
#include "spaceObjects/playerSpaceship.h"
#include "missileTubeControls.h"
#include "powerDamageIndicator.h"

#include "gui/gui2_button.h"
#include "gui/gui2_progressbar.h"
#include "gui/gui2_label.h"
#include "gui/gui2_togglebutton.h"
#include "gui/gui2_slider.h"


GuiMissileTubeControls::GuiMissileTubeControls(GuiContainer* owner, string id)
: GuiAutoLayout(owner, id, LayoutVerticalBottomToTop), load_type(MW_None), manual_aim(false), missile_target_angle(0)
{
    setSize(GuiElement::GuiSizeMax, GuiElement::GuiSizeMax);

    rows.resize(max_weapon_tubes);

    // Set up the controls that are needed for each tube row
    for (int n = max_weapon_tubes - 1; n >= 0; n--)
    {
        TubeRow row;
        row.layout = new GuiAutoLayout(this, id + "_ROW_" + string(n), LayoutHorizontalLeftToRight);
        row.layout->setSize(GuiElement::GuiSizeMax, 50); // Max height is 50
        // Create the Load button
        row.load_button = new GuiButton(row.layout, id + "_" + string(n) + "_LOAD_BUTTON", "Load", [this, n]() {
            if (!my_spaceship)
                return;
            if (my_spaceship->weapon_tube[n].isEmpty())
            {
                if (load_type != MW_None)
                {
                    my_spaceship->commandLoadTube(n, load_type);
                }
            }
            else
            {
                my_spaceship->commandUnloadTube(n);
            }
        });
        row.load_button->setSize(130, 50);

        // Create the Fire button
        row.fire_button = new GuiButton(row.layout, id + "_" + string(n) + "_FIRE_BUTTON", "Fire", [this, n]() {
            if (!my_spaceship)
                return;
            if (my_spaceship->weapon_tube[n].isLoaded())
            {
                float target_angle = missile_target_angle;
                if (!manual_aim)
                {
                    target_angle = my_spaceship->weapon_tube[n].calculateFiringSolution(my_spaceship->getTarget());
                    if (target_angle == std::numeric_limits<float>::infinity())
                        target_angle = my_spaceship->getRotation() + my_spaceship->weapon_tube[n].getDirection();
                }
                my_spaceship->commandFireTube(n, target_angle);
            }
        });
        row.fire_button->setSize(200, 50);
        // There's a low power / damage indicator as well
        (new GuiPowerDamageIndicator(row.fire_button, id + "_" + string(n) + "_PDI", SYS_MissileSystem, ACenterRight))->setSize(GuiElement::GuiSizeMax, GuiElement::GuiSizeMax);
        // Create the loading progress bar and label
        row.loading_bar = new GuiProgressbar(row.layout, id + "_" + string(n) + "_PROGRESS", 0, 1.0, 0);
        row.loading_bar->setColor(sf::Color(128, 128, 128))->setSize(200, 50);
        row.loading_label = new GuiLabel(row.loading_bar, id + "_" + string(n) + "_PROGRESS_LABEL", "Loading", 35);
        row.loading_label->setSize(GuiElement::GuiSizeMax, GuiElement::GuiSizeMax);

        // If this weapon has a turret available, then create a slider control for it.
        if (my_spaceship->weapon_tube[n].getTurretArc() > 0.1) {
            float weaponTubeMinimumOffset;
            float weaponTubeMaximumOffset;
            if (std::abs(sf::angleDifference(-90.0f, my_spaceship->weapon_tube[n].getDirection())) < 45) {
                weaponTubeMinimumOffset = 0 - (my_spaceship->weapon_tube[n].getTurretArc() / 2);
                weaponTubeMaximumOffset = (my_spaceship->weapon_tube[n].getTurretArc() / 2);
            } else {
                weaponTubeMinimumOffset = (my_spaceship->weapon_tube[n].getTurretArc() / 2);
                weaponTubeMaximumOffset = 0 - (my_spaceship->weapon_tube[n].getTurretArc() / 2);
            }
            
            row.turretControl = new GuiSlider(row.layout, id + "_" + string(n) + "_TURRET", weaponTubeMinimumOffset, weaponTubeMaximumOffset, 0.0, [this, n](float value) {
                if (my_spaceship) {
                    my_spaceship->commandTubeRequestTurretAngle(n, value);
                }
            });
            row.turretControl->addSnapValue(0.0, 0.1)->setSize(150, GuiElement::GuiSizeMax);
        }
        
        
        rows[n] = row;
    }
    
    
    for (int n = MW_Count-1; n >= 0; n--)
    {
        load_type_rows[n].layout = new GuiAutoLayout(this, id + "_ROW_" + string(n), LayoutHorizontalLeftToRight);
        load_type_rows[n].layout->setSize(GuiElement::GuiSizeMax, 40);
        
        load_type_rows[n].button = new GuiToggleButton(load_type_rows[n].layout, id + "_MW_" + string(n), getMissileWeaponName(EMissileWeapons(n)), [this, n](bool value) {
            if (value)
                load_type = EMissileWeapons(n);
            else
                load_type = MW_None;
            for(int idx = 0; idx < MW_Count; idx++)
                load_type_rows[idx].button->setValue(idx == load_type);
        });
        load_type_rows[n].button->setTextSize(28)->setSize(200, 40);
    }
    load_type_rows[MW_Homing].button->setIcon("gui/icons/weapon-homing.png");
    load_type_rows[MW_Mine].button->setIcon("gui/icons/weapon-mine.png");
    load_type_rows[MW_EMP].button->setIcon("gui/icons/weapon-emp.png");
    load_type_rows[MW_Nuke].button->setIcon("gui/icons/weapon-nuke.png");
    load_type_rows[MW_HVLI].button->setIcon("gui/icons/weapon-hvli.png");
}

void GuiMissileTubeControls::onDraw(sf::RenderTarget& window){
    if (!my_spaceship)
        return;
    for (int n = 0; n < MW_Count; n++)
    {
        load_type_rows[n].button->setText(getMissileWeaponName(EMissileWeapons(n)) + " [" + string(my_spaceship->weapon_storage[n]) + "/" + string(my_spaceship->weapon_storage_max[n]) + "]");
        load_type_rows[n].layout->setVisible(my_spaceship->weapon_storage_max[n] > 0);
    }
    

    // For every weapons tube on the ship...
    for (int n = 0; n < my_spaceship->weapon_tube_count; n++)
    {
        WeaponTube& tube = my_spaceship->weapon_tube[n];
        rows[n].layout->show();
        // Show the correct icon for the tube.
        if (tube.canOnlyLoad(MW_Mine))
            rows[n].fire_button->setIcon("gui/icons/weapon-mine", ACenterLeft);
        else
            rows[n].fire_button->setIcon("gui/icons/missile", ACenterLeft, tube.getDirection());
        // If the tube is empty then show the option to load it.
        if(tube.isEmpty())
        {
            rows[n].load_button->setEnable(tube.canLoad(load_type));
            rows[n].load_button->setText("Load");
            rows[n].fire_button->disable()->show();
            rows[n].fire_button->setText(tube.getTubeName() + ": Empty");
            rows[n].loading_bar->hide();
        }else if(tube.isLoaded()) // If the tube is loaded then show the option to unload it.
        {
            rows[n].load_button->enable();
            rows[n].load_button->setText("Unload");
            rows[n].fire_button->enable()->show();
            rows[n].fire_button->setText(tube.getTubeName() + ": " + getMissileWeaponName(tube.getLoadType()));
            rows[n].loading_bar->hide();
        }else if(tube.isLoading()) // If the tube is loading then show the progress bar
        {
            rows[n].load_button->disable();
            rows[n].load_button->setText("Load");
            rows[n].fire_button->hide();
            rows[n].fire_button->setText(tube.getTubeName() + ": " + getMissileWeaponName(tube.getLoadType()));
            rows[n].loading_bar->show();
            rows[n].loading_bar->setValue(tube.getLoadProgress());
            rows[n].loading_label->setText("Loading");
        }else if(tube.isUnloading()) // If the tube is unloading, then show the progress bar
        {
            rows[n].load_button->disable();
            rows[n].load_button->setText("Unload");
            rows[n].fire_button->hide();
            rows[n].fire_button->setText(getMissileWeaponName(tube.getLoadType()));
            rows[n].loading_bar->show();
            rows[n].loading_bar->setValue(tube.getUnloadProgress());
            rows[n].loading_label->setText("Unloading");
        }else if(tube.isFiring()) // If the tube is firing then indicate that it is firing.
        {
            rows[n].load_button->disable();
            rows[n].load_button->setText("Load");
            rows[n].fire_button->disable()->show();
            rows[n].fire_button->setText("Firing");
            rows[n].loading_bar->hide();
        }

        // Update the slider for the turret rotation if there is a change to the requested value
        if (tube.getTurretArc() > 0.0) {
            rows[n].turretControl->setValue(tube.getTurretOffsetRequested());
        }

    }

    // Hide any rows that are not necessary.
    for(int n=my_spaceship->weapon_tube_count; n<max_weapon_tubes; n++)
        rows[n].layout->hide();

    GuiAutoLayout::onDraw(window);
}

void GuiMissileTubeControls::onHotkey(const HotkeyResult& key)
{
    if (key.category == "WEAPONS" && my_spaceship)
    {
        if (key.hotkey == "SELECT_MISSILE_TYPE_HOMING")
            selectMissileWeapon(MW_Homing);
        if (key.hotkey == "SELECT_MISSILE_TYPE_NUKE")
            selectMissileWeapon(MW_Nuke);
        if (key.hotkey == "SELECT_MISSILE_TYPE_MINE")
            selectMissileWeapon(MW_Mine);
        if (key.hotkey == "SELECT_MISSILE_TYPE_EMP")
            selectMissileWeapon(MW_EMP);
        if (key.hotkey == "SELECT_MISSILE_TYPE_HVLI")
            selectMissileWeapon(MW_HVLI);

        for(int n=0; n<my_spaceship->weapon_tube_count; n++)
        {
            if (key.hotkey == "LOAD_TUBE_" + string(n+1))
                my_spaceship->commandLoadTube(n, load_type);
            if (key.hotkey == "UNLOAD_TUBE_" + string(n+1))
                my_spaceship->commandUnloadTube(n);
            if (key.hotkey == "FIRE_TUBE_" + string(n+1))
            {
                float target_angle = missile_target_angle;
                if (!manual_aim)
                {
                    target_angle = my_spaceship->weapon_tube[n].calculateFiringSolution(my_spaceship->getTarget());
                    if (target_angle == std::numeric_limits<float>::infinity())
                        target_angle = my_spaceship->getRotation() + my_spaceship->weapon_tube[n].getDirection();
                }
                my_spaceship->commandFireTube(n, target_angle);
            }
            // Check for hotkeys for turret rotation
            if (my_spaceship->weapon_tube[n].getTurretArc() > 0.0) {
                if (key.hotkey == "TURRET_LEFT_TUBE_" + string(n+1))
                    my_spaceship->commandTubeRequestTurretAngle(n, (my_spaceship->weapon_tube[n].getTurretOffsetRequested() + my_spaceship->weapon_tube[n].getTurretRotationSpeed()));
                if (key.hotkey == "TURRET_RIGHT_TUBE_" + string(n+1))
                    my_spaceship->commandTubeRequestTurretAngle(n, (my_spaceship->weapon_tube[n].getTurretOffsetRequested() - my_spaceship->weapon_tube[n].getTurretRotationSpeed()));
            }
        }
    }
}

void GuiMissileTubeControls::setMissileTargetAngle(float angle)
{
    missile_target_angle = angle;
}

float GuiMissileTubeControls::getMissileTargetAngle()
{
    return missile_target_angle;
}

void GuiMissileTubeControls::setManualAim(bool manual)
{
    manual_aim = manual;
}

bool GuiMissileTubeControls::getManualAim()
{
    return manual_aim;
}

void GuiMissileTubeControls::selectMissileWeapon(EMissileWeapons type)
{
    load_type = type;
    for(int idx = 0; idx < MW_Count; idx++)
        load_type_rows[idx].button->setValue(idx == type);
}
