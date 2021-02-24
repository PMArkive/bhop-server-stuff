#include <sourcemod>
#include <sdktools>

public void OnPluginStart()
{
	HookEvent("weapon_reload", Event_SetAmmoToMax);
	HookEvent("weapon_fire_on_empty", Event_SetAmmoToMax);
	HookEvent("weapon_fire", Event_SetAmmoToMax);
}

public Action Event_SetAmmoToMax(Handle hEvent, const char[] sName, bool bDontBroadcast)
{
	int client = GetClientOfUserId(GetEventInt(hEvent, "userid"));
	int wep = GetEntPropEnt(client, Prop_Data, "m_hActiveWeapon");
	if (wep != -1)
	{
		int ammotype = GetEntProp(wep, Prop_Send, "m_iPrimaryAmmoType");
		if(ammotype != -1)
		{
			SetEntProp(client, Prop_Send, "m_iAmmo", 69, _, ammotype);
			SetEntProp(wep, Prop_Data, "m_iClip1", 70);
		}
	}
	return Plugin_Continue;
}
