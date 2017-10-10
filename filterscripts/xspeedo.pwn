/**
 * Copyright (c) 2017 Xeon SpeedoMeter (XSpeedMeter)
 *
 * This program is free software: you can redistribute it and/or modify it under the terms of the
 * GNU General Public License as published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without
 * even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along with this program.
 * If not, see <http://www.gnu.org/licenses/>.
*/

 /* 
    ScriptName    : XSpeedoMeter
    Author        : XeonMaster
    Version       : 3.0
    Edited        : 10/10/2017
    License       : GNU General v3.0
    Developers    : BigETI
*/

// User definitions

// Server name
// Change this to your server name
#define SERVER_NAME  "My Test Server"


// Includes

// SA:MP include
// Made by the SA:MP team
#include <a_samp>

// Is valid vehicle
// http://wiki.sa-mp.com/wiki/IsValidVehicle
native IsValidVehicle(vehicleid);

// No foreach test
#define _FOREACH_NO_TEST

// Foreach include
// Made by Y_Less, maintained by Kar
#include <foreach>


// Definitions

// Epsilon (a very small number)
#if !defined EPSILON
    #define  EPSILON 0.0001
#endif

// Is floating point number zero
#define IsFloatZero%1(%0)   ((EPSILON >= (%0)) && ((-EPSILON) <= (%0)))

// Is floating point number NaN
#define IsFloatNaN%1(%0)   ((%0) != (%0))

// Is null vector (2D)
#define IsNullVector2%2(%0,%1) (IsFloatZero(%0) && IsFloatZero(%1))

// Get kilometers
#define GetVehicleKilometers%1(%0) ((IsValidVehicle(%0)) ? (g_VehicleDistance[%0]) : (0.0))


// Enumerators and global variables

// Text draw information structure
enum ETextDrawInfo
{
    // X
    Float:ETDInfo_x,

    // Y
    Float:ETDInfo_y,

    // Text
    ETDInfo_text[149],

    // Letter size X
    Float:ETDInfo_letterSizeX,

    // Letter size Y
    Float:ETDInfo_letterSizeY,

    // Text size X
    Float:ETDInfo_textSizeX,

    // Text size Y
    Float:ETDInfo_textSizeY,

    // Alignment
    ETDInfo_alignment,

    // Color
    ETDInfo_color,

    // Use box
    ETDInfo_useBox,

    // Box color
    ETDInfo_boxColor,

    // Shadow
    ETDInfo_shadow,

    // Outline
    ETDInfo_outline,

    // Background
    ETDInfo_backgroundColor,

    // Font
    ETDInfo_font,

    // Proportional
    ETDInfo_proportional
}

// Player text draw information structure
enum EPlayerTextDrawInfo
{
    // X
    Float:EPTDInfo_x,

    // Y
    Float:EPTDInfo_y,

    // Text
    EPTDInfo_text[10],

    // Letter size X
    Float:EPTDInfo_letterSizeX,

    // Letter size Y
    Float:EPTDInfo_letterSizeY,

    // Text size X
    Float:EPTDInfo_textSizeX,

    // Text size Y
    Float:EPTDInfo_textSizeY,

    // Alignment
    EPTDInfo_alignment,

    // Color
    EPTDInfo_color,

    // Shadow
    EPTDInfo_shadow,

    // Outline
    EPTDInfo_outline,

    // Background
    EPTDInfo_backgroundColor,

    // Font
    EPTDInfo_font,

    // Proportional
    EPTDInfo_proportional
}

// Vector (2D) structure
enum EVector2
{
    // X
    Float:EVector2_x,

    // Y
    Float:EVector2_y
}

// Vector (3D) structure
enum EVector3
{
    // X
    Float:EVector3_x,

    // Y
    Float:EVector3_y,

    // Z
    Float:EVector3_z
}

