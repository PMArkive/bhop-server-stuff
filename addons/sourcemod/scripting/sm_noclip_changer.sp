#include <sourcemod>

public void OnPluginStart()
{
	AddCommandListener(CommandListener_Noclip, "sm_noclip");
}

Action CommandListener_Noclip(int client, const char[] command, int argc)
{
	if (IsPlayerAlive(client) && argc < 1) {
		FakeClientCommand(client, "sm_noclipme");
		return Plugin_Stop;
	}
	return Plugin_Continue;
}
