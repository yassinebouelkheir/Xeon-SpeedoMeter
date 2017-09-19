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
    Version       : 1.0
    Edited        : 17/09/2017
    License       : GNU General v3.0
    Constributors : No-one for now.
*/

#include <a_samp> // Credits to SA:MP Team. (Kalcor)
#include <edistance> // Credits to EditPawn.

#define SERVER_SLOTS 100 // change this to your server max slots.
#define SERVER_NAME  "Xeon Test Server" // change this to your server name

// Now you can stop editing.
#if defined MAX_PLAYERS
    #undef MAX_PLAYERS
        #define MAX_PLAYERS SERVER_SLOTS
#endif

new 
    PlayerText:p_Speedo[MAX_PLAYERS][4],
    Text:g_Speedo[18],

    Gear[MAX_PLAYERS][2]
;

public OnFilterScriptInit()
{

    for(new i = 0; i < GetMaxPlayers(); i++) if(IsPlayerConnected(i)) PlayerTextDraw(i, true);

    g_Speedo[0] = TextDrawCreate(406.888854, 330.871154, "_");
    TextDrawLetterSize(g_Speedo[0], -0.007110, 8.546487);
    TextDrawTextSize(g_Speedo[0], 635.000000, 0.000000);
    TextDrawAlignment(g_Speedo[0], 1);
    TextDrawColor(g_Speedo[0], -1);
    TextDrawUseBox(g_Speedo[0], 1);
    TextDrawBoxColor(g_Speedo[0], 70);
    TextDrawSetShadow(g_Speedo[0], 0);
    TextDrawSetOutline(g_Speedo[0], 0);
    TextDrawBackgroundColor(g_Speedo[0], 255);
    TextDrawFont(g_Speedo[0], 1);
    TextDrawSetProportional(g_Speedo[0], 1);
    TextDrawSetShadow(g_Speedo[0], 0);

    g_Speedo[1] = TextDrawCreate(480.755920, 335.848937, "_");
    TextDrawLetterSize(g_Speedo[1], -0.063887, 0.850619);
    TextDrawTextSize(g_Speedo[1], 558.800048, 0.000000);
    TextDrawAlignment(g_Speedo[1], 1);
    TextDrawColor(g_Speedo[1], 2680);
    TextDrawUseBox(g_Speedo[1], 1);
    TextDrawBoxColor(g_Speedo[1], 70);
    TextDrawSetShadow(g_Speedo[1], 0);
    TextDrawSetOutline(g_Speedo[1], 0);
    TextDrawBackgroundColor(g_Speedo[1], 255);
    TextDrawFont(g_Speedo[1], 1);
    TextDrawSetProportional(g_Speedo[1], 1);
    TextDrawSetShadow(g_Speedo[1], 0);

    g_Speedo[2] = TextDrawCreate(484.355957, 335.351165, ".");
    TextDrawLetterSize(g_Speedo[2], -0.063887, 0.850619);
    TextDrawTextSize(g_Speedo[2], 494.300231, 0.000000);
    TextDrawAlignment(g_Speedo[2], 1);
    TextDrawColor(g_Speedo[2], 2680);
    TextDrawUseBox(g_Speedo[2], 1);
    TextDrawBoxColor(g_Speedo[2], 70);
    TextDrawSetShadow(g_Speedo[2], 0);
    TextDrawSetOutline(g_Speedo[2], 0);
    TextDrawBackgroundColor(g_Speedo[2], 255);
    TextDrawFont(g_Speedo[2], 1);
    TextDrawSetProportional(g_Speedo[2], 1);
    TextDrawSetShadow(g_Speedo[2], 0);

    g_Speedo[3] = TextDrawCreate(499.656890, 335.351165, ".");
    TextDrawLetterSize(g_Speedo[3], -0.063887, 0.850619);
    TextDrawTextSize(g_Speedo[3], 510.101043, 0.000000);
    TextDrawAlignment(g_Speedo[3], 1);
    TextDrawColor(g_Speedo[3], 2680);
    TextDrawUseBox(g_Speedo[3], 1);
    TextDrawBoxColor(g_Speedo[3], 70);
    TextDrawSetShadow(g_Speedo[3], 0);
    TextDrawSetOutline(g_Speedo[3], 0);
    TextDrawBackgroundColor(g_Speedo[3], 255);
    TextDrawFont(g_Speedo[3], 1);
    TextDrawSetProportional(g_Speedo[3], 1);
    TextDrawSetShadow(g_Speedo[3], 0);

    g_Speedo[4] = TextDrawCreate(515.156799, 335.453399, ".");
    TextDrawLetterSize(g_Speedo[4], -0.063887, 0.830618);
    TextDrawTextSize(g_Speedo[4], 526.000000, 0.049998);
    TextDrawAlignment(g_Speedo[4], 1);
    TextDrawColor(g_Speedo[4], 2680);
    TextDrawUseBox(g_Speedo[4], 1);
    TextDrawBoxColor(g_Speedo[4], 70);
    TextDrawSetShadow(g_Speedo[4], 0);
    TextDrawSetOutline(g_Speedo[4], 0);
    TextDrawBackgroundColor(g_Speedo[4], 255);
    TextDrawFont(g_Speedo[4], 1);
    TextDrawSetProportional(g_Speedo[4], 1);
    TextDrawSetShadow(g_Speedo[4], 0);

    g_Speedo[5] = TextDrawCreate(530.656250, 335.351165, ".");
    TextDrawLetterSize(g_Speedo[5], 0.411606, 0.850618);
    TextDrawTextSize(g_Speedo[5], 541.101013, 0.000000);
    TextDrawAlignment(g_Speedo[5], 1);
    TextDrawColor(g_Speedo[5], 2680);
    TextDrawUseBox(g_Speedo[5], 1);
    TextDrawBoxColor(g_Speedo[5], 70);
    TextDrawSetShadow(g_Speedo[5], 0);
    TextDrawSetOutline(g_Speedo[5], 0);
    TextDrawBackgroundColor(g_Speedo[5], 255);
    TextDrawFont(g_Speedo[5], 1);
    TextDrawSetProportional(g_Speedo[5], 1);
    TextDrawSetShadow(g_Speedo[5], 0);

    g_Speedo[6] = TextDrawCreate(545.811157, 335.351165, ".");
    TextDrawLetterSize(g_Speedo[6], -0.063887, 0.850619);
    TextDrawTextSize(g_Speedo[6], 555.400146, 0.000000);
    TextDrawAlignment(g_Speedo[6], 1);
    TextDrawColor(g_Speedo[6], 2680);
    TextDrawUseBox(g_Speedo[6], 1);
    TextDrawBoxColor(g_Speedo[6], 70);
    TextDrawSetShadow(g_Speedo[6], 0);
    TextDrawSetOutline(g_Speedo[6], 0);
    TextDrawBackgroundColor(g_Speedo[6], 255);
    TextDrawFont(g_Speedo[6], 1);
    TextDrawSetProportional(g_Speedo[6], 1);
    TextDrawSetShadow(g_Speedo[6], 0);

    g_Speedo[7] = TextDrawCreate(413.733459, 351.777770, "_");
    TextDrawLetterSize(g_Speedo[7], -0.004664, 5.895215);
    TextDrawTextSize(g_Speedo[7], 630.459960, 0.000000);
    TextDrawAlignment(g_Speedo[7], 1);
    TextDrawColor(g_Speedo[7], 2680);
    TextDrawUseBox(g_Speedo[7], 1);
    TextDrawBoxColor(g_Speedo[7], 50);
    TextDrawSetShadow(g_Speedo[7], 0);
    TextDrawSetOutline(g_Speedo[7], 0);
    TextDrawBackgroundColor(g_Speedo[7], 255);
    TextDrawFont(g_Speedo[7], 1);
    TextDrawSetProportional(g_Speedo[7], 1);
    TextDrawSetShadow(g_Speedo[7], 0);

    g_Speedo[8] = TextDrawCreate(406.690002, 311.162200, "_");
    TextDrawLetterSize(g_Speedo[8], -0.009998, 3.713803);
    TextDrawTextSize(g_Speedo[8], 635.409973, -1.049998);
    TextDrawAlignment(g_Speedo[8], 1);
    TextDrawColor(g_Speedo[8], 2680);
    TextDrawUseBox(g_Speedo[8], 1);
    TextDrawBoxColor(g_Speedo[8], 50);
    TextDrawSetShadow(g_Speedo[8], 0);
    TextDrawSetOutline(g_Speedo[8], 0);
    TextDrawBackgroundColor(g_Speedo[8], 255);
    TextDrawFont(g_Speedo[8], 1);
    TextDrawSetProportional(g_Speedo[8], 1);
    TextDrawSetShadow(g_Speedo[8], 0);

    g_Speedo[9] = TextDrawCreate(526.197021, 309.964385, SERVER_NAME);
    TextDrawLetterSize(g_Speedo[9], 0.400000, 1.600000);
    TextDrawAlignment(g_Speedo[9], 2);
    TextDrawColor(g_Speedo[9], -1);
    TextDrawSetShadow(g_Speedo[9], 0);
    TextDrawSetOutline(g_Speedo[9], 0);
    TextDrawBackgroundColor(g_Speedo[9], 255);
    TextDrawFont(g_Speedo[9], 0);
    TextDrawSetProportional(g_Speedo[9], 1);
    TextDrawSetShadow(g_Speedo[9], 0);

    g_Speedo[10] = TextDrawCreate(577.766784, 332.862121, "Gear:");
    TextDrawLetterSize(g_Speedo[10], 0.313775, 1.002665);
    TextDrawAlignment(g_Speedo[10], 1);
    TextDrawColor(g_Speedo[10], -1);
    TextDrawSetShadow(g_Speedo[10], 0);
    TextDrawSetOutline(g_Speedo[10], 0);
    TextDrawBackgroundColor(g_Speedo[10], 255);
    TextDrawFont(g_Speedo[10], 0);
    TextDrawSetProportional(g_Speedo[10], 1);
    TextDrawSetShadow(g_Speedo[10], 0);

    g_Speedo[11] = TextDrawCreate(451.367126, 333.711914, "KM/H");
    TextDrawLetterSize(g_Speedo[11], 0.200442, 0.972800);
    TextDrawAlignment(g_Speedo[11], 1);
    TextDrawColor(g_Speedo[11], -1);
    TextDrawSetShadow(g_Speedo[11], 0);
    TextDrawSetOutline(g_Speedo[11], 0);
    TextDrawBackgroundColor(g_Speedo[11], 255);
    TextDrawFont(g_Speedo[11], 2);
    TextDrawSetProportional(g_Speedo[11], 1);
    TextDrawSetShadow(g_Speedo[11], 0);

    g_Speedo[12] = TextDrawCreate(415.306274, 353.351165, "_");
    TextDrawLetterSize(g_Speedo[12], 0.003110, 5.450621);
    TextDrawTextSize(g_Speedo[12], 628.500915, 0.000000);
    TextDrawAlignment(g_Speedo[12], 1);
    TextDrawColor(g_Speedo[12], 2680);
    TextDrawUseBox(g_Speedo[12], 1);
    TextDrawBoxColor(g_Speedo[12], 70);
    TextDrawSetShadow(g_Speedo[12], 0);
    TextDrawSetOutline(g_Speedo[12], 0);
    TextDrawBackgroundColor(g_Speedo[12], 255);
    TextDrawFont(g_Speedo[12], 1);
    TextDrawSetProportional(g_Speedo[12], 1);
    TextDrawSetShadow(g_Speedo[12], 0);

    g_Speedo[13] = TextDrawCreate(412.344360, 388.802062, "--------------------------------------~y~--------------------------------------~r~------------------");
    TextDrawLetterSize(g_Speedo[13], 0.188887, 1.500444);
    TextDrawAlignment(g_Speedo[13], 1);
    TextDrawColor(g_Speedo[13], -1378294017);
    TextDrawSetShadow(g_Speedo[13], 0);
    TextDrawSetOutline(g_Speedo[13], 0);
    TextDrawBackgroundColor(g_Speedo[13], 255);
    TextDrawFont(g_Speedo[13], 0);
    TextDrawSetProportional(g_Speedo[13], 1);
    TextDrawSetShadow(g_Speedo[13], 0);

    g_Speedo[14] = TextDrawCreate(417.025695, 367.752471, "0             20             40             60             80            100____________120____________140____________160____________180_________200");
    TextDrawLetterSize(g_Speedo[14], 0.099007, 1.053754);
    TextDrawAlignment(g_Speedo[14], 1);
    TextDrawColor(g_Speedo[14], -1);
    TextDrawSetShadow(g_Speedo[14], 0);
    TextDrawSetOutline(g_Speedo[14], 0);
    TextDrawBackgroundColor(g_Speedo[14], 255);
    TextDrawFont(g_Speedo[14], 2);
    TextDrawSetProportional(g_Speedo[14], 1);
    TextDrawSetShadow(g_Speedo[14], 0);

    g_Speedo[15] = TextDrawCreate(602.888793, 330.425048, "_");
    TextDrawLetterSize(g_Speedo[15], -0.059555, 1.460620);
    TextDrawTextSize(g_Speedo[15], 611.970031, 0.000000);
    TextDrawAlignment(g_Speedo[15], 1);
    TextDrawColor(g_Speedo[15], -1);
    TextDrawUseBox(g_Speedo[15], 1);
    TextDrawBoxColor(g_Speedo[15], 50);
    TextDrawSetShadow(g_Speedo[15], 0);
    TextDrawSetOutline(g_Speedo[15], 0);
    TextDrawBackgroundColor(g_Speedo[15], 255);
    TextDrawFont(g_Speedo[15], 1);
    TextDrawSetProportional(g_Speedo[15], 1);
    TextDrawSetShadow(g_Speedo[15], 0);

    g_Speedo[16] = TextDrawCreate(416.050964, 347.751831, "I    I    I    I    I    I    I    I    I    I    I    I    I    I    I    I    I    I    I    I____I");
    TextDrawLetterSize(g_Speedo[16], 0.147055, 2.471087);
    TextDrawAlignment(g_Speedo[16], 1);
    TextDrawColor(g_Speedo[16], -1);
    TextDrawSetShadow(g_Speedo[16], 0);
    TextDrawSetOutline(g_Speedo[16], 0);
    TextDrawBackgroundColor(g_Speedo[16], 255);
    TextDrawFont(g_Speedo[16], 1);
    TextDrawSetProportional(g_Speedo[16], 1);
    TextDrawSetShadow(g_Speedo[16], 0);

    g_Speedo[17] = TextDrawCreate(416.849334, 350.782257, "IIIII IIIII IIIII IIIII IIIII IIIII IIIII IIIII IIIII IIIII IIIII IIIII IIIII IIIII IIIII IIIIIIIIIIIIIIIIIIIIIIIIIIIIII");
    TextDrawLetterSize(g_Speedo[17], 0.150943, 1.216711);
    TextDrawAlignment(g_Speedo[17], 1);
    TextDrawColor(g_Speedo[17], -1);
    TextDrawSetShadow(g_Speedo[17], 0);
    TextDrawSetOutline(g_Speedo[17], 0);
    TextDrawBackgroundColor(g_Speedo[17], 255);
    TextDrawFont(g_Speedo[17], 1);
    TextDrawSetProportional(g_Speedo[17], 1);
    TextDrawSetShadow(g_Speedo[17], 0);

    print("  -> XSpeedo has been loaded. Author: XeonMaster");
    return 1;
}

