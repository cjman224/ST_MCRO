/*
	ADB Libraray Ver 0.5

	Copyright (c) 2016 by �ٶ�ó�� @Tailstar

	ADB(Android Debug Bridge)�� ���� �ٷ������ ���̺귯��
	ADB ȯ�ἳ�� �� �ʱ�ȭ�� ����ϴ� ��ŭ, adb devices ���� adb ����� ���� ������� �ʴ´�
	
	�����ϴ� ���÷��̾�
		���ϸ��
		�������
		�̹�
		�콺
		��罺��

	PlayerObject Member
		type  : ���÷��̾� ����
		title : ���÷��̾� â�̸�
		clone : ���÷��̾� �ν��Ͻ�
		ip    : ADB ������ ���� IP
		port  : ADB ������ ���� Port
		path  : ���÷��̾� ��ġ���
		adb   : ���÷��̾��� ���� ADB
		run   : �ش� ���÷��̾ �����ϱ� ���� ��ɾ�

	PlayerObject GetPlayer(WinTitle, WinText="", ExcludeTitle="", ExcludeText="")
		�־��� WinTitle, WinText, ExcludeTitle, ExcludeText �� �������
		PlayerObject Ÿ���� �ش� �������� ���÷��̾� ������ �����´�.
		SetTitleMatchMode �� ���� �����츦 ã�� ����� �ٲ��.

	PlayerObject[] GetPlayerList()
		���� ������ ��� �����츦 ��ĵ�Ͽ� �����ϴ� ���÷��̾ ������
		PlayerObject Ÿ���� �迭�� ������ �����´�.



	Version History
		2016/03/21 v0.1 - Initial Release
		2016/03/23 v0.2 - Fix XML Parsing
		2016/03/28 v0.3 - Add .exe for default
		2016/03/30 v0.4 - Support NOX Single Instance / Add "clone" Member
		2016/04/01 v0.5 - Fix _GetNox missed return value
*/


PlayerInfo := {Genymotion: {cmd: "Player.exe", adb: "adb.exe", func: Func("_GetGeny")}
			,Windroye    : {cmd: "Windroye.exe", adb: "adb.exe", func: Func("_GetWind")}
			,Memu        : {cmd: "Memu.exe", adb: "adb.exe", func: Func("_GetMemu")}
			,Nox         : {cmd: "Nox.exe", adb: "nox_adb.exe", func: Func("_GetNox")}
			,Bluestack   : {cmd: "HD-Frontend.exe", adb: "hd-adb.exe", func: Func("_GetBstk")}}

/*
	SUB FUNCTION
*/