static
    // Textdraws
    g_textdraws[][ETextDrawInfo] =
    {
        {406.888854, 330.871154, "_",         -0.00711, 8.546487,  635.0, 0.0,            1, -1, 1, 70, 0, 0, 255, 1, 1},
        {480.755920, 335.848937, "_",         -0.063887, 0.850619, 558.800048, 0.0,       1, 2680, 1, 70, 0, 0, 255, 1, 1},
        {484.355957, 335.351165, ".",         -0.063887, 0.850619, 494.300231, 0.0,       1, 2680, 1, 70, 0, 0, 255, 1, 1},
        {499.656890, 335.351165, ".",         -0.063887, 0.850619, 510.101043, 0.0,       1, 2680, 1, 70, 0, 0, 255, 1, 1},
        {515.156799, 335.453399, ".",         -0.063887, 0.830618, 526.0, 0.049998,       1, 2680, 1, 70, 0, 0, 255, 1, 1},
        {530.656250, 335.351165, ".",         0.411606, 0.850618,  541.101013, 0.0,       1, 2680, 1, 70, 0, 0, 255, 1, 1},
        {545.811157, 335.351165, ".",         -0.063887, 0.850619, 555.400146, 0.0,       1, 2680, 1, 70, 0, 0, 255, 1, 1},
        {413.733459, 351.777770, "_",         -0.004664, 5.895215, 630.45996, 0.0,        1, 2680, 1, 50, 0, 0, 255, 1, 1},
        {406.690002, 311.162200, "_",         -0.009998, 3.713803, 635.409973, -1.049998, 1, 2680, 1, 50, 0, 0, 255, 1, 1},
        {527.197021, 309.964385, SERVER_NAME, 0.400000, 1.6,       0.0, 0.0,              2, -1, 0, 0, 0, 0, 255, 1, 1},
        {567.766784, 332.862121, "Gear:",     0.313775, 1.002665,  0.0, 0.0,              1, -1, 0, 0, 0, 0, 255, 1, 1},
        {451.367126, 333.711914, "km/h",      0.200442, 0.9728,    0.0, 0.0,              1, -1, 0, 0, 0, 0, 255, 1, 1},
        {415.306274, 353.351165, "_",         0.00311, 5.450621,   628.500915, 0.0,       1, 2680, 1, 70, 0, 0, 255, 1, 1},
        {412.344360, 388.802062, "--------------------------------------~y~--------------------------------------~r~------------------",
                                              0.188887, 1.500444,  0.0, 0.0,              1, -1378294017, 0, 0, 0, 0, 255, 0, 1},
        {417.025695, 367.752471, "0             20             40             60             80            100____________120____________140____________160____________180_________200",
                                              0.099007, 1.053754,  0.0, 0.0,              1, -1, 0, 0, 0, 0, 255, 2, 1},
        {602.888793, 330.425048, "_",         -0.059555, 1.46062,  611.970031, 0.0,       1, -1, 1, 50, 0, 0, 255, 1, 1},
        {416.050964, 347.751831, "I    I    I    I    I    I    I    I    I    I    I    I    I    I    I    I    I    I    I    I____I",
                                              0.147055, 2.471087,  0.0, 0.0,              1, -1, 0, 0, 0, 0, 255, 1, 1},
        {416.849334, 350.782257, "IIIII IIIII IIIII IIIII IIIII IIIII IIIII IIIII IIIII IIIII IIIII IIIII IIIII IIIII IIIII IIIIIIIIIIIIIIIIIIIIIIIIIIIIII",
                                              0.150943, 1.216711,  0.0, 0.0,              1, -1, 0, 0, 0, 0, 255, 1, 1}
    },

    // Player textdraws
    g_playerTextdraws[][EPlayerTextDrawInfo] =
    {
        {483.011145, 334.866699, "00000", 0.568221, 0.992708, 0.0, 0.0,       1, -1378294017, 0, 0, 255, 2, 1},
        {423.017700, 333.711914, "0000", 0.200442, 0.9728,    0.0, 0.0,       1, -1, 0, 0, 255, 2, 1},
        {604.573242, 333.711914, "P", 0.200442, 0.9728,       0.0, 0.0,       1, -1, 0, 0, 255, 2, 1},
        {413.444549, 375.456115, "hud:arrow", 0.0, 0.0,       8.0, 32.039978, 1, -1378294017, 0, 0, 255, 4, 0}
    },

    // Speedometer
    Text:g_Speedometer[sizeof g_textdraws],

    // Gear
    g_Gear[MAX_PLAYERS][2],

    // Vehicle distance
    Float:g_VehicleDistance[MAX_VEHICLES],

    // Vehicle old position
    Float:g_VehicleOldPos[MAX_VEHICLES][EVector3],

    // Counting timer (probably deprecated)
    g_CountingTimer,

    // First measurement
    bool:g_notFirstMeasurement