public OnFilterScriptExit()
{
    for(new i = 0; i < GetMaxPlayers(); i++) 
    {
        if(IsPlayerConnected(i)) 
        {
            PlayerTextDraw(i, false);
        }
    }
    for(new i = 0; i < 18; i++) TextDrawDestroy(g_Speedo[i]);
    print("  -> XSpeedo has been unloaded. Author: XeonMaster");
    return 1;
}

public OnPlayerConnect(playerid)
{
    Gear[playerid] = "P";
    PlayerTextDraw(playerid, true);
    return 1;
}

public OnPlayerDisconnect(playerid)
{
    PlayerTextDraw(playerid, false);
    for(new i = 0; i < 18; i++) TextDrawHideForPlayer(playerid, g_Speedo[i]);
    return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
    if(newstate == PLAYER_STATE_DRIVER)
    {
        for(new i = 0; i < 4; i++) PlayerTextDrawShow(playerid, p_Speedo[playerid][i]);
        for(new i = 0; i < 18; i++) TextDrawShowForPlayer(playerid, g_Speedo[i]);
    }
    else
    {
        for(new i = 0; i < 4; i++) PlayerTextDrawHide(playerid, p_Speedo[playerid][i]);
        for(new i = 0; i < 18; i++) TextDrawHideForPlayer(playerid, g_Speedo[i]);
    }
    return 1;
}

