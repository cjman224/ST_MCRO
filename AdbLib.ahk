/*
	ADB Libraray Ver 0.5

	Copyright (c) 2016 by 바람처럼 @Tailstar

	ADB(Android Debug Bridge)를 쉽게 다루기위한 라이브러리
	ADB 환결설정 및 초기화를 담당하는 만큼, adb devices 같은 adb 명령은 전혀 사용하지 않는다
	
	지원하는 앱플레이어
		지니모션
		윈드로이
		미뮤
		녹스
		블루스택

	PlayerObject Member
		type  : 앱플레이어 종류
		title : 앱플레이어 창이름
		clone : 앱플레이어 인스턴스
		ip    : ADB 연결을 위한 IP
		port  : ADB 연결을 위한 Port
		path  : 앱플레이어 설치경로
		adb   : 앱플레이어의 고유 ADB
		run   : 해당 앱플레이어를 실행하기 위한 명령어

	PlayerObject GetPlayer(WinTitle, WinText="", ExcludeTitle="", ExcludeText="")
		주어진 WinTitle, WinText, ExcludeTitle, ExcludeText 를 기반으로
		PlayerObject 타입의 해당 윈도우의 앱플레이어 정보를 가져온다.
		SetTitleMatchMode 에 따라 윈도우를 찾는 방식이 바뀐다.

	PlayerObject[] GetPlayerList()
		현재 열려진 모든 윈도우를 스캔하여 지원하는 앱플레이어가 있으면
		PlayerObject 타입의 배열로 정보를 가져온다.



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
	else if (WinTitle = "녹스 안드로이드 앱플레이어" or WinTitle = "Nox App Player")
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