;

// Player speedometer information structure
enum EPlayerSpeedometerInfo
{
    EPSInfo_enabled,
    PlayerText:EPSInfo_textdraws[sizeof g_playerTextdraws]
}

// Player speedometer
static g_playerSpeedometer[MAX_PLAYERS][EPlayerSpeedometerInfo];


// Functions

// Create personalized textdraws
//
//  playerid: Player ID
CreatePersonalizedTextdraws(playerid)
{
    if (!(g_playerSpeedometer[playerid][EPSInfo_enabled]))
    {
        for (new i; i < sizeof g_playerTextdraws; i++)
        {
            g_playerSpeedometer[playerid][EPSInfo_textdraws][i] = CreatePlayerTextDraw(playerid, g_playerTextdraws[i][EPTDInfo_x], g_playerTextdraws[i][EPTDInfo_y], g_playerTextdraws[i][EPTDInfo_text]);
            PlayerTextDrawLetterSize(playerid, g_playerSpeedometer[playerid][EPSInfo_textdraws][i], g_playerTextdraws[i][EPTDInfo_letterSizeX], g_playerTextdraws[i][EPTDInfo_letterSizeY]);
            if ((g_playerTextdraws[i][EPTDInfo_textSizeX] != 0.0) || (g_playerTextdraws[i][EPTDInfo_textSizeY] != 0.0))
            {
                PlayerTextDrawTextSize(playerid, g_playerSpeedometer[playerid][EPSInfo_textdraws][i], g_playerTextdraws[i][EPTDInfo_textSizeX], g_playerTextdraws[i][EPTDInfo_textSizeY]);
            }
            PlayerTextDrawAlignment(playerid, g_playerSpeedometer[playerid][EPSInfo_textdraws][i], g_playerTextdraws[i][EPTDInfo_alignment]);
            PlayerTextDrawColor(playerid, g_playerSpeedometer[playerid][EPSInfo_textdraws][i], g_playerTextdraws[i][EPTDInfo_color]);
            PlayerTextDrawSetShadow(playerid, g_playerSpeedometer[playerid][EPSInfo_textdraws][i], g_playerTextdraws[i][EPTDInfo_shadow]);
            PlayerTextDrawSetOutline(playerid, g_playerSpeedometer[playerid][EPSInfo_textdraws][i], g_playerTextdraws[i][EPTDInfo_outline]);
            PlayerTextDrawBackgroundColor(playerid, g_playerSpeedometer[playerid][EPSInfo_textdraws][i], g_playerTextdraws[i][EPTDInfo_backgroundColor]);
            PlayerTextDrawFont(playerid, g_playerSpeedometer[playerid][EPSInfo_textdraws][i], g_playerTextdraws[i][EPTDInfo_font]);
            PlayerTextDrawSetProportional(playerid, g_playerSpeedometer[playerid][EPSInfo_textdraws][i], g_playerTextdraws[i][EPTDInfo_proportional]);
            PlayerTextDrawSetShadow(playerid, g_playerSpeedometer[playerid][EPSInfo_textdraws][i], g_playerTextdraws[i][EPTDInfo_shadow]);
        }
        g_playerSpeedometer[playerid][EPSInfo_enabled] = true;
    }
}

// Destroy personalized textdraws
//
// playerid: Player ID
DestroyPersonalizedTextdraws(playerid)
{
    if (g_playerSpeedometer[playerid][EPSInfo_enabled])
    {
        for (new i; i < sizeof g_playerTextdraws; i++)
        {
            PlayerTextDrawDestroy(playerid, g_playerSpeedometer[playerid][EPSInfo_textdraws][i]);
        }
        g_playerSpeedometer[playerid][EPSInfo_enabled] = false;
    }
}

// Show speedometer
//
//  playerid: Player ID
ShowSpeedometer(playerid)
{
    for (new i; i < sizeof g_playerTextdraws; i++)
    {
        PlayerTextDrawShow(playerid, g_playerSpeedometer[playerid][EPSInfo_textdraws][i]);
    }
    for (new i; i < sizeof g_Speedometer; i++)
    {
        TextDrawShowForPlayer(playerid, g_Speedometer[i]);
    }
}