public OnPlayerUpdate(playerid)
{
    if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return 1;

    new speed;
    speed = GetPlayerSpeed(playerid);

    if(speed == 0)
    {
        Gear[playerid] = "P";

        PlayerTextDrawDestroy(playerid, p_Speedo[playerid][3]);
        p_Speedo[playerid][3] = CreatePlayerTextDraw(playerid, 413.444549, 375.456115, "hud:arrow");
    }
    else
    {
        if(speed > 0) Gear[playerid] = "D";
        if(speed > 200) speed = 205; 
        if(IsVehicleDrivingBackwards(GetPlayerVehicleID(playerid))) Gear[playerid] = "R";

        PlayerTextDrawDestroy(playerid, p_Speedo[playerid][3]);
        p_Speedo[playerid][3] = CreatePlayerTextDraw(playerid, 414+speed, 375.456115, "hud:arrow");
    }

    PlayerTextDrawLetterSize(playerid, p_Speedo[playerid][3], 0.000000, 0.000000);
    PlayerTextDrawTextSize(playerid, p_Speedo[playerid][3], 8.000000, 32.039978);
    PlayerTextDrawAlignment(playerid, p_Speedo[playerid][3], 1);
    PlayerTextDrawColor(playerid, p_Speedo[playerid][3], -1378294017);
    PlayerTextDrawSetShadow(playerid, p_Speedo[playerid][3], 0);
    PlayerTextDrawSetOutline(playerid, p_Speedo[playerid][3], 0);
    PlayerTextDrawBackgroundColor(playerid, p_Speedo[playerid][3], 255);
    PlayerTextDrawFont(playerid, p_Speedo[playerid][3], 4);
    PlayerTextDrawSetProportional(playerid, p_Speedo[playerid][3], 0);
    PlayerTextDrawSetShadow(playerid, p_Speedo[playerid][3], 0);
    PlayerTextDrawShow(playerid, p_Speedo[playerid][3]);

    PlayerTextDrawSetString(playerid, p_Speedo[playerid][2], Gear[playerid]);

    new str[6];
    format(str, sizeof(str), "%04d", speed);
    PlayerTextDrawSetString(playerid, p_Speedo[playerid][1], str);

    format(str, sizeof(str), "%05d", GetKilometers(GetPlayerVehicleID(playerid)));
    PlayerTextDrawSetString(playerid, p_Speedo[playerid][0], str);

    return 1;
}