_GetGeny(Dir, WinTitle)
{
	StringSplit, WordArray, WinTitle, %A_Space%
	if (WordArray1 != "Genymotion" or WordArray2 != "for")
		Return ""

	RegExMatch(WinTitle, "use - (.*) \(", Title)

	ip  := WordArray%WordArray0%
	obj := {type: "Genymotion", title: WinTitle, clone: Title1, ip: ip, port: "5555", run: "--vm-name """ Title1 """"}

	Return obj
}

_GetWind(Dir, WinTitle)
{
	RegRead, WindDataPath, HKLM, SOFTWARE\Windroye, DataDir
	Conf := WindDataPath "\config\MutiConfig.xml"
	if (!FileExist(Conf))
		Return ""

	FileRead, WindConfig, %Conf%
	StringGetPos, pos, WindConfig, <name>%WinTitle%</name>
	if (pos < 0)
		Return ""

	pos += StrLen(WinTitle) + 13
	RegExMatch(WindConfig, "<vdiPath>([^`n]*)</vdiPath>", WindVpath, pos)
	RegExMatch(WindConfig, "<vbName>([^`n]*)</vbName>", WindVname, pos)

	Conf := WindVpath1 "\" WindVname1 "\" WindVname1 ".windroye"
	if (!FileExist(Conf))
		Return ""
	
	FileRead, WindMulti, %Conf%
	RegExMatch(WindMulti, "hostport=\C([0-9]*)\C([^`n]*)guestport=\C5555", WindPort)

	obj := {type: "Windroye", title: WinTitle, clone: WinTitle, ip: "127.0.0.1", port: WindPort1, run: WindVName1 " " WindVpath1 " " WinTitle}

	Return obj
}

_GetMemu(Dir, WinTitle)
{
	StringSplit, WordArray, WinTitle, %A_Space%
	Title := WordArray4
	Conf  := Dir "\MemuHyperv VMs\" Title "\" Title ".memu"
	if (!FileExist(Conf))
		Return ""

	FileRead, MemuConfig, %Conf%
	RegExMatch(MemuConfig, "hostport=\C([0-9]*)\C([^`n]*)guestport=\C5555", MemuPort)

	obj := {type: "Memu", title: WinTitle, clone: Title, ip: "127.0.0.1", port: MemuPort1, run: Title}

	Return obj
}

_GetNox(Dir, WinTitle)
{
	ConfDir := A_AppData "," A_AppData "\..,C:\Users\" A_UserName "\AppData"
	loop, parse, ConfDir, `,
	{
		Conf := A_LoopField "\Local\multiplayermanager\multiplayer.xml"
		if (FileExist(Conf))
			Break
		else Conf := ""
	}
	if (Conf)
	{
		Clone := ""
		Enc   := A_FileEncoding 
		FileEncoding, UTF-8
		loop, read, %Conf%
		{
			if (InStr(A_LoopReadLine, "name=""" WinTitle """"))
			{
				RegExMatch(A_LoopReadLine, "id=\CNox_([0-9]*)\C", Clone)
				Break
			}
		}
		FileEncoding, %Enc%
		if (!Clone)
			Return ""
	}
	else if (WinTitle = "�콺 �ȵ���̵� ���÷��̾�" or WinTitle = "Nox App Player")
	{
		Clone1 := "0"
	}
	else Return ""

	NoxClone := (Clone1 = "0") ? "nox" : "Nox_" Clone1
	Conf := Dir "\BignoxVMS\" NoxClone "\" NoxClone ".vbox"
	if (!FileExist(Conf))
		Return ""

	FileRead, NoxConfig, %Conf%
	RegExMatch(NoxConfig, "hostport=\C([0-9]*)\C([^`n]*)guestport=\C5555", NoxPort)

	obj := {type: "Nox", title: WinTitle, clone: NoxClone, ip: "127.0.0.1", port: NoxPort1, run: "-clone:" NoxClone}

	Return obj
}

_GetBstk(Dir, WinTitle)
{
	if (WinTitle != "BlueStacks App Player")
		Return ""

	obj := {type: "Bluestack", title: WinTitle, clone: "", ip: "127.0.0.1", port: "5555", run: "Android"}

	Return obj
}


/*
	MAIN FUNCTION
*/

GetPlayer(WinTitle, WinText="", ExcludeTitle="", ExcludeText="")
{
	global PlayerInfo
	
	case := A_StringCaseSense

	WinGet, Path, ProcessPath, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	if (!Path)
		Return ""

	obj := ""	
	StringCaseSense, Off
	SplitPath, Path, OutFileName, OutDir
	for key, val in PlayerInfo
	{
		if (OutFileName = val.cmd and (obj := val.func.call(OutDir, WinTitle)))
		{
			obj.path := OutDir
			obj.adb  := OutDir (key="Genymotion" ? "\tools\" : "\") val.adb
			obj.run  := OutDir "\" val.cmd " " obj.run
			Break
		}
	}
	StringCaseSense, %case%

	Return obj
}

GetPlayerList()
{
	obj   := []
	idx   := 0
	match := A_TitleMatchMode

	SetTitleMatchMode, 3
	WinGet, id, list
	Loop, %id%
	{
		wid := id%A_Index%
	    WinGetTitle, title, ahk_id %wid%
	    if (title and (player := GetPlayer(title)))
	    {
			obj[++idx] := player
		}
	}
	SetTitleMatchMode, %match%

	Return obj
}