// Hide speedometer
//
//  playerid: Player ID
HideSpeedometer(playerid)
{
    for (new i; i < sizeof g_playerTextdraws; i++)
    {
        PlayerTextDrawHide(playerid, g_playerSpeedometer[playerid][EPSInfo_textdraws][i]);
    }
    for (new i; i < sizeof g_Speedometer; i++)
    {
        TextDrawHideForPlayer(playerid, g_Speedometer[i]);
    }
}

// Wrap value
//
//  x: Value
//  min: Minimum
//  max: Maximum
//
// Returns wrapped value
Float:Wrap(Float:x, Float:min, Float:max)
{
    new
        Float:ret = x,
        Float:delta = max - min;
    if (delta > 0.0)
    {
        while (ret < min)
        {
            ret += delta;
        }
        while (ret > max)
        {
            ret -= delta;
        }
    }
    else if (delta <= 0.0)
    {
        ret = min;
    }
    return x;
}

// Rotation to forward vector
//
//  angle: Angle in degrees (GTA rotation)
//  x: X (out)
//  y: Y (out)
RotationToForwardVector(Float:angle, &Float:x, &Float:y)
{
    // GTA rotation to radians
    //new Float:phi = ((360.0 - Wrap(angle, 0.0, 360.0)) * 3.14159265) / 180.0;
    new Float:phi = (Wrap(angle, 0.0, 360.0) * 3.14159265) / 180.0;
    x = floatcos(phi) - floatsin(phi);
    y = floatsin(phi) + floatcos(phi);
}

// Normalize vector (2D)
//
//  x: X
//  y: Y
//  resultX: Result X (out)
//  resultY: Result Y (out)
NormalizeVector2(Float:x, Float:y, &Float:resultX, &Float:resultY)
{
    if (IsNullVector2(x, y))
    {
        resultX = 0.0;
        resultY = 0.0;
    }
    else
    {
        new Float:mag = floatsqroot((x * x) + (y * y));
        resultX = x / mag;
        resultY = y / mag;
    }
}

// Is vehicle driving backwards
//
//  vehicleid: Vehicle ID
//
// Returns result
IsVehicleDrivingBackwards(vehicleid)
{
    new ret = false;
    if (IsValidVehicle(vehicleid))
    {
        new v1[EVector3], v2[EVector2], v3[EVector2], Float:rot;
        GetVehicleVelocity(vehicleid, v1[EVector3_x], v1[EVector3_y], v1[EVector3_z]);
        NormalizeVector2(v1[EVector3_x], v1[EVector3_y], v1[EVector3_x], v1[EVector3_y]);
        GetVehicleZAngle(vehicleid, rot);
        RotationToForwardVector(rot, v2[EVector2_x], v2[EVector2_y]);
        v3[EVector2_x] = v1[EVector3_x] + v2[EVector2_x];
        v3[EVector2_y] = v1[EVector3_y] + v2[EVector2_y];
        ret = (((v3[EVector2_x] * v3[EVector2_x]) + (v3[EVector2_y] * v3[EVector2_y])) < 2.0);
    }
    return ret;
}

// Get player any velocity magnitude
//
//  playerid: Player ID
//
// Returns velocity magnitude
Float:GetPlayerAnyVelocityMagnitude(playerid)
{
    new Float:ret = 0.0;
    if (IsPlayerConnected(playerid))
    {
        new v[EVector3];
        if (IsPlayerInAnyVehicle(playerid))
        {
            GetVehicleVelocity(GetPlayerVehicleID(playerid), v[EVector3_x], v[EVector3_y], v[EVector3_z]);
        }
        else
        {
            GetPlayerVelocity(playerid, v[EVector3_x], v[EVector3_y], v[EVector3_z]);
        }
        ret = floatsqroot((v[EVector3_x] * v[EVector3_x]) + (v[EVector3_y] * v[EVector3_y]) + (v[EVector3_z] + v[EVector3_z]));
    }
    return ret;
}

