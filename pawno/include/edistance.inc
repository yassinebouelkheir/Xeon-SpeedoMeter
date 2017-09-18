///////////////////////////////////////////////////////////////////////////////////
//
//                                 |*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
//                         |*|          eDistance System     |*|
//                         |*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
//
//               =====================================
//                           INTRODUCTION
//               =====================================
//
//                       This allows you to check include
//                           as a vehicle traveled in meters,
//                               Kilometers or Miles.
//
//               =====================================
//                             NATIVES
//               =====================================
//
//                       native GetMeters(vehicleid);
//                       native GetKilometers(vehicleid);
//                       native GetMiles(vehicleid);
//                       native ResetMetersTraveled(vehicleid);
//
//               =====================================
//                      EXAMPLES (METHOD OF USE)
//               =====================================
//
//                    *-- | METERS TRAVELED | --*
//               format(string, sizeof(string), "This vehicle traveled %d Meters Traveled.", GetMeters(GetPlayerVehicleID(playerid)));
//               SendClientMessage(playerid, -1, string);
//
//                    *-- | KILOMETERS TRAVELED | --*
//               format(string, sizeof(string), "This vehicle traveled %s Kilometers Traveled.", GetKilometers(GetPlayerVehicleID(playerid)));
//               SendClientMessage(playerid, -1, string);
//
//                    *-- | MILES TRAVELED | --*
//               format(string, sizeof(string), "This vehicle traveled %s Miles Traveled.", GetMiles(GetPlayerVehicleID(playerid)));
//               SendClientMessage(playerid, -1, string);
//
//               =====================================
//                              CREDITS
//               =====================================
//
//                  * Include Built by EditPawn *
//       * BlueX Paulor and for helping me with some functions *
//        * Lordz tutorial by calling Functions and Callbacks *
//
//               =====================================
//                  BUGS, SUGGESTIONS AND QUESTIONS
//               =====================================
//
//                   Visit: http://forum.sa-mp.com
//
//
///////////////////////////////////////////////////////////////////////////////////

/* ----- INCLUDE ----- */
#include        a_samp

/* ----- VARS ----- */
new E@_R[MAX_VEHICLES] = 0,
        Float:v@_P[3],
        E@_Timer[MAX_PLAYERS]
        //E@_S[12]
    ;

/* ----- DEFINES ----- */
#define   GetMeters(%0)                      E@_R[%0]
#define   GetKilometers(%0)         (E@_R[%0] * 0.001)
#define   GetMiles(%0)                  (E@_R[%0] * 0.000621)
#define   ResetMetersTraveled(%0)    E@_R[%0] = 0;

/* ----- FORWARDS ----- */
forward E@_OnPlayerDisconnect(playerid, reason);
forward E@_OnPlayerStateChange(playerid, newstate, oldstate);
forward E@_At(playerid);

/* ----- CALLBACKS ----- */
public OnPlayerDisconnect(playerid, reason) {
        KillTimer(E@_Timer[playerid]);
        return CallLocalFunction("E@_OnPlayerDisconnect", "id", playerid, reason);
}

public OnPlayerExitVehicle(playerid, vehicleid) {
        KillTimer(E@_Timer[playerid]);
        return CallLocalFunction("E@_OnPlayerExitVehicle", "id", playerid, vehicleid);
}

public E@_At(playerid) {
    if(GetVehicleDistanceFromPoint(GetPlayerVehicleID(playerid), v@_P[0], v@_P[1], v@_P[2]) <= 100) {
            E@_R[GetPlayerVehicleID(playerid)] += floatround(GetVehicleDistanceFromPoint(GetPlayerVehicleID(playerid), v@_P[0], v@_P[1], v@_P[2]));
    }
    GetVehiclePos(GetPlayerVehicleID(playerid), v@_P[0], v@_P[1], v@_P[2]);
/*
        OBS: If you want to test, just abilite this part will appear and all forms of distance that the vehicle is running.

    new E@_Str[129];
    format(E@_Str, sizeof(E@_Str), "(%d) Meters - (%s) Kilometers - (%s) Miles", GetMeters(GetPlayerVehicleID(playerid)), GetKilometers(GetPlayerVehicleID(playerid)), GetMiles(GetPlayerVehicleID(playerid)));
    SendClientMessage(playerid, -1, E@_Str);
*/
}

public OnPlayerStateChange(playerid, newstate, oldstate) {
        if(oldstate == PLAYER_STATE_ONFOOT && newstate == PLAYER_STATE_DRIVER) {
            GetVehiclePos(GetPlayerVehicleID(playerid), v@_P[0], v@_P[1], v@_P[2]);
            E@_Timer[playerid] = SetTimerEx("E@_At", 1000, true, "i", playerid);
        }
        else if(oldstate == PLAYER_STATE_DRIVER && newstate == PLAYER_STATE_ONFOOT) KillTimer(E@_Timer[playerid]);
        return CallLocalFunction("E@_OnPlayerStateChange", "idd", playerid, newstate, oldstate);
}

/* ----- HOOKS ----- */
#if defined _ALS_OnPlayerDisconnect
    #undef OnPlayerDisconnect
#else
    #define _ALS_OnPlayerDisconnect
#endif
#define OnPlayerDisconnect E@_OnPlayerDisconnect

#if defined _ALS_OnPlayerStateChange
    #undef OnPlayerStateChange
#else
    #define _ALS_OnPlayerStateChange
#endif
#define OnPlayerStateChange E@_OnPlayerStateChange

#if defined _ALS_OnPlayerExitVehicle
        #undef OnPlayerExitVehicle
#endif
#define OnPlayerExitVehicle E@_OnPlayerExitVehicle