PlayerTextDraw(playerid, bool:toggle)
{
    switch(toggle)
    {
        case true:
        {
            p_Speedo[playerid][0] = CreatePlayerTextDraw(playerid, 485.111145, 334.866699, "00000");
            PlayerTextDrawLetterSize(playerid, p_Speedo[playerid][0], 0.538221, 0.992708);
            PlayerTextDrawAlignment(playerid, p_Speedo[playerid][0], 1);
            PlayerTextDrawColor(playerid, p_Speedo[playerid][0], -1378294017);
            PlayerTextDrawSetShadow(playerid, p_Speedo[playerid][0], 0);
            PlayerTextDrawSetOutline(playerid, p_Speedo[playerid][0], 0);
            PlayerTextDrawBackgroundColor(playerid, p_Speedo[playerid][0], 255);
            PlayerTextDrawFont(playerid, p_Speedo[playerid][0], 0);
            PlayerTextDrawSetProportional(playerid, p_Speedo[playerid][0], 1);
            PlayerTextDrawSetShadow(playerid, p_Speedo[playerid][0], 0);

            p_Speedo[playerid][1] = CreatePlayerTextDraw(playerid, 423.017700, 333.711914, "0000");
            PlayerTextDrawLetterSize(playerid, p_Speedo[playerid][1], 0.200442, 0.972800);
            PlayerTextDrawAlignment(playerid, p_Speedo[playerid][1], 1);
            PlayerTextDrawColor(playerid, p_Speedo[playerid][1], -1);
            PlayerTextDrawSetShadow(playerid, p_Speedo[playerid][1], 0);
            PlayerTextDrawSetOutline(playerid, p_Speedo[playerid][1], 0);
            PlayerTextDrawBackgroundColor(playerid, p_Speedo[playerid][1], 255);
            PlayerTextDrawFont(playerid, p_Speedo[playerid][1], 2);
            PlayerTextDrawSetProportional(playerid, p_Speedo[playerid][1], 1);
            PlayerTextDrawSetShadow(playerid, p_Speedo[playerid][1], 0);

            p_Speedo[playerid][2] = CreatePlayerTextDraw(playerid, 604.573242, 333.711914, "P");
            PlayerTextDrawLetterSize(playerid, p_Speedo[playerid][2], 0.200442, 0.972800);
            PlayerTextDrawAlignment(playerid, p_Speedo[playerid][2], 1);
            PlayerTextDrawColor(playerid, p_Speedo[playerid][2], -1);
            PlayerTextDrawSetShadow(playerid, p_Speedo[playerid][2], 0);
            PlayerTextDrawSetOutline(playerid, p_Speedo[playerid][2], 0);
            PlayerTextDrawBackgroundColor(playerid, p_Speedo[playerid][2], 255);
            PlayerTextDrawFont(playerid, p_Speedo[playerid][2], 2);
            PlayerTextDrawSetProportional(playerid, p_Speedo[playerid][2], 1);
            PlayerTextDrawSetShadow(playerid, p_Speedo[playerid][2], 0);

            p_Speedo[playerid][3] = CreatePlayerTextDraw(playerid, 413.444549, 375.456115, "hud:arrow");
            PlayerTextDrawLetterSize(playerid, p_Speedo[playerid][3], 0.000000, 0.000000);
            PlayerTextDrawTextSize(playerid, p_Speedo[playerid][3], 8.000000, 32.039978);
            PlayerTextDrawAlignment(playerid, p_Speedo[playerid][3], 1);
            PlayerTextDrawColor(playerid, p_Speedo[playerid][3], -1378294017);
            PlayerTextDrawSetShadow(playerid, p_Speedo[playerid][3], 0);
            PlayerTextDrawSetOutline(playerid, p_Speedo[playerid][3], 0);
            PlayerTextDrawBackgroundColor(playerid, p_Speedo[playerid][3], 255);
            PlayerTextDrawFont(playerid, p_Speedo[playerid][3], 4);
            PlayerTextDrawSetProportional(playerid, p_Speedo[playerid][3], 0);
            PlayerTextDrawSetShadow(playerid, p_Speedo[playerid][3], 0);
        }
        case false: for(new i = 0; i != 4; i++) PlayerTextDrawDestroy(playerid, p_Speedo[playerid][i]);
    }
    return 1;
}