// On filter script init event
public OnFilterScriptInit()
{
    for (new t; t < sizeof g_textdraws; t++)
    {
        g_Speedometer[t] = TextDrawCreate(g_textdraws[t][ETDInfo_x], g_textdraws[t][ETDInfo_y], g_textdraws[t][ETDInfo_text]);
        TextDrawLetterSize(g_Speedometer[t], g_textdraws[t][ETDInfo_letterSizeX], g_textdraws[t][ETDInfo_letterSizeY]);
        if ((g_textdraws[t][ETDInfo_textSizeX] != 0.0) || (g_textdraws[t][ETDInfo_textSizeY] != 0.0))
        {
            TextDrawTextSize(g_Speedometer[t], g_textdraws[t][ETDInfo_textSizeX], g_textdraws[t][ETDInfo_textSizeY]);
        }
        TextDrawAlignment(g_Speedometer[t], g_textdraws[t][ETDInfo_alignment]);
        TextDrawColor(g_Speedometer[t], g_textdraws[t][ETDInfo_color]);
        TextDrawUseBox(g_Speedometer[t], g_textdraws[t][ETDInfo_useBox]);
        TextDrawBoxColor(g_Speedometer[t], g_textdraws[t][ETDInfo_boxColor]);
        TextDrawSetShadow(g_Speedometer[t], g_textdraws[t][ETDInfo_shadow]);
        TextDrawSetOutline(g_Speedometer[t], g_textdraws[t][ETDInfo_outline]);
        TextDrawBackgroundColor(g_Speedometer[t], g_textdraws[t][ETDInfo_backgroundColor]);
        TextDrawFont(g_Speedometer[t], g_textdraws[t][ETDInfo_font]);
        TextDrawSetProportional(g_Speedometer[t], g_textdraws[t][ETDInfo_proportional]);
    }
    foreach (new p : Player)
    {
        CreatePersonalizedTextdraws(p);
        if (GetPlayerState(p) == PLAYER_STATE_DRIVER)
        {
            ShowSpeedometer(p);
        }
    }

    // Probably deprecated
    g_CountingTimer = SetTimer("KilometersCounter", 1000, true);
    
    print("  -> XSpeedo has been loaded. Project: https://github.com/XeonMaster/Xeon-SpeedoMeter");
    return 1;
}

// On filter script exit event
public OnFilterScriptExit()
{
    foreach (new i : Player)
    {
        printf("Removing for player ID %d", i);
        DestroyPersonalizedTextdraws(i);
        printf("Removing for player ID %d done.", i);
    }
    for (new i = 0; i < sizeof g_Speedometer; i++)
    {
        TextDrawDestroy(g_Speedometer[i]);
    }
    KillTimer(g_CountingTimer);
    print("  -> XSpeedo has been unloaded. Project: https://github.com/XeonMaster/Xeon-SpeedoMeter");
    return 1;
}

// On player connect event
//
//  playerid: Player ID
public OnPlayerConnect(playerid)
{
    g_Gear[playerid] = "P";
    CreatePersonalizedTextdraws(playerid);
    return 1;
}

// On player disconnect event
//
//  playerid: Player ID
public OnPlayerDisconnect(playerid)
{
    DestroyPersonalizedTextdraws(playerid);
    for (new i = 0; i < sizeof g_Speedometer; i++)
    {
        TextDrawHideForPlayer(playerid, g_Speedometer[i]);
    }
    return 1;
}

// On player state change event
//
//  playerid: Player ID
//  newstate: New state
//  oldstate: Old state
public OnPlayerStateChange(playerid, newstate, oldstate)
{
    if(newstate == PLAYER_STATE_DRIVER)
    {
        ShowSpeedometer(playerid);
    }
    else
    {
        HideSpeedometer(playerid);
    }
    return 1;
}

// On player update event
//
//  playerid: Player ID
public OnPlayerUpdate(playerid)
{
    if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
    {
        new Float:speed = GetPlayerAnyVelocityMagnitude(playerid) * 181.5;
        if (IsFloatNaN(speed))
        {
            speed = 0.0;
        }
        if (IsFloatZero(speed))
        {
            g_Gear[playerid] = "P";
            PlayerTextDrawDestroy(playerid, g_playerSpeedometer[playerid][EPSInfo_textdraws][3]);
            g_playerSpeedometer[playerid][EPSInfo_textdraws][3] = CreatePlayerTextDraw(playerid, 413.444549, 375.456115, "hud:arrow");
        }
        else
        {
            new Float:graphical_speed = speed;
            if (speed > 200.0)
            {
                graphical_speed = 200.0;
            }
            else if (speed > 0.0)
            {
                if (IsVehicleDrivingBackwards(GetPlayerVehicleID(playerid)))
                {
                    g_Gear[playerid] = "R";
                }
                else
                {
                    g_Gear[playerid] = "D";
                }
            }
            PlayerTextDrawDestroy(playerid, g_playerSpeedometer[playerid][EPSInfo_textdraws][3]);
            g_playerSpeedometer[playerid][EPSInfo_textdraws][3] = CreatePlayerTextDraw(playerid, 414 + graphical_speed, 375.456115, "hud:arrow");
        }

        PlayerTextDrawLetterSize(playerid, g_playerSpeedometer[playerid][EPSInfo_textdraws][3], 0.000000, 0.000000);
        PlayerTextDrawTextSize(playerid, g_playerSpeedometer[playerid][EPSInfo_textdraws][3], 8.000000, 32.039978);
        PlayerTextDrawAlignment(playerid, g_playerSpeedometer[playerid][EPSInfo_textdraws][3], 1);
        PlayerTextDrawColor(playerid, g_playerSpeedometer[playerid][EPSInfo_textdraws][3], -1378294017);
        PlayerTextDrawSetShadow(playerid, g_playerSpeedometer[playerid][EPSInfo_textdraws][3], 0);
        PlayerTextDrawSetOutline(playerid, g_playerSpeedometer[playerid][EPSInfo_textdraws][3], 0);
        PlayerTextDrawBackgroundColor(playerid, g_playerSpeedometer[playerid][EPSInfo_textdraws][3], 255);
        PlayerTextDrawFont(playerid, g_playerSpeedometer[playerid][EPSInfo_textdraws][3], 4);
        PlayerTextDrawSetProportional(playerid, g_playerSpeedometer[playerid][EPSInfo_textdraws][3], 0);
        PlayerTextDrawSetShadow(playerid, g_playerSpeedometer[playerid][EPSInfo_textdraws][3], 0);
        PlayerTextDrawShow(playerid, g_playerSpeedometer[playerid][EPSInfo_textdraws][3]);

        PlayerTextDrawSetString(playerid, g_playerSpeedometer[playerid][EPSInfo_textdraws][2], g_Gear[playerid]);

        new str[6];
        format(str, sizeof str, "%04d", floatround(speed, floatround_floor));
        PlayerTextDrawSetString(playerid, g_playerSpeedometer[playerid][EPSInfo_textdraws][1], str);

        format(str, sizeof str, "%05f", GetVehicleKilometers(GetPlayerVehicleID(playerid)) /*floatround(GetVehicleKilometers(GetPlayerVehicleID(playerid)), floatround_floor)*/);
        PlayerTextDrawSetString(playerid, g_playerSpeedometer[playerid][EPSInfo_textdraws][0], str);
    }
    return 1;
}

// Kilometers counter event
forward public KilometersCounter();
public KilometersCounter()
{
    new Float:npos[EVector3], vel[EVector3];
    for (new v; v < MAX_VEHICLES; v++)
    {
        if (IsValidVehicle(v))
        {
            GetVehiclePos(v, npos[EVector3_x], npos[EVector3_y], npos[EVector3_z]);
            if (g_notFirstMeasurement)
            {
                vel[EVector3_x] = npos[EVector3_x] - g_VehicleOldPos[v][EVector3_x];
                vel[EVector3_y] = npos[EVector3_y] - g_VehicleOldPos[v][EVector3_y];
                vel[EVector3_z] = npos[EVector3_z] - g_VehicleOldPos[v][EVector3_z];
                g_VehicleDistance[v] += floatsqroot((vel[EVector3_x] * vel[EVector3_x]) + (vel[EVector3_y] * vel[EVector3_y]) + (vel[EVector3_z] * vel[EVector3_z])) * 0.001;
            }
            g_VehicleOldPos[v][EVector3_x] = npos[EVector3_x];
            g_VehicleOldPos[v][EVector3_y] = npos[EVector3_y];
            g_VehicleOldPos[v][EVector3_z] = npos[EVector3_z];
        }
    }
    g_notFirstMeasurement = true;
}