IsVehicleDrivingBackwards(vehicleid) // By Kar
{
    new Float:Float[3];
    if(GetVehicleVelocity(vehicleid, Float[1], Float[2], Float[0]))
    {
        GetVehicleZAngle(vehicleid, Float[0]);
        if(Float[0] < 90)
        {
            if(Float[1] > 0 && Float[2] < 0) return true;
        }
        else if(Float[0] < 180)
        {
            if(Float[1] > 0 && Float[2] > 0) return true;
        }
        else if(Float[0] < 270)
        {
            if(Float[1] < 0 && Float[2] > 0) return true;
        }
        else if(Float[1] < 0 && Float[2] < 0) return true;
    }
    return false;
}

GetPlayerSpeed(playerid) // By Michael@Belgium
{
    new Float:ST[4];
    if(IsPlayerInAnyVehicle(playerid))
    GetVehicleVelocity(GetPlayerVehicleID(playerid),ST[0],ST[1],ST[2]);
    else GetPlayerVelocity(playerid,ST[0],ST[1],ST[2]);
    ST[3] = floatsqroot(floatpower(floatabs(ST[0]), 2.0) + floatpower(floatabs(ST[1]), 2.0) + floatpower(floatabs(ST[2]), 2.0)) * 179.28625;
    return floatround(ST[3]);
}
