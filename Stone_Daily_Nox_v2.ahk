#include AdbLib.ahk
#include Gdip_All.ahk
#include Gdip_ImageSearch.ahk
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#SingleInstance force
#Persistent
SetBatchLines, -1
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Gui, New,, Stone_Daily_Nox
Gui, +Resize 
Gui, Add, Text,, 일일퀘매크로 `n(by onlybell) 
Gui, Add, StatusBar,, 대기
Gui, Add, Button, x10 y40, &켜기
Gui, Add, Button, x50 y40, &재시작
Gui, Add, Button, x100 y40, &레이드
Gui, Add, Button, x150 y40, &레이드회수
Gui, Add, Button, x227 y40, &펫정리
Gui, Add, Button, x277 y40, &일일퀘스트
Gui, Add, Button, x350 y40, &투기부족퀘스트
Gui, Add, Button, x450 y40, &고기소모
Gui, Add, Button, x510 y40, &모험
Gui, Add, Button, x10 y70, &펫분양
Gui, Add, Button, x60 y70, &친구관리
Gui, Add, Button, x123 y70, &정령제단
Gui, Add, Button, x186 y70, &속동
Gui, Add, Button, x223 y70, &투기장
Gui, Add, Button, x273 y70, &부족
Gui, Add, Button, x309 y70, &퀘스트
Gui, Add, Button, x359 y70, &펫대전
Gui, Add, CheckBox, x150 y3 vOpt1, 1 cli
Gui, Add, CheckBox, x220 y3 vOpt2, 2 cli
Gui, Add, CheckBox, x150 y18 vOpt3, 3 cli
Gui, Add, CheckBox, x220 y18 vOpt4, 4 cli
Gui, Add, Edit, x10 y100 w600 r10 HwndhOut
Gui, Show, w620 x140

file := FileOpen("config.txt", "r")
if !IsObject(file)
{
	MsgBox config.txt파일을 읽을 수 없음.
	return
}

lineNum := 2
FileReadLine, Emu1, %A_ScriptDir%\config.txt, lineNum++
FileReadLine, Emu2, %A_ScriptDir%\config.txt, lineNum++
FileReadLine, Emu3, %A_ScriptDir%\config.txt, lineNum++
FileReadLine, Emu4, %A_ScriptDir%\config.txt, lineNum++
lineNum := lineNum+2
FileReadLine, toleranceJungStr, %A_ScriptDir%\config.txt, lineNum++
toleranceJung := toleranceJungStr
FileReadLine, diff1, %A_ScriptDir%\config.txt, lineNum++
FileReadLine, diff2, %A_ScriptDir%\config.txt, lineNum++
FileReadLine, diff3, %A_ScriptDir%\config.txt, lineNum++
FileReadLine, diff4, %A_ScriptDir%\config.txt, lineNum++
lineNum := lineNum+2
FileReadLine, toleranceSokStr, %A_ScriptDir%\config.txt, lineNum++
toleranceSok := toleranceSokStr
lineNum := lineNum+2
FileReadLine, battle1Str, %A_ScriptDir%\config.txt, lineNum++
FileReadLine, battle2Str, %A_ScriptDir%\config.txt, lineNum++
FileReadLine, battle3Str, %A_ScriptDir%\config.txt, lineNum++
FileReadLine, battle4Str, %A_ScriptDir%\config.txt, lineNum++
battle1 := battle1Str
battle2 := battle2Str
battle3 := battle3Str
battle4 := battle4Str
lineNum := lineNum+2
FileReadLine, t1, %A_ScriptDir%\config.txt, lineNum++
FileReadLine, t2, %A_ScriptDir%\config.txt, lineNum++
FileReadLine, t3, %A_ScriptDir%\config.txt, lineNum++
FileReadLine, t4, %A_ScriptDir%\config.txt, lineNum++
lineNum := lineNum+2
FileReadLine, mh1, %A_ScriptDir%\config.txt, lineNum++
FileReadLine, mh2, %A_ScriptDir%\config.txt, lineNum++
FileReadLine, mh3, %A_ScriptDir%\config.txt, lineNum++
FileReadLine, mh4, %A_ScriptDir%\config.txt, lineNum++


StringSplit, diff1arr, diff1, `,
StringSplit, diff2arr, diff2, `,
StringSplit, diff3arr, diff3, `,
StringSplit, diff4arr, diff4, `,

StringSplit, t1arr, t1, `,
StringSplit, t2arr, t2, `,
StringSplit, t3arr, t3, `,
StringSplit, t4arr, t4, `,

StringSplit, mh1arr, mh1, `,
StringSplit, mh2arr, mh2, `,
StringSplit, mh3arr, mh3, `,
StringSplit, mh4arr, mh4, `,

JRdifficulty := Object()
JRdifficulty[1,1] := diff1arr1
JRdifficulty[1,2] := diff1arr2
JRdifficulty[1,3] := diff1arr3
JRdifficulty[1,4] := diff1arr4
JRdifficulty[2,1] := diff2arr1
JRdifficulty[2,2] := diff2arr2
JRdifficulty[2,3] := diff2arr3
JRdifficulty[2,4] := diff2arr4
JRdifficulty[3,1] := diff3arr1
JRdifficulty[3,2] := diff3arr2
JRdifficulty[3,3] := diff3arr3
JRdifficulty[3,4] := diff3arr4
JRdifficulty[4,1] := diff4arr1
JRdifficulty[4,2] := diff4arr2
JRdifficulty[4,3] := diff4arr3
JRdifficulty[4,4] := diff4arr4

GogiT := Object()
GogiT[1,1] := t1arr1
GogiT[1,2] := t1arr2
GogiT[1,3] := t1arr3
GogiT[1,4] := t1arr4
GogiT[1,5] := t1arr5
GogiT[2,1] := t2arr1
GogiT[2,2] := t2arr2
GogiT[2,3] := t2arr3
GogiT[2,4] := t2arr4
GogiT[2,5] := t2arr5
GogiT[3,1] := t3arr1
GogiT[3,2] := t3arr2
GogiT[3,3] := t3arr3
GogiT[3,4] := t3arr4
GogiT[3,5] := t3arr5
GogiT[4,1] := t4arr1
GogiT[4,2] := t4arr2
GogiT[4,3] := t4arr3
GogiT[4,4] := t4arr4
GogiT[4,5] := t4arr5

MohumP := Object()
MohumP[1,1] := mh1arr1
MohumP[1,2] := mh1arr2
MohumP[1,3] := mh1arr3
MohumP[1,4] := mh1arr4
MohumP[2,1] := mh1arr1
MohumP[2,2] := mh1arr2
MohumP[2,3] := mh1arr3
MohumP[2,4] := mh1arr4
MohumP[3,1] := mh1arr1
MohumP[3,2] := mh1arr2
MohumP[3,3] := mh1arr3
MohumP[3,4] := mh1arr4
MohumP[4,1] := mh1arr1
MohumP[4,2] := mh1arr2
MohumP[4,3] := mh1arr3
MohumP[4,4] := mh1arr4


isdailyDone := false
is1gogiDone := false
is2gogiDone := false
is3gogiDone := false
is4gogiDone := false
is5gogiDone := false
isHotDone := false
isPvPDone := false

obj1 := GetPlayer(Emu1)
printV(Emu1 . " 정보 받아옴.")
obj2 := GetPlayer(Emu2)
printV(Emu2 . " 정보 받아옴.")
obj3 := GetPlayer(Emu3)
printV(Emu3 . " 정보 받아옴.")
obj4 := GetPlayer(Emu4)
printV(Emu4 . " 정보 받아옴.")

dev1IP = % obj1.ip . ":" . obj1.port
dev2IP = % obj2.ip . ":" . obj2.port
dev3IP = % obj3.ip . ":" . obj3.port
dev4IP = % obj4.ip . ":" . obj4.port

Return

GuiClose:
Gui, Destroy
ExitApp

Button켜기:
	TurnOn(1)
	TurnOn(2)
	TurnOn(3)
	TurnOn(4)
return

Button재시작:
	Reload
return

Button레이드:
	Raid(1)
	Raid(2)
	Raid(3)
	Raid(4)
return

Button레이드회수:
	RaidGet(1)
	RaidGet(2)
	RaidGet(3)
	RaidGet(4)
return

Button펫정리:
	PetManage(1)
	PetManage(2)
	PetManage(3)
	PetManage(4)
return

Button일일퀘스트:
	DailyQuest(1)
	DailyQuest(2)
	DailyQuest(3)
	DailyQuest(4)
return

Button투기부족퀘스트:
	DailyQuest2(1)
	DailyQuest2(2)
	DailyQuest2(3)
	DailyQuest2(4)
return

Button고기소모:
	GogiSpend(1)
	GogiSpend(2)
	GogiSpend(3)
	GogiSpend(4)
return

Button모험:
	Mohum(1)
	Mohum(2)
	Mohum(3)
	Mohum(4)
return

Button펫분양:
	PetDon(1)
	PetDon(2)
	PetDon(3)
	PetDon(4)
return

Button친구관리:
	Friend(1)
	Friend(2)
	Friend(3)
	Friend(4)
return

Button정령제단:
	JungRyung(1)
	JungRyung(2)
	JungRyung(3)
	JungRyung(4)
return

Button속동:
	SokDong(1)
	SokDong(2)
	SokDong(3)
	SokDong(4)	
return


Button투기장:
	if(battle1 = 1) 
		PvP(1)
	if(battle2 = 1) 
		PvP(2)
	if(battle3 = 1)
		PvP(3)
	if(battle4 = 1)
		PvP(4)
return

Button부족:
	Buzok(1)
	Buzok(2)
	Buzok(3)
	Buzok(4)
return

Button퀘스트:
	Quest(1)
	Quest(2)
	Quest(3)
	Quest(4)
return

Button펫대전:
	PetPvP(1)
	PetPvP(2)
	PetPvP(3)
	PetPvP(4)
return


TurnOn(clie)
{
	;~ global vx, vy
	;~ if (CheckOpt(clie) < 0) {
		;~ printVclie("체크해제 되어있음", clie)
		;~ SB_SetText("대기")
		;~ return
	;~ }
	;~ SB_SetText("켜기 수행중")
	;~ r := WaitNUntilImgShow("Image\turnon\icon.bmp", clie, 3) 
	;~ if (r<0) {
		;~ printVclie("켜기-실패", clie)
		;~ SB_SetText("대기")
		;~ return
	;~ }
	;~ adbClick(vx+2, vy+36, clie)
	;~ printVclie("아이콘 클릭", clie)
	
	;~ printVclie("공지사항 기다리는 중", clie)
	;~ sleep 10000
	;~ r := WaitNUntilImgShow("Image\turnon\announce.bmp", clie, 100) ;공지사항 - 노란 엑스표시
	;~ printVclie("공지사항 확인 완료", clie)
	;~ if(r<0) {
		;~ printVclie("켜기-실패", clie)
		;~ SB_SetText("대기")
		;~ return
	;~ }
		
	;~ adbClick(775, 55, clie)
	;~ printVclie("이벤트 스킵 중", clie)
	;~ WaitUntilImgShow_Click("Image\turnon\titleScr.bmp", 30, 490, clie) ; 화면을 터치하세요 발견
	;~ printVclie("화면을 터치하세요 클릭", clie)
	;~ adbClick(47, 394, clie)
	;~ sleep 100
	;~ adbClick(47, 394, clie)
	
	;~ printVclie("출첵 화면 기다려봄", clie)
	;~ sleep 5000
	;~ r := WaitNUntilImgShow("Image\turnon\chulcheck.bmp", clie, 8) ; 출첵메시지
	;~ if (r = 1) {
		;~ printVclie("출첵 화면 뜸. 처리중", clie)
		;~ adbClick(400, 400, clie)
		;~ WaitNUntilImgShow("Image\turnon\chulcheckMenu.bmp", clie, 5) ; 출첵메시지
		;~ adbClick(740, 97, clie)
		;~ printVclie("출첵 화면 처리 완료", clie)
		;~ sleep 2000
	;~ }
	
	;~ printVclie("채팅창 열기", clie)
	;~ adbClick(13, 268, clie) ; ... 클릭
	;~ r := WaitNUntilImgShow("Image\chat\init.bmp",clie,5) ; 채팅창 켜기
	;~ printVclie("채팅창 열기 완료", clie)
	;~ r := WaitNUntilImgShow("Image\chat\chat.bmp",clie, 2) ; 채팅창 꺼져있나?
	;~ if(r=1) {
		;~ printVclie("음소거 클릭", clie)
		;~ adbClick(200, 482, clie) ; 음소거
		;~ sleep 200
	;~ }
	;~ else {
		;~ printVclie("이미 음소거 되어있음", clie)
	;~ }
	;~ printVclie("채팅창 닫기", clie)
	;~ adbClick(354, 78, clie) ; 챗창닫기

	;~ printVclie("켜기 완료", clie)
	;~ adbSwipe(700, 300, 50, 300, 50, clie) ;오른쪽으로 화면이동
	;~ SB_SetText("대기")
	;~ return
}

Raid(clie)
{
	global isHotDone, isdailyDone, is1gogiDone, is2gogiDone, is3gogiDone,is4gogiDone, is5gogiDone, isPvPDone
	global GogiT
RaidStart:
	if (CheckOpt(clie) < 0) {
		printVclie("체크해제 되어있음. 대기로 전환.", clie)
		SB_SetText("대기")
		return
	}
	SB_SetText("레이드 수행중")
	printVclie("레이드 시작", clie)
	
	r:=ImgFind("Image\raid\raidStore.bmp",clie,1,1000)
	if(r<0) {
		SetInit(clie)
		adbSwipe(700, 300, 50, 300, 50, clie) ;오른쪽으로 화면이동
		sleep 1000
		adbClick(202, 149, clie) ;입장
		r:=ImgFind("Image\raid\raidStore.bmp",clie,5,300)
	}
	sleep 3000
  	adbClick(80, 480, clie) ; 전체 누르고
	sleep 300
  	adbClick(76, 386, clie) ; 신규로변경
	
	r:=ImgFind("Image\raid\raidStore.bmp",clie,1,1000)
	if(r<0) {
		printVclie("레이드 기본화면 입장 Error. 레이드 처음부터 다시 수행.", clie)
		Goto, RaidStart
	}
	
	raidcheck := 0
	while(1) {
		FormatTime, curH, H, H
		if(curH = 12 || curH = 18 || curH = 21) {
			if(!isHotDone) {
				adbClick(31, 61, clie)
				printVclie("고기 수거",clie)
				SetInit(clie)
				isHotDone := true
				PetDon(clie)
				Quest(clie)
				RaidGet(clie)
				Goto, RaidStart
			}
		}
		if( (curH != 12  && curH != 18 && curH != 21) && isHotDone  ) {
			isHotDone := false
		}
		
		if(curH = 0)
		{
			if(!isdailyDone) {
				adbClick(31, 61, clie)
				SetInit(clie)
				isdailyDone := true
				DailyQuest(clie)
				Goto, RaidStart
			}
		}
		if(curH != 0 &&  isdailyDone) {
			isdailyDone := false
		}
		
		if(curH = GogiT[clie,1]) {
			if(!is1gogiDone) {
				adbClick(31, 61, clie)
				printVclie(GogiT[clie,1] . "시 고기소모",clie)
				SetInit(clie)
				is1gogiDone := true
				PetPvP(clie)
				PetManage(clie)
				Buzok(clie)
				PvP(clie)
				Friend(clie)
				GogiSpend(clie)
				Quest(clie)
				PetPvP(clie)
				Goto, RaidStart
			}
		}
		else if(curH = GogiT[clie,2]) {
			if(!is2gogiDone) {
				adbClick(31, 61, clie)
				printVclie(GogiT[clie,2] . "시 고기소모",clie)
				SetInit(clie)
				is2gogiDone := true
				PetPvP(clie)
				PvP(clie)
				Friend(clie)
				GogiSpend(clie)
				Quest(clie)
				PetPvP(clie)
				Goto, RaidStart
			}
		}
		else if(curH = GogiT[clie,3]) {
			if(!is3gogiDone) {
				adbClick(31, 61, clie)
				printVclie(GogiT[clie,3] . "시 고기소모",clie)
				SetInit(clie)
				is3gogiDone := true
				PetPvP(clie)
				PetManage(clie)
				PvP(clie)
				Friend(clie)
				GogiSpend(clie)
				Quest(clie)
				PetPvP(clie)
				Goto, RaidStart
			}
		}		
		else if(curH = GogiT[clie,4]) {
			if(!is4gogiDone) {
				adbClick(31, 61, clie)
				printVclie(GogiT[clie,4] . "시 고기소모",clie)
				SetInit(clie)
				is4gogiDone := true
				PetPvP(clie)
				Buzok(clie)
				PvP(clie)
				Friend(clie)
				GogiSpend(clie)
				Quest(clie)
				PetPvP(clie)
				Goto, RaidStart
			}
		}
		else if(curH = GogiT[clie,5]) {
			if(!is5gogiDone) {
				adbClick(31, 61, clie)
				printVclie(GogiT[clie,5] . "시 고기소모",clie)
				SetInit(clie)
				is5gogiDone := true
				PetManage(clie)
				Buzok(clie)
				PvP(clie)
				Friend(clie)
				GogiSpend(clie)
				Quest(clie)
				Goto, RaidStart
			}
		}		
		if( (curH != GogiT[clie,1]) && is1gogiDone) {
			is1gogiDone := false
		}
		if( (curH != GogiT[clie,2]) && is2gogiDone) {
			is2gogiDone := false
		}
		if( (curH != GogiT[clie,3]) && is3gogiDone) {
			is3gogiDone := false
		}
		if( (curH != GogiT[clie,4]) && is4gogiDone) {
			is4gogiDone := false
		}
		if( (curH != GogiT[clie,5]) && is5gogiDone) {
			is5gogiDone := false
		}
	
	
	
		raidcheck := raidcheck+1
		if(raidcheck > 500) {
			raidcheck := 0
			r:=ImgFind("Image\raid\raidStore.bmp",clie,1,1000) ; 에러 점검
			if(r<0) {
				printVclie("레이드 무한반복 Error. 레이드 처음부터 다시 수행.", clie)
				Goto, RaidStart
			}
		}
		adbClick(157, 485, clie) ; 새로고침
		adbClick(443, 147, clie) ; 맨위목록 클릭
		adbClick(616, 439, clie) ; >> 클릭
		adbClick(445, 458, clie) ; 소탕 클릭
		r:=ImgFind("Image\raid\charge.bmp",clie,1,1000)
		if(r>0) {
			SetInit(clie)
			Friend(clie)
			Goto, RaidStart
		}
		
		r:=ImgFind("Image\raid\raidStore.bmp",clie,1,1000) ; 아무 이벤트도 발생하지 않음
		if(r>0) {
			continue
		}
		else if(r<0) { ; 신규 레이드 발견 
			printVclie("신규 레이드 발견", clie)
			r:=Img3Find("Image\raid\use.bmp","Image\raid\charge.bmp","Image\raid\already.bmp",clie,2,1000)
			if(r=1) {
				adbClick(337, 351, clie) ; 취소 클릭
				r:=ImgFind("Image\raid\auto.bmp",clie,10,100) ; 자동배치 대기
				if(r>0) {
					adbClick(250, 379, clie) ; 자동배치 클릭
					sleep 200
					adbClick(445, 458, clie) ; 소탕 클릭
				}
				else if(r<0) {
					printVclie("Error. 자동배치 누르고 소탕해야하는데 뭔가 에러 발생. 다시 시작", clie)
					Goto, RaidStart
				}
				
			}
			else if(r=2) {
				SetInit(clie)
				Friend(clie)
				Goto, RaidStart
			}
			else if(r=3) {
				adbClick(400, 351, clie) ;획인 클릭
				sleep 1000
				continue
			}
	
			
			r := ImgFind("Image\raid\confirm.bmp", clie,10,500) ; 기다리기
			if (r<0) {
				printVclie("Error. 소탕 눌렀으므로 확인이 떠야하는데 안뜸. 다시 시작.", clie)
				Goto, RaidStart
			}
			adbClick(547, 389, clie) ; 확인 클릭
			r := ImgFind("Image\raid\fail.bmp", clie,3,500) ; 실패한화면인지 확인
			if (r>0) {
				adbClick(31, 62, clie) ; 뒤로가기 클릭
				r := ImgFind("Image\raid\goback.bmp", clie,3,1000) ; 확인 찾기
				adbClick(739, 89, clie) ; x클릭
				sleep 200
				adbClick(739, 89, clie) ; x클릭
			}	
		}
	}
}

RaidGet(clie)
{
RaidGetStart:
	if (CheckOpt(clie) < 0) {
		printVclie("체크해제 되어있음. 대기로 전환.", clie)
		SB_SetText("대기")
		return
	}
	SB_SetText("레이드 보상 수거 수행중")
	printVclie("레이드 보상 수거 시작", clie)
	r:=ImgFind("Image\raid\raidStore.bmp",clie,1,1000)
	if(r<0) {
		SetInit(clie)
		adbSwipe(700, 300, 50, 300, 50, clie) ;오른쪽으로 화면이동
		adbSwipe(700, 300, 50, 300, 50, clie) ;오른쪽으로 화면이동
		sleep 1000
		adbClick(202, 149, clie) ;입장
		r:=ImgFind("Image\raid\raidStore.bmp",clie,5,300)
	}
  	adbClick(80, 480, clie) ; 전체 누르고
	sleep 300
  	adbClick(74, 455, clie) ; 완료로변경
	
FindNewAward:
	r:=ImgFind("Image\raid\raidStore.bmp",clie,5,300)
	sleep 1000
	adbClick(707, 149, clie) ; 일단 클릭해봄
	r:=ImgFind("Image\raid\goback.bmp",clie,5,300)
	if (r<0) {
		adbClick(31, 62, clie) ; 뒤로가기
		SB_SetText("대기")
		r := ImgFind("Image\petdon\icon.bmp",clie,5,1000)
		return
	}
	adbClick(618, 442, clie) ; 보상받기
	sleep 500
	adbClick(402, 286, clie) ; 상자클릭
	r:=ImgFind("Image\raid\confirm2.bmp",clie,10,500)
	if(r<0) {
		printVclie("Error. 상자를 눌렀는데 확인이 안됨. 처음부터 다시 시작.", clie)
		Goto, RaidGetStart
	}
	adbClick(400, 429, clie) ; 확인
	Goto, FindNewAward
}


PetManage(clie)
{
	if (CheckOpt(clie) < 0) {
		printVclie("체크해제 되어있음. 대기로 전환.", clie)
		SB_SetText("대기")
		return
	}
	SB_SetText("펫관리 수행중")
	printVclie("펫관리 시작", clie)
	SetInit(clie)
	
	adbClick(589, 469, clie) ; 인벤토리 클릭
	r:=ImgFind("Image\petman\init.bmp",clie,10,500)
	if(r<0) {
		printVclie("Error. 인벤토리 열기 실패. 종료", clie)
		SB_SetText("대기")
		SetInit(clie)
		return
	}
	
	r:=ImgFind("Image\petman\naerim.bmp",clie,2,500) ; 내림순인지 확인
	if(r>0) {
		adbClick(618, 97, clie) ; 내림->오름
	}
SellStart:
	adbClick(394, 99, clie) ; 판매
	
	adbClick(307, 247, clie)
	adbClick(390, 247, clie)
	adbClick(467, 247, clie)
	adbClick(555, 247, clie)
	adbClick(639, 247, clie)
	
	r:=ImgFind("Image\petman\4star.bmp",clie,1,500) ; 4성인가
	if(r>0) {
		SB_SetText("대기")
		SetInit(clie)
		return
	}
	
	adbClick(307, 309, clie)
	adbClick(390, 309, clie)
	adbClick(467, 309, clie)
	adbClick(555, 309, clie)
	adbClick(639, 309, clie)
	
	r:=ImgFind("Image\petman\4star.bmp",clie,1,500) ; 4성인가
	if(r>0) {
		SB_SetText("대기")
		SetInit(clie)
		return
	}
	
	adbClick(307, 413, clie)
	adbClick(390, 413, clie)
	adbClick(467, 413, clie)
	adbClick(555, 413, clie)
	adbClick(639, 413, clie)
	
	r:=ImgFind("Image\petman\4star.bmp",clie,1,500) ; 4성인가
	if(r>0) {
		SB_SetText("대기")
		SetInit(clie)
		return
	}
	
	adbClick(638, 179, clie) ; 확인
	r:=ImgFind("Image\petman\sell.bmp",clie,5,500) ; 4성인가
	if(r<0) {
		printVclie("Error. 판매 에러. 종료", clie)
		SB_SetText("대기")
		SetInit(clie)
		return
	}
	adbClick(473, 353, clie) ; 확인
	sleep 1000
	Goto, SellStart
	
	
}

DailyQuest(clie)
{
	if (CheckOpt(clie) < 0) {
		printVclie("체크해제 되어있음. 대기로 전환.", clie)
		SB_SetText("대기")
		return
	}
	printVclie("일일퀘스트 시작", clie)


	SetInit(clie)

	adbSwipe(700, 300, 50, 300, 50, clie) ;오른쪽으로 화면이동
	sleep 1000
	adbClick(202, 149, clie) ;입장
	k:=ImgFind("Image\raid\raidStore.bmp",clie,5,300)
	if(k<0) {
		printVclie("Error. 레이드 입장 실패. 계속진행", clie)
		SetInit(clie)
		Goto, MuteStart
	}
	SetInit(clie)
	
MuteStart:
	adbClick(13, 268, clie) ; ... 클릭
	r:=Img2Find("Image\chat\init.bmp","Image\chat\buzok.bmp",clie,10,500)
	if(r=2) {
		adbClick(55, 77, clie) ; 일반채널클릭
	}
	else if(r<0) {
		printVclie("채팅창 여는 중 에러 발생. 채팅창 음소거 다시 시작", clie)
		Goto, MuteStart
	}
	r := ImgFind("Image\chat\chat.bmp",clie, 1,500) ; 채팅창 꺼져있나?
	if(r=1) {
		adbClick(200, 482, clie) ; 음소거
		sleep 200
	}
	adbClick(354, 78, clie) ; 챗창닫기
	sleep 700
	adbSwipe(700, 300, 50, 300, 50, clie) ;오른쪽으로 화면이동
	sleep 1000
	
	PetPvP(clie)
	PetDon(clie)
	Friend(clie)
	JungRyung(clie)
	PetPvP(clie)
	PetDon(clie)
	SokDong(clie)
	PetPvP(clie)
	PetDon(clie)
	PvP(clie)
	PetPvP(clie)
	PetDon(clie)
	Buzok(clie)
	PetPvP(clie)
	PetDon(clie)
	Quest(clie)
	RaidGet(clie)
	PetPvP(clie)
	PetDon(clie)
}


DailyQuest2(clie)
{
	if (CheckOpt(clie) < 0) {
		printVclie("체크해제 되어있음. 대기로 전환.", clie)
		SB_SetText("대기")
		return
	}
	printVclie("투기부족퀘스트 시작", clie)
	PetDon(clie)
	PvP(clie)
	PetDon(clie)
	Buzok(clie)
	PetDon(clie)
	Quest(clie)
	RaidGet(clie)
	PetDon(clie)
}

GogiSpend(clie)
{
	global SotangLoopCheck 
	SotangLoopCheck := 0
	if (CheckOpt(clie) < 0) {
		printVclie("체크해제 되어있음. 대기로 전환.", clie)
		SB_SetText("대기")
		return
	}
	SB_SetText("고기소모 수행중")
	printVclie("고기소모 시작", clie)
GogiStart:
	SetInit(clie)
	
	r:=ImgFind("Image\hottime\sotangIcon.bmp",clie, 1,500) ; 소탕화면 열려있는지 체크
	if(r<0) {
		adbClick(788, 277, clie) ; < 클릭
	}
	
	r:=ImgFind("Image\hottime\sotangIcon.bmp",clie, 10,500) ; 소탕화면 기다리기
	if(r<0) {
		printVclie("Error. 소탕열기 실패. 재시작", clie)
		Goto, GogiStart
	}
	adbClick(632, 340, clie) ; 소탕아이콘클릭
	r:=ImgFind("Image\hottime\log.bmp",clie, 10,500) ; 소탕일지 화면 기다리기
	if(r<0) {
		printVclie("Error. 소탕일지 열기 실패. 재시작", clie)
		Goto, GogiStart
	}

	r:=Img3Find("Image\hottime\7sotang.bmp","Image\hottime\8sotang.bmp","Image\hottime\9sotang.bmp",clie,5,500) ; 소탕권 개수 확인중
	if (r<0) {
		adbClick(636, 110, clie) ; x 클릭
		r:=ImgFind("Image\hottime\sotangIcon.bmp",clie, 10,500) ; 소탕화면 기다리기	
		adbClick(581, 275, clie) ; > 클릭
		Mohum(clie)
	}
	
SotangStart:
	adbClick(492, 468, clie) ; 분류
	sleep 500
	adbClick(491, 406, clie) ;완료시간
	r:=ImgFind("Image\hottime\completeTime.bmp",clie, 10,500) ; 완료시간으로 바꿈
	if(r<0) {
		printVclie("Error. 완료시간정렬실패. 종료", clie)
		SB_SetText("대기")
		SetInit(clie)
		return
	}
	r:=ImgFind("Image\hottime\orumsoon.bmp",clie, 1,1000) ; 이미 오름순인지 확인
	if(r<0) {
		adbClick(596, 470, clie) ;내림순->오름순
	}
	
	sleep 200
	adbClick(584, 195, clie) ; 소탕아이콘클릭
	r:=ImgFind("Image\hottime\noGogi.bmp",clie, 5,500) ; 혹시 고기?
	if(r=1) {
		adbClick(332, 353, clie) ; 취소
		r:=ImgFind("Image\hottime\log.bmp",clie, 5,500) ; 소탕일지 화면 기다리기
		adbClick(636, 110, clie) ; x 클릭
		r:=ImgFind("Image\hottime\sotangIcon.bmp",clie, 5,500) ; 소탕화면 기다리기
		adbClick(581, 275, clie) ; > 클릭
		return
	}
	
Capture1:
	r:=ImgFind("Image\hottime\1st.bmp",clie,15,500) ;펫포획창
	if(r<0) {
		printVclie("Error. 포획(소탕)창 입장 실패. 종료", clie)
		
		k:=ImgFind("Image\mohum\raid.bmp",clie,15,500)
		if (k=1) {
			adbClick(132, 165, clie) ; 전투시작
			adbClick(239, 165, clie) ; 전투시작
			adbClick(353, 165, clie) ; 전투시작
			adbClick(132, 288, clie) ; 전투시작
			adbClick(240, 288, clie) ; 전투시작
			sleep 200
			adbClick(607, 470, clie) ; 전투시작
			
			m:=ImgFind("Image\raid\use.bmp",clie,5,500)
			if (m<0) {
				printVclie("Error. 레이드 시작에 문제. 종료", clie)
				SB_SetText("대기")
				SetInit(clie)
				return
			}
			adbClick(470, 354, clie) ; 전투시작
			r:=ImgFind("Image\mohum\endRaid.bmp", clie, 100,1000) ; 전투완료 기다리기
			SetInit(clie)
			Goto, GogiStart
		}
		
		SB_SetText("대기")
		SetInit(clie)
		return
	}
	
	r:=ImgFind("Image\hottime\0cap.bmp",clie,1,500) ;포획끝인가
	if(r=1) {
		SotangLoopCheck := SotangLoopCheck+1
		if(SotangLoopCheck > 3) {
			printVclie("소탕 무한루프. 소탕일지리스트가 너무 적음. 종료", clie)
			SB_SetText("대기")
			SetInit(clie)
			return
		}
		Goto, CaptureEnd
	}
	SotangLoopCheck := 0
	adbClick(491, 177, clie) ; 1회클릭
	sleep 3000
	r:=ImgFind("Image\hottime\1st.bmp",clie,5,500) ;1회다시활성화
	if(r<0) {
		k:=Img2Find("Image\hottime\noGogi.bmp","Image\mohum\sinbi.bmp",clie,5,500) ; 혹시 고기나 신비문제?
		if(k=1) {
			adbClick(332, 353, clie) ; 취소
			r:=ImgFind("Image\hottime\1st.bmp",clie, 5,500) ;펫포획창
			adbClick(659, 115, clie) ; 포획창닫기
			r:=ImgFind("Image\hottime\log.bmp",clie, 5,500) ; 소탕일지 화면 기다리기
			adbClick(636, 110, clie) ; x 클릭
			r:=ImgFind("Image\hottime\sotangIcon.bmp",clie, 5,500) ; 소탕화면 기다리기
			adbClick(581, 275, clie) ; > 클릭
			return
		}
		else if(k=2) {
			sleep 500
			adbClick(662, 167, clie) ; x표시
		}
		else if(k<0) {
			m:=ImgFind("Image\mohum\raid.bmp",clie,15,500)
			if (m=1) {
				adbClick(132, 165, clie) ; 전투시작
				adbClick(239, 165, clie) ; 전투시작
				adbClick(353, 165, clie) ; 전투시작
				adbClick(132, 288, clie) ; 전투시작
				adbClick(240, 288, clie) ; 전투시작
				sleep 200
				adbClick(607, 470, clie) ; 전투시작
				
				n:=ImgFind("Image\raid\use.bmp",clie,5,500)
				if (n<0) {
					printVclie("Error. 레이드 시작에 문제. 종료", clie)
					SB_SetText("대기")
					SetInit(clie)
					return
				}
				adbClick(470, 354, clie) ; 전투시작
				n:=ImgFind("Image\mohum\endRaid.bmp", clie, 100,1000) ; 전투완료 기다리기
				SetInit(clie)
				Goto, GogiStart
			}
			else if(m<0) {
				printVclie("Error. 인벤토리 부족의 가능성이 높음. 미수행후 종료", clie)
				SB_SetText("대기")
				SetInit(clie)
				return
			}
		
		}
		
	}
	Goto, Capture1 
	
CaptureEnd:
	adbClick(659, 115, clie) ; 포획창닫기
	Goto, SotangStart
}

Mohum(clie)
{
MohumStart:
	global MohumP
	if (CheckOpt(clie) < 0) {
		printVclie("체크해제 되어있음. 대기로 전환.", clie)
		SB_SetText("대기")
		return
	}
	SB_SetText("모험 수행중")
	printVclie("모험 시작", clie)
	SetInit(clie)
	adbSwipe(700, 300, 50, 300, 50, clie) ;오른쪽으로 화면이동
	sleep 500 
	adbClick(70, 273, clie) ; 입장
	adbClick(70, 273, clie) ; 입장
	
	r:=ImgFind("Image\mohum\start.bmp", clie, 20, 500) ; 모험화면확인	
	if(r<0) {
		printVclie("Error. 모험 입장 실패. 종료", clie)
		SB_SetText("대기")
		SetInit(clie)
		return
	}
	adbClick(90, 117, clie) ; 고난/모험
	r:=ImgFind("Image\mohum\scrollOn.bmp",clie,10,500) ; 스크롤
	if(r<0) {
		printVclie("Error. 모험/고난 전환 실패. 종료", clie)
		SB_SetText("대기")
		SetInit(clie)
		return
	}
	adbClick(100, 191, clie) ; 고난의장
	sleep 3000 
	adbClick(MohumP[clie,1], MohumP[clie,2], clie) ; 1~8장중 클릭
	sleep 5000 
	adbClick(MohumP[clie,3], MohumP[clie,4], clie) ; 입장
	adbClick(MohumP[clie,3], MohumP[clie,4], clie) ; 입장
	r:=ImgFind("Image\mohum\join.bmp", clie, 10,500) ; >> 기다리기
	if(r<0) {
		printVclie("Error. 모험 입장 실패. 종료", clie)
		SB_SetText("대기")
		SetInit(clie)
		return
	}
	adbClick(628, 445, clie) ; 입장
	
MohumReady:	
	r:=ImgFind("Image\mohum\fight.bmp", clie, 10,500) ; 모험준비화면 기다리기
	if(r<0) {
		printVclie("Error. 모험 준비화면 로딩 실패. 종료", clie)
		SB_SetText("대기")
		SetInit(clie)
		return
	}
	adbClick(589, 469, clie) ; 입장
	sleep 200
	adbClick(589, 469, clie) ; 입장
	sleep 200
	adbClick(589, 469, clie) ; 입장
	sleep 200
	adbClick(589, 469, clie) ; 입장
	
	r:=ImgFind("Image\hottime\noGogi.bmp",clie, 5,500) ; 혹시 고기?
	if(r=1) {
		SB_SetText("대기")
		SetInit(clie)
		return
	}
	
	r:=Img2Find("Image\mohum\endFight.bmp","Image\mohum\sinbi.bmp",clie,300,1000) ;전투완료 기다리기
	if (r=2) {
		sleep 500
		adbClick(662, 167, clie) ; x표시
	}
	else if (r<0) {
		printVclie("Error. 모험 전투에 뭔가 에러. 종료", clie)
		SB_SetText("대기")
		SetInit(clie)
		return
	}

	adbClick(539, 471, clie) ; 재전투
	r:=ImgFind("Image\mohum\raid.bmp",clie,15,500) ; 혹시 레이드?
	if (r=1) {
		adbClick(132, 165, clie) ; 전투시작
		adbClick(239, 165, clie) ; 전투시작
		adbClick(353, 165, clie) ; 전투시작
		adbClick(132, 288, clie) ; 전투시작
		adbClick(240, 288, clie) ; 전투시작
		sleep 200
		adbClick(607, 470, clie) ; 전투시작
		
		r:=ImgFind("Image\raid\use.bmp",clie,5,500)
		if (r<0) {
			printVclie("Error. 레이드 시작에 문제. 종료", clie)
			SB_SetText("대기")
			SetInit(clie)
			return
		}
		adbClick(470, 354, clie) ; 전투시작
		r:=ImgFind("Image\mohum\endRaid.bmp", clie, 100,1000) ; 전투완료 기다리기
		SetInit(clie)
		Goto, MohumStart
	}
	Goto, MohumReady

}

PetDon(clie)
{
	global vx, vy
	SB_SetText("펫분양 수행중")
	if (CheckOpt(clie) < 0) {
		printVclie("체크해제 되어있음. 대기로 전환.", clie)
		SB_SetText("대기")
		return
	}
	printVclie("펫분양 시작", clie)
	SetInit(clie)
	adbClick(511, 468, clie) ;입장
FindFree:
	r:=ImgFind("Image\petdon\start.bmp",clie,10,1000)
	if(r<0) {
		printVclie("Error: 펫분양 입장 실패. 펫분양 종료", clie)
		SetInit(clie)
		return
	}
	r:=ImgFind("Image\petdon\free.bmp",clie,1,1000)
	if (r<0) {
		k := ImgFind("Image\petdon\pre_free.bmp", clie, 1,1000) ;무료
		if (k<0) {
			SetInit(clie)
			SB_SetText("대기")
			return
		}
	}
	adbClick(vx, vy, clie)
	r:=ImgFind("Image\petdon\check.bmp",clie,3,1000)
	if (r<0) {
		printVclie("Error: 무료알 누르기 실패. 종료", clie)
		SetInit(clie)
		SB_SetText("대기")
		return
	}
	adbClick(400, 400, clie) ; 구매버튼클릭
	sleep 2000
	WaitUntilImgShow_Click("Image\petdon\confirm.bmp", 729, 266, clie) ; 화면을 터치하세요 발견
	adbClick(482, 473, clie)
	Goto, FindFree
}


Friend(clie)
{
	global vx,vy
	SB_SetText("친구관리 수행중")
	if (CheckOpt(clie) < 0) {
		printVclie("체크해제 되어있음. 대기로 전환.", clie)
		SB_SetText("대기")
		return
	}
	printVclie("친구관리 시작", clie)
	SetInit(clie)
	adbClick(403, 60, clie) ;+ 클릭
	r:=ImgFind("Image\friend\gogi.bmp",clie,10,500)
	if(r<0) {
		printVclie("Error. 고기및티켓 입장 실패. 종료", clie)
		Goto, FriendMan
	}
	r:=ImgFind("Image\friend\500.bmp",clie,10,500)
	if(r<0) {
		printVclie("Error. 고기 찾기 실패. 종료", clie)
		Goto, FriendMan
	}
	adbClick(vx+40, vy+80, clie) ;500개짜리 클릭
	r:=Img2Find("Image\friend\yesshell.bmp", "Image\friend\noshell.bmp",clie, 10,500) ;상품을 구매하시겠습니까?
	if (r=1) {
		adbClick(406, 402, clie) ;500개짜리 클릭
	}
	else if(r<0) {
		printVclie("고기 버그인듯, 뒤로가기", clie)
	}
	
FriendMan:
	SetInit(clie)
	adbClick(669, 468, clie) ;입장
	r:=ImgFind("Image\friend\start.bmp",clie,10,500) ;친구관리 화면
	if(r<0) {
		printVclie("Error. 친구관리 입장 실패. 다시 수행", clie)
		Goto, FriendMan
	}
	adbClick(669, 465, clie) ;모두보내기
	sleep 1000
Bongtoo:
	SetInit(clie)
	adbClick(764, 64, clie) ; 봉투 클릭
	r:=ImgFind("Image\friend\gift.bmp", clie, 10,500) 
	if(r<1) {
		printVclie("Error. 봉투 클릭 실패. 다시 클릭", clie)
		Goto, Bongtoo
	}
	
	r:=ImgFind("Image\friend\nogift.bmp", clie, 3,500) 
	if(r < 0) {
		adbClick(645, 464, clie) ; 모두받기 클릭
		r:=ImgFind("Image\friend\getall.bmp", clie, 10,500)
		if(r<0) {
			printVclie("Error. 모두받기 실패. 종료", clie)
			SetInit(clie)
			SB_SetText("대기")
			return
		}
		adbClick(400, 449, clie) ; 확인 클릭
	}
	sleep 1000
	
	adbClick(460, 91, clie) ; 우정포인트 클릭
	r:=ImgFind("Image\friend\nopoint.bmp", clie, 5,500) 
	if(r>0) {
		SetInit(clie)
		SB_SetText("대기")
		return
	}
	
	adbClick(645, 464, clie) ; 모두받기 클릭
	r:=ImgFind("Image\friend\getall.bmp", clie, 10,500)
	if(r<0) {
		printVclie("Error. 모두받기 실패. 종료", clie)
		SetInit(clie)
		SB_SetText("대기")
		return
	}
	adbClick(400, 449, clie) ; 확인 클릭
	SetInit(clie)
	SB_SetText("대기")
	return
}

JungRyung(clie)
{
 	global JRdifficulty
	global toleranceJung
	
	SB_SetText("정령의제단 수행중")
	if (CheckOpt(clie) < 0) {
		printVclie("체크해제 되어있음. 대기로 전환.", clie)
		SB_SetText("대기")
		return
	}
	printVclie("정령의제단 시작", clie)
JRStart:
	SetInit(clie)
	adbSwipe(700, 300, 50, 300, 50, clie) ;오른쪽으로 화면이동
	sleep 500
  	adbClick(438, 162, clie) ;입장
	adbClick(438, 162, clie) ;입장
Ji:
	tolerance := toleranceJung
	r:=ImgFind("Image\jungryung\init.bmp", clie, 10,500)
	if(r<0) {
		printVclie("입장실패. 다시 입장 시도", clie)
		Goto, JRStart
	}
	r:=ImgFind("Image\jungryung\jiDay.bmp", clie, 1,1000)
  	if (r<0) {
  		Goto, Su
	}
	printVclie("지속 오픈", clie)
JiEnter:
	sleep 1000
	adbSwipe(700, 300, 50, 300, 100, clie) ;오른쪽으로 화면이동
	sleep 200
	adbSwipe(700, 300, 50, 300, 100, clie) ;오른쪽으로 화면이동
	sleep 200
	adbClick(70, 318, clie) ; 지속성 제단 클릭
	r:=ImgFind("Image\jungryung\selectDiff.bmp", clie, 10,500)
	if(r<0) {
		Goto, JiEnter
	}
	while (1) {
		r:=ImgFind("Image\jungryung\selectDiff.bmp", clie, 10,500)
		if(r<0) {
			printVclie("Error. 난이도 설정 화면 입장 실패. 정령재시작", clie)
			Goto, JRStart
		}
		adbClick(50+100*JRdifficulty[clie,1], 193, clie) ;난이도 클릭
		r:=ImgFind("Image\jungryung\ready.bmp", clie, 2,500)
		if (r<0) {
			printVclie("난이도 클릭이 되지 않음. 다시 난이도 클릭.", clie)
			adbClick(50+100*JRdifficulty[clie,1], 193, clie) ;난이도 클릭
			k:=ImgFind("Image\jungryung\ready.bmp", clie, 2,500)
			if(k<0) {
				printVclie("Error: 난이도 클릭 에러. 재시작.", clie)
				Goto, JRStart
			}
		}
		r:=ImgFind("Image\jungryung\impossible.bmp", clie, 2,500)
		if (r>0) {
			adbClick(687,83, clie) ;퇴장
			Goto, Su
		}
		adbClick(410,443, clie) ;모험준비
		r:=ImgFind("Image\jungryung\joinMore.bmp", clie, 2,500)
		if(r>0) {
			adbClick(313, 353, clie) ; 취소클릭
			sleep 2000
			adbClick(687,83, clie) ;퇴장
			Goto, Su
		}
		r:=ImgFind("Image\jungryung\fight.bmp", clie, 10,500) ; 전투시작
		if(r<0) {
			printVclie("Error: 전투시작 에러. 재시작.", clie)
			Goto, JRStart
		}
		adbClick(565,471,clie) ;전투시작 클릭
		r:=ImgFind("Image\jungryung\notyet.bmp", clie, 2,500)
		if (r=1) {
			adbClick(334,354,clie) ;취소클릭
			sleep 1000
			adbClick(249,382,clie) ;자동배치
			sleep 500
			adbClick(565,471,clie) ;전투시작 클릭
		}
		printVclie("지속 전투중", clie)
		r := Img2Find("Image\jungryung\endFight.bmp","Image\jungryung\lose.bmp", clie,300,1000) ; 전투시작
		if(r=1) {
			adbClick(639,468,clie) ; >> 클릭
		}
		else if(r=2) {
			tolerance := tolerance-1
			if(tolerance=0) {
				tolerance := toleranceJung
				JRdifficulty[clie,1] := JRdifficulty[clie,1] - 1
				printVclie("난이도 " . JRdifficulty[clie,1] . "으로 하향조정", clie)
			}
			adbClick(482,473,clie) ; >> 클릭
		}
		else if(r<0) {
			printVclie("Error. auto가 안눌려져있는듯.", clie)
			adbClick(34, 483, clie) ; 오토 클릭	
			k := Img2Find("Image\jungryung\endFight.bmp","Image\jungryung\lose.bmp", clie,300,1000) ;
			if(k=1) {
				adbClick(639,468,clie) ; >> 클릭
			}
			else if(k=2) {
				tolerance := tolerance-1
				if(tolerance=0) {
					tolerance := toleranceJung
					JRdifficulty[clie,1] := JRdifficulty[clie,1] - 1
					printVclie("난이도 " . JRdifficulty[clie,1] . "으로 하향조정", clie)
				}
				adbClick(482,473,clie) ; >> 클릭
			}
		}
	}
Su:
	tolerance := toleranceJung
	r:=ImgFind("Image\jungryung\init.bmp", clie, 10,500)
	if(r<0) {
		printVclie("입장실패. 다시 입장 시도", clie)
		Goto, JRStart
	}
	r:=ImgFind("Image\jungryung\suDay.bmp", clie, 1,1000)
  	if (r<0) {
  		Goto, Hwa
	}
	printVclie("수속 오픈", clie)
SuEnter:
	sleep 1000
	adbSwipe(700, 300, 50, 300, 100, clie) ;오른쪽으로 화면이동
	sleep 200
	adbSwipe(700, 300, 50, 300, 100, clie) ;오른쪽으로 화면이동
	sleep 200
	adbClick(254, 318, clie) ; 수속성 제단 클릭
	r:=ImgFind("Image\jungryung\selectDiff.bmp", clie, 10,500)
	if(r<0) {
		Goto, SuEnter
	}
	while (1) {
		r:=ImgFind("Image\jungryung\selectDiff.bmp", clie, 10,500)
		if(r<0) {
			printVclie("Error. 난이도 설정 화면 입장 실패. 정령재시작", clie)
			Goto, JRStart
		}
		adbClick(50+100*JRdifficulty[clie,2], 193, clie) ;난이도 클릭
		r:=ImgFind("Image\jungryung\ready.bmp", clie, 2,500)
		if (r<0) {
			printVclie("난이도 클릭이 되지 않음. 다시 난이도 클릭.", clie)
			adbClick(50+100*JRdifficulty[clie,2], 193, clie) ;난이도 클릭
			k:=ImgFind("Image\jungryung\ready.bmp", clie, 2,500)
			if(k<0) {
				printVclie("Error: 난이도 클릭 에러. 재시작.", clie)
				Goto, JRStart
			}
		}
		r:=ImgFind("Image\jungryung\impossible.bmp", clie, 2,500)
		if (r>0) {
			adbClick(687,83, clie) ;퇴장
			Goto, Hwa
		}
		adbClick(410,443, clie) ;모험준비
		r:=ImgFind("Image\jungryung\joinMore.bmp", clie, 2,500)
		if(r>0) {
			adbClick(313, 353, clie) ; 취소클릭
			sleep 2000
			adbClick(687,83, clie) ;퇴장
			Goto, Hwa
		}
		r:=ImgFind("Image\jungryung\fight.bmp", clie, 10,500) ; 전투시작
		if(r<0) {
			printVclie("Error: 전투시작 에러. 재시작.", clie)
			Goto, JRStart
		}
		adbClick(565,471,clie) ;전투시작 클릭
		r:=ImgFind("Image\jungryung\notyet.bmp", clie, 2,500)
		if (r=1) {
			adbClick(334,354,clie) ;취소클릭
			sleep 1000
			adbClick(249,382,clie) ;자동배치
			sleep 500
			adbClick(565,471,clie) ;전투시작 클릭
		}
		printVclie("수속 전투중", clie)
		r := Img2Find("Image\jungryung\endFight.bmp","Image\jungryung\lose.bmp", clie,300,1000) ; 전투시작
		if(r=1) {
			adbClick(639,468,clie) ; >> 클릭
		}
		else if(r=2) {
			tolerance := tolerance-1
			if(tolerance=0) {
				tolerance := toleranceJung
				JRdifficulty[clie,2] := JRdifficulty[clie,2] - 1
				printVclie("난이도 " . JRdifficulty[clie,2] . "으로 하향조정", clie)
			}
			adbClick(482,473,clie) ; >> 클릭
		}
		else if(r<0) {
			printVclie("Error. auto가 안눌려져있는듯.", clie)
			adbClick(34, 483, clie) ; 오토 클릭	
			k := Img2Find("Image\jungryung\endFight.bmp","Image\jungryung\lose.bmp", clie,300,1000) ;
			if(k=1) {
				adbClick(639,468,clie) ; >> 클릭
			}
			else if(k=2) {
				tolerance := tolerance-1
				if(tolerance=0) {
					tolerance := toleranceJung
					JRdifficulty[clie,2] := JRdifficulty[clie,2] - 1
					printVclie("난이도 " . JRdifficulty[clie,2] . "으로 하향조정", clie)
				}
				adbClick(482,473,clie) ; >> 클릭
			}
		}
	}
Hwa:
	tolerance := toleranceJung
	r:=ImgFind("Image\jungryung\init.bmp", clie, 10,500)
	if(r<0) {
		printVclie("입장실패. 다시 입장 시도", clie)
		Goto, JRStart
	}
	r:=ImgFind("Image\jungryung\hwaDay.bmp", clie, 1,1000)
  	if (r<0) {
  		Goto, Poong
	}
	printVclie("화속 오픈", clie)
HwaEnter:
	sleep 1000
	adbSwipe(700, 300, 50, 300, 100, clie) ;오른쪽으로 화면이동
	sleep 200
	adbSwipe(700, 300, 50, 300, 100, clie) ;오른쪽으로 화면이동
	sleep 200
	adbClick(475, 318, clie) ; 화속성 제단 클릭
	r:=ImgFind("Image\jungryung\selectDiff.bmp", clie, 10,500)
	if(r<0) {
		Goto, HwaEnter
	}
	while (1) {
		r:=ImgFind("Image\jungryung\selectDiff.bmp", clie, 10,500)
		if(r<0) {
			printVclie("Error. 난이도 설정 화면 입장 실패. 정령재시작", clie)
			Goto, JRStart
		}
		adbClick(50+100*JRdifficulty[clie,3], 193, clie) ;난이도 클릭
		r:=ImgFind("Image\jungryung\ready.bmp", clie, 2,500)
		if (r<0) {
			printVclie("난이도 클릭이 되지 않음. 다시 난이도 클릭.", clie)
			adbClick(50+100*JRdifficulty[clie,3], 193, clie) ;난이도 클릭
			k:=ImgFind("Image\jungryung\ready.bmp", clie, 2,500)
			if(k<0) {
				printVclie("Error: 난이도 클릭 에러. 재시작.", clie)
				Goto, JRStart
			}
		}
		r:=ImgFind("Image\jungryung\impossible.bmp", clie, 2,500)
		if (r>0) {
			adbClick(687,83, clie) ;퇴장
			Goto, Poong
		}
		adbClick(410,443, clie) ;모험준비
		r:=ImgFind("Image\jungryung\joinMore.bmp", clie, 2,500)
		if(r>0) {
			adbClick(313, 353, clie) ; 취소클릭
			sleep 2000
			adbClick(687,83, clie) ;퇴장
			Goto, Poong
		}
		r:=ImgFind("Image\jungryung\fight.bmp", clie, 10,500) ; 전투시작
		if(r<0) {
			printVclie("Error: 전투시작 에러. 재시작.", clie)
			Goto, JRStart
		}
		adbClick(565,471,clie) ;전투시작 클릭
		r:=ImgFind("Image\jungryung\notyet.bmp", clie, 2,500)
		if (r=1) {
			adbClick(334,354,clie) ;취소클릭
			sleep 1000
			adbClick(249,382,clie) ;자동배치
			sleep 500
			adbClick(565,471,clie) ;전투시작 클릭
		}
		printVclie("화속 전투중", clie)
		r := Img2Find("Image\jungryung\endFight.bmp","Image\jungryung\lose.bmp", clie,300,1000) ; 전투시작
		if(r=1) {
			adbClick(639,468,clie) ; >> 클릭
		}
		else if(r=2) {
			tolerance := tolerance-1
			if(tolerance=0) {
				tolerance := toleranceJung
				JRdifficulty[clie,3] := JRdifficulty[clie,3] - 1
				printVclie("난이도 " . JRdifficulty[clie,3] . "으로 하향조정", clie)
			}
			adbClick(482,473,clie) ; >> 클릭
		}
		else if(r<0) {
			printVclie("Error. auto가 안눌려져있는듯.", clie)
			adbClick(34, 483, clie) ; 오토 클릭	
			k := Img2Find("Image\jungryung\endFight.bmp","Image\jungryung\lose.bmp", clie,300,1000) ;
			if(k=1) {
				adbClick(639,468,clie) ; >> 클릭
			}
			else if(k=2) {
				tolerance := tolerance-1
				if(tolerance=0) {
					tolerance := toleranceJung
					JRdifficulty[clie,3] := JRdifficulty[clie,3] - 1
					printVclie("난이도 " . JRdifficulty[clie,3] . "으로 하향조정", clie)
				}
				adbClick(482,473,clie) ; >> 클릭
			}
		}
	}
Poong:
	tolerance := toleranceJung
	r:=ImgFind("Image\jungryung\init.bmp", clie, 10,500)
	if(r<0) {
		printVclie("입장실패. 다시 입장 시도", clie)
		Goto, JRStart
	}
	r:=ImgFind("Image\jungryung\poongDay.bmp", clie, 1,1000)
  	if (r<0) {
  		Goto, JREnd
	}
	printVclie("풍속 오픈", clie)
PoongEnter:
	sleep 1000
	adbSwipe(700, 300, 50, 300, 100, clie) ;오른쪽으로 화면이동
	sleep 200
	adbSwipe(700, 300, 50, 300, 100, clie) ;오른쪽으로 화면이동
	sleep 200
	adbClick(693, 318, clie) ; 풍속성 제단 클릭
	r:=ImgFind("Image\jungryung\selectDiff.bmp", clie, 10,500)
	if(r<0) {
		Goto, PoongEnter
	}
	while (1) {
		r:=ImgFind("Image\jungryung\selectDiff.bmp", clie, 10,500)
		if(r<0) {
			printVclie("Error. 난이도 설정 화면 입장 실패. 정령재시작", clie)
			Goto, JRStart
		}
		adbClick(50+100*JRdifficulty[clie,4], 193, clie) ;난이도 클릭
		r:=ImgFind("Image\jungryung\ready.bmp", clie, 2,500)
		if (r<0) {
			printVclie("난이도 클릭이 되지 않음. 다시 난이도 클릭.", clie)
			adbClick(50+100*JRdifficulty[clie,4], 193, clie) ;난이도 클릭
			k:=ImgFind("Image\jungryung\ready.bmp", clie, 2,500)
			if(k<0) {
				printVclie("Error: 난이도 클릭 에러. 재시작.", clie)
				Goto, JRStart
			}
		}
		r:=ImgFind("Image\jungryung\impossible.bmp", clie, 2,500)
		if (r>0) {
			adbClick(687,83, clie) ;퇴장
			Goto, JREnd
		}
		adbClick(410,443, clie) ;모험준비
		r:=ImgFind("Image\jungryung\joinMore.bmp", clie, 2,500)
		if(r>0) {
			adbClick(313, 353, clie) ; 취소클릭
			sleep 2000
			adbClick(687,83, clie) ;퇴장
			Goto, JREnd
		}
		r:=ImgFind("Image\jungryung\fight.bmp", clie, 10,500) ; 전투시작
		if(r<0) {
			printVclie("Error: 전투시작 에러. 재시작.", clie)
			Goto, JRStart
		}
		adbClick(565,471,clie) ;전투시작 클릭
		r:=ImgFind("Image\jungryung\notyet.bmp", clie, 2,500)
		if (r=1) {
			adbClick(334,354,clie) ;취소클릭
			sleep 1000
			adbClick(249,382,clie) ;자동배치
			sleep 500
			adbClick(565,471,clie) ;전투시작 클릭
		}
		printVclie("풍속 전투중", clie)
		r := Img2Find("Image\jungryung\endFight.bmp","Image\jungryung\lose.bmp", clie,300,1000) ; 전투시작
		if(r=1) {
			adbClick(639,468,clie) ; >> 클릭
		}
		else if(r=2) {
			tolerance := tolerance-1
			if(tolerance=0) {
				tolerance := toleranceJung
				JRdifficulty[clie,4] := JRdifficulty[clie,4] - 1
				printVclie("난이도 " . JRdifficulty[clie,4] . "으로 하향조정", clie)
			}
			adbClick(482,473,clie) ; >> 클릭
		}
		else if(r<0) {
			printVclie("Error. auto가 안눌려져있는듯.", clie)
			adbClick(34, 483, clie) ; 오토 클릭	
			k := Img2Find("Image\jungryung\endFight.bmp","Image\jungryung\lose.bmp", clie,300,1000) ;
			if(k=1) {
				adbClick(639,468,clie) ; >> 클릭
			}
			else if(k=2) {
				tolerance := tolerance-1
				if(tolerance=0) {
					tolerance := toleranceJung
					JRdifficulty[clie,4] := JRdifficulty[clie,4] - 1
					printVclie("난이도 " . JRdifficulty[clie,4] . "으로 하향조정", clie)
				}
				adbClick(482,473,clie) ; >> 클릭
			}
		}
	}
  	
 JREnd:
	SetInit(clie)
	SB_SetText("대기")
	return
}

SokDong(clie)
{
	global toleranceSok
	tolerance := toleranceSok
	
	SB_SetText("속동 수행중")
	if (CheckOpt(clie) < 0) {
		printVclie("체크해제 되어있음. 대기로 전환.", clie)
		SB_SetText("대기")
		return
	}
	printVclie("속동 시작", clie)
	
	SetInit(clie)
	adbSwipe(700, 300, 50, 300, 50, clie) ;오른쪽으로 화면이동
	sleep 500
	adbClick(606, 370, clie) ;속동 클릭	
	adbClick(606, 370, clie) ;속동 클릭
	
	r:=Img2Find("Image\sokdong\start.bmp","Image\sokdong\monday.bmp" ,clie, 20,500) ;속동 아이콘
	if(r=1) {
		r:=ImgFind("Image\sokdong\monday.bmp", clie, 10,500) ;월요일인가
		if(r>0) {
			adbClick(402, 409, clie) ;보상받기 (월요일)
			sleep 3000
		}
	}
	else if(r=2) {
		adbClick(402, 409, clie) ;보상받기 (월요일)
		sleep 3000
	}
	else if(r<0) {
		printVclie("Error. 속동 입장 실패. 종료", clie)
		SB_SetText("대기")
		SetInit(clie)
		return
	}
	
	r:=ImgFind("Image\sokdong\start2.bmp", clie, 3, 500) ;회복아이콘활성화
	if(r=1) {
		adbClick(224, 332, clie) ; 체력회복
		r:=Img2Find("Image\sokdong\full.bmp", "Image\sokdong\energy.bmp", clie, 10,500) ;알림창 
		if (r=1) {
			adbClick(400, 354, clie) ; 체력 100% 확인
		}
		else if(r=2) {
			adbClick(465, 366, clie) ; 체력회복할것인가?
			r:=ImgFind("Image\sokdong\recharge.bmp", clie, 10,500) ;모든체력이 회복되었습니다
			if(r<0) {
				printVclie("Error. 모든체력회복 당연히 되어야되는데 문제발생. 종료", clie)
				SB_SetText("대기")
				SetInit(clie)
				return
			}
			adbClick(400, 354, clie) ; 체력회복확인
		}
		else if(r<0) {
			printVclie("Error. 체력회복 당연히 되어야되는데 문제발생. 종료", clie)
			SB_SetText("대기")
			SetInit(clie)
			return
		}
	}
EnterGate:
	r:=ImgFind("Image\sokdong\gate.bmp", clie, 20,500) 
	if(r<0) {
		printVclie("Error. 관문입장 실패. 종료", clie)
		SB_SetText("대기")
		SetInit(clie)
		return
	}
	adbClick(404, 331, clie) ; 관문입장
	sleep 200
	adbClick(404, 331, clie) ; 관문입장
	r:=ImgFind("Image\sokdong\ready.bmp", clie, 10,500) ;탐험준비 
	if(r<0) {
		adbSwipe(561,223,236,223,100,clie) ; stuck풀어주기
		adbSwipe(561,223,236,223,100,clie) ; stuck풀어주기
		printVclie("Error. 관문들어가기 실패. 재시도", clie)
		Goto, EnterGate
	}

	adbClick(250, 379, clie) ; 자동배치 클릭
	sleep 200
	adbClick(551, 469, clie) ; 탐험준비 클릭
	sleep 200
	adbClick(551, 469, clie) ; 탐험준비 클릭
	sleep 200
	adbClick(551, 469, clie) ; 탐험준비 클릭
	sleep 200
	adbClick(551, 469, clie) ; 탐험준비 클릭
	r := WaitUntil2ImgShow_Click("Image\sokdong\onFight.bmp","Image\sokdong\winFight.bmp",408,290, clie) ;센터계속클릭
	if(r = 2) {
		adbClick(612, 469, clie) ; >> 클릭	
		Goto, EnterGate
	}
	sleep 1000
	adbClick(34, 483, clie) ; 오토 클릭	
	r:=Img2Find("Image\sokdong\winFight.bmp", "Image\sokdong\looseFight.bmp", clie, 300,1000) ;전투종료
	if (r=1)
	{
		adbClick(612, 469, clie) ; >> 클릭	
		Goto, EnterGate
	}
	else if (r = 2) {
		tolerance := tolerance -1
		if(tolerance = 0) {
			SetInit(clie)
			SB_SetText("대기")
			return
		}
		adbClick(483, 470, clie) ; >> 클릭	
		Goto, EnterGate
	}
	else if(r<0) {
		printVclie("Error. 아직도 속동전투중? auto 클릭", clie)
		adbClick(34, 483, clie) ; 오토 클릭	
		k:=Img2Find("Image\sokdong\winFight.bmp", "Image\sokdong\looseFight.bmp", clie, 300,1000) ;전투종료
		if (k=1)
		{
			adbClick(612, 469, clie) ; >> 클릭	
			Goto, EnterGate
		}
		else if (k = 2) {
			printVclie("속동 패배.", clie)
			tolerance := tolerance -1
			if(tolerance = 0) {
				SetInit(clie)
				SB_SetText("대기")
				return
			}
			adbClick(483, 470, clie) ; >> 클릭	
			Goto, EnterGate
		}
	}
	
}

PvP(clie)
{
PvPStart:
	global battle1, battle2, battle3, battle4
	if(clie = 1) {
		if(battle1 = 0)
			return
	}
	if(clie = 2) {
		if(battle2 = 0)
			return
	}
	if(clie = 3) {
		if(battle3 = 0)
			return
	}
	if(clie = 4) {
		if(battle4 = 0)
			return
	}
	
	SB_SetText("투기장 수행중")
	if (CheckOpt(clie) < 0) {
		printVclie("체크해제 되어있음. 대기로 전환.", clie)
		SB_SetText("대기")
		return
	}
	printVclie("투기장 시작", clie)
	SetInit(clie)
	adbSwipe(700, 300, 50, 300, 50, clie) ;오른쪽으로 화면이동
	sleep 500
	adbClick(424, 368, clie) 
PvPReady:
	r:=ImgFind("Image\pvp\start.bmp", clie, 10,500)
	if(r<0) {
		printVclie("Error. 투기장입장 실패, 종료", clie)
		SetInit(clie)
		SB_SetText("대기")
		return
	}

	adbClick(622, 471, clie)
	r:=ImgFind("Image\pvp\ready.bmp", clie, 10,500)
	if (r<0) {
		printVclie("Error: 대전 준비가 안됨. 다시 대전 시도", clie)
		Goto, PvPReady
	}
	adbClick(548, 470, clie) ; 대전신청
	
	r:=ImgFind("Image\pvp\noTicket.bmp", clie, 3,500)
	if (r=1) {
		SetInit(clie)
		SB_SetText("대기")
		return
	}
	
	r:=Img2Find("Image\pvp\fightOn.bmp","Image\pvp\ai.bmp", clie,100,1000)
	if (r = 2) {
		adbClick(480, 493, clie)
		r:=ImgFind("Image\pvp\fightOn.bmp",clie,30,1000)
	}
	else if(r<0) {
		printVclie("Error: 매칭 실패. 다시 투기장 시도", clie)
		Goto, PvPStart
	}
	adbClick(34, 485, clie)
	
		
	r:=Img2Find("Image\pvp\fightEnd.bmp","Image\pvp\levelChange.bmp", clie, 300,1000)
	if(r=2) {
		adbClick(402, 413, clie) ;확인 클릭
		adbClick(402, 372, clie) ;확인 클릭
	}
	adbClick(657, 468, clie) ;문표시 클릭
	Goto, PvpReady
}


Buzok(clie)
{
	SB_SetText("부족 수행중")
	if (CheckOpt(clie) < 0) {
		printVclie("체크해제 되어있음", clie)
		SB_SetText("대기")
		return
	}
	
BuzokStart:
	printVclie("부족 시작", clie)
	SetInit(clie)
	adbSwipe(50, 300, 700, 300, 50, clie) ;왼쪽으로 화면이동
	sleep 500
	adbSwipe(50, 300, 700, 300, 50, clie) ;왼쪽으로 화면이동
	sleep 500
	adbClick(314, 294, clie) ;부족 클릭


	sleep 3000
	r:=Img2Find("Image\buzok\chulcheck.bmp","Image\buzok\cowork.bmp",clie, 10,500) ;출첵이나 이미 입장했느냐
	if (r=1) {
		r:=ImgFind("Image\buzok\cowork.bmp", clie, 5,500) ;
		if(r = 1) {
			adbClick(404, 298, clie) ;보상 열기
			r:=ImgFind("Image\buzok\coworkConfirm.bmp", clie, 12,500) ;확인
			adbClick(401, 442, clie) ; 보상 확인
			r:=ImgFind("Image\buzok\chulcheck.bmp.bmp", clie, 10, 500) ;확인
			adbClick(644, 119, clie) ;출첵창닫기
			r:=ImgFind("Image\buzok\weeklyAward.bmp", clie, 12, 500) ;확인
			adbClick(399, 396, clie) ;
		}
		else {
			adbClick(644, 119, clie) ;출첵창닫기
		}
	}
	else if (r=2) {
		adbClick(404, 298, clie) ;보상 열기
		r:=ImgFind("Image\buzok\coworkConfirm.bmp", clie, 12,500) ;확인
		adbClick(401, 442, clie) ; 보상 확인
		r:=ImgFind("Image\buzok\chulcheck.bmp.bmp", clie, 10, 500) ;확인
		adbClick(644, 119, clie) ;출첵창닫기
		r:=ImgFind("Image\buzok\weeklyAward.bmp", clie, 12, 500) ;확인
		adbClick(399, 396, clie) ;
	}
	
	r:=ImgFind("Image\buzok\start.bmp", clie, 10,500) ;부족 시작화면
	if(r<0) {
		printVclie("Error. 부족 입장 실패. 재시작", clie)
		Goto, BuzokStart
	}
	adbSwipe(700, 300, 50, 300, 50, clie) ;오른쪽으로 화면이동
	sleep 500
	adbSwipe(700, 300, 50, 300, 50, clie) ;오른쪽으로 화면이동
	sleep 500
	adbClick(668, 186, clie) ;펫대여소
	r:=ImgFind("Image\buzok\rent.bmp",clie,12,500)
	if(r<0) {
		printVclie("Error. 펫대여소 입장실패. 재시작", clie)
		Goto, BuzokStart
	}
	adbClick(261, 205, clie) ;되찾기
	r:=ImgFind("Image\buzok\reward.bmp",clie,10,500)
	if(r<0) {
		printVclie("Error. 되찾을 펫이 없음. 대여 닫음", clie)
		Goto, CloseRent
	}
	adbClick(400, 400, clie) ;확인
	r:=ImgFind("Image\buzok\register.bmp",clie,10,500)
	if(r<0) {
		printVclie("Error. 대여 에러. 대여 닫음.", clie)
		Goto, CloseRent
	}
	adbClick(556, 124, clie) ;레벨
	sleep 200
	adbClick(554, 347, clie) ;순발순
	sleep 200
	adbClick(453, 206, clie) ;펫선택
	sleep 200
	adbClick(253, 205, clie) ;등록하기
	sleep 200
CloseRent:
	adbClick(693, 73, clie) ;x 클릭
	r:=ImgFind("Image\buzok\start.bmp", clie, 10,500) ;부족 시작화면
	if(r<0) {
		printVclie("Error. 대여 닫는 과정에서 에러. 재시작.", clie)
		Goto, BuzokStart
	}
	sleep 2000
	adbSwipe(50, 300, 700, 300, 50, clie) ;왼쪽으로 화면이동
	sleep 1000
	adbClick(537, 370, clie) ;부족원정대
	
FstRegion:
	r:=ImgFind("Image\buzok\wonjung.bmp",clie,15,500)
	if(r<0) {
		printVclie("Error. 원정대 입장 실패. 종료", clie)
		SetInit(clie)
		SB_SetText("대기")
		return
	}
	sleep 1000
	adbClick(207, 266, clie) ;1지역입장
	r:=Img3Find("Image\buzok\ready.bmp","Image\buzok\another.bmp","Image\buzok\noWon.bmp",clie,10,500)
	if(r=2) {
		printVclie("다른부족원 수행중. 지역 하나 넘어감.", clie)
		adbClick(401, 352, clie) ;확인
		Goto, SndRegion
	}
	else if(r=3) {
		SetInit(clie)
		SB_SetText("대기")
		return
	}
	else if(r<0) {
		printVclie("Error. 원정대 지역 입장 실패. 종료", clie)
		SetInit(clie)
		SB_SetText("대기")
		return
	}
FstRegion2:
	r:=ImgFind("Image\buzok\ready.bmp",clie,10,500)	
	if(r<0) {
		printVclie("Error. 원정대 지역 입장 실패. 종료", clie)
		SetInit(clie)
		SB_SetText("대기")
		return
	}
	r:=ImgFind("Image\buzok\already.bmp",clie,2,500)	
	if(r=1) {
		adbClick(33, 65, clie) ;뒤로가기
		Goto, SndRegion
	}
	r:=Img3Find("Image\buzok\1_10_in.bmp","Image\buzok\2_10_in.bmp","Image\buzok\3_10_in.bmp",clie,1,1000)
	if (r>0) {
		printVclie("10지역임을 확인", clie)
		adbClick(618, 475, clie) ; 준비
		r:=ImgFind("Image\buzok\teamSet.bmp",clie,5,500) ;팀설정
		adbClick(132, 165, clie) ; 펫빼기
		adbClick(239, 165, clie) ; 펫빼기
		adbClick(353, 165, clie) ; 펫빼기
		adbClick(132, 288, clie) ; 펫빼기
		adbClick(240, 288, clie) ; 펫빼기
		sleep 500
		adbClick(564, 474, clie) ; 1팀완료
		r:=ImgFind("Image\buzok\team2.bmp",clie,5,500) ;팀설정
		adbClick(132, 165, clie) ; 펫빼기
		adbClick(239, 165, clie) ; 펫빼기
		adbClick(353, 165, clie) ; 펫빼기
		adbClick(132, 288, clie) ; 펫빼기
		adbClick(240, 288, clie) ; 펫빼기
		sleep 500
		adbClick(564, 474, clie) ; 2팀완료
		r:=ImgFind("Image\buzok\team3.bmp",clie,5,500) ;팀설정
		adbClick(132, 165, clie) ; 펫빼기
		adbClick(239, 165, clie) ; 펫빼기
		adbClick(353, 165, clie) ; 펫빼기
		adbClick(132, 288, clie) ; 펫빼기
		adbClick(240, 288, clie) ; 펫빼기
		sleep 500
		adbClick(564, 474, clie) ; 전투시작
		r:=ImgFind("Image\buzok\readyCannot.bmp",clie,3,500) ;이미 다른부족원
		if(r=1) {
			printVclie("이미 다른부족원 수행중. 지역 하나 넘어감.", clie)
			sleep 1000
			adbClick(31,61, clie) ; 뒤로가기
			Goto, SndRegion
		}
	}
	else {
		adbClick(618, 475, clie) ; 준비
		r:=ImgFind("Image\buzok\teamSet.bmp",clie,5,500) ;팀설정
		adbClick(246, 377, clie) ; 자동배치
		sleep 500
		adbClick(564, 474, clie) ; 1팀완료
		r:=ImgFind("Image\buzok\team2.bmp",clie,5,500) ;팀설정
		adbClick(246, 377, clie) ; 자동배치
		sleep 500
		adbClick(564, 474, clie) ; 2팀완료
		r:=ImgFind("Image\buzok\team3.bmp",clie,5,500) ;팀설정
		adbClick(246, 377, clie) ; 자동배치
		sleep 500
		adbClick(564, 474, clie) ; 전투시작
		r:=ImgFind("Image\buzok\readyCannot.bmp",clie,3,500) ;이미 다른부족원
		if(r=1) {
			printVclie("이미 다른부족원 수행중. 지역 하나 넘어감.", clie)
			sleep 1000
			adbClick(31,61, clie) ; 뒤로가기
			Goto, SndRegion
		}
	}
	r:=ImgFind("Image\buzok\fighting.bmp",clie,17,1000)
	if (r<0) {
		printVclie("진입 실패. 이미 다른 부족원 수행중인듯. 지역하나 넘어감.", clie)
		sleep 500
		adbClick(31,61, clie) ; 뒤로가기
		Goto, SndRegion
	}
	printVclie("지역 전투중", clie)
	r:=Img2Find("Image\buzok\endFight.bmp","Image\buzok\clear.bmp",clie,300,1000) ;전투종료
	sleep 1000
	adbClick(628, 373, clie) ; 상자까기
	r:=ImgFind("Image\buzok\perl.bmp",clie,6,500) ;상자깜
	adbClick(661, 457, clie) ; 나감
	Goto, FstRegion2
		
SndRegion:
	r:=ImgFind("Image\buzok\wonjung.bmp",clie,15,500)
	if(r<0) {
		printVclie("Error. 원정대 입장 실패. 종료", clie)
		SetInit(clie)
		SB_SetText("대기")
		return
	}
	sleep 1000
	adbClick(449, 266, clie) ;2지역입장
	r:=Img3Find("Image\buzok\ready.bmp","Image\buzok\another.bmp","Image\buzok\noWon.bmp",clie,10,500)
	if(r=2) {
		printVclie("다른부족원 수행중. 지역 하나 넘어감.", clie)
		adbClick(401, 352, clie) ;확인
		Goto, SndRegion
	}
	else if(r=3) {
		SetInit(clie)
		SB_SetText("대기")
		return
	}
	else if(r<0) {
		printVclie("Error. 원정대 지역 입장 실패. 종료", clie)
		SetInit(clie)
		SB_SetText("대기")
		return
	}
SndRegion2:
	r:=ImgFind("Image\buzok\ready.bmp",clie,10,500)	
	if(r<0) {
		printVclie("Error. 원정대 지역 입장 실패. 종료", clie)
		SetInit(clie)
		SB_SetText("대기")
		return
	}
	r:=ImgFind("Image\buzok\already.bmp",clie,2,500)	
	if(r=1) {
		adbClick(33, 65, clie) ;뒤로가기
		Goto, ThdRegion
	}
	r:=Img3Find("Image\buzok\1_10_in.bmp","Image\buzok\2_10_in.bmp","Image\buzok\3_10_in.bmp",clie,1,1000)
	if (r>0) {
		printVclie("10지역임을 확인", clie)
		adbClick(618, 475, clie) ; 준비
		r:=ImgFind("Image\buzok\teamSet.bmp",clie,5,500) ;팀설정
		adbClick(132, 165, clie) ; 펫빼기
		adbClick(239, 165, clie) ; 펫빼기
		adbClick(353, 165, clie) ; 펫빼기
		adbClick(132, 288, clie) ; 펫빼기
		adbClick(240, 288, clie) ; 펫빼기
		sleep 500
		adbClick(564, 474, clie) ; 1팀완료
		r:=ImgFind("Image\buzok\team2.bmp",clie,5,500) ;팀설정
		adbClick(132, 165, clie) ; 펫빼기
		adbClick(239, 165, clie) ; 펫빼기
		adbClick(353, 165, clie) ; 펫빼기
		adbClick(132, 288, clie) ; 펫빼기
		adbClick(240, 288, clie) ; 펫빼기
		sleep 500
		adbClick(564, 474, clie) ; 2팀완료
		r:=ImgFind("Image\buzok\team3.bmp",clie,5,500) ;팀설정
		adbClick(132, 165, clie) ; 펫빼기
		adbClick(239, 165, clie) ; 펫빼기
		adbClick(353, 165, clie) ; 펫빼기
		adbClick(132, 288, clie) ; 펫빼기
		adbClick(240, 288, clie) ; 펫빼기
		sleep 500
		adbClick(564, 474, clie) ; 전투시작
		r:=ImgFind("Image\buzok\readyCannot.bmp",clie,3,500) ;이미 다른부족원
		if(r=1) {
			printVclie("이미 다른부족원 수행중. 지역 하나 넘어감.", clie)
			sleep 1000
			adbClick(31,61, clie) ; 뒤로가기
			Goto, ThdRegion
		}
	}
	else {
		adbClick(618, 475, clie) ; 준비
		r:=ImgFind("Image\buzok\teamSet.bmp",clie,5,500) ;팀설정
		adbClick(246, 377, clie) ; 자동배치
		sleep 500
		adbClick(564, 474, clie) ; 1팀완료
		r:=ImgFind("Image\buzok\team2.bmp",clie,5,500) ;팀설정
		adbClick(246, 377, clie) ; 자동배치
		sleep 500
		adbClick(564, 474, clie) ; 2팀완료
		r:=ImgFind("Image\buzok\team3.bmp",clie,5,500) ;팀설정
		adbClick(246, 377, clie) ; 자동배치
		sleep 500
		adbClick(564, 474, clie) ; 전투시작
		r:=ImgFind("Image\buzok\readyCannot.bmp",clie,3,500) ;이미 다른부족원
		if(r=1) {
			printVclie("이미 다른부족원 수행중. 지역 하나 넘어감.", clie)
			sleep 1000
			adbClick(31,61, clie) ; 뒤로가기
			Goto, ThdRegion
		}
	}
	r:=ImgFind("Image\buzok\fighting.bmp",clie,17,1000)
	if (r<0) {
		printVclie("진입 실패. 이미 다른 부족원 수행중인듯. 지역하나 넘어감.", clie)
		sleep 500
		adbClick(31,61, clie) ; 뒤로가기
		Goto, ThdRegion
	}
	printVclie("지역 전투중", clie)
	r:=Img2Find("Image\buzok\endFight.bmp","Image\buzok\clear.bmp",clie,300,1000) ;전투종료
	sleep 1000
	adbClick(628, 373, clie) ; 상자까기
	r:=ImgFind("Image\buzok\perl.bmp",clie,6,500) ;상자깜
	adbClick(661, 457, clie) ; 나감
	Goto, SndRegion2
	
ThdRegion:
	r:=ImgFind("Image\buzok\wonjung.bmp",clie,15,500)
	if(r<0) {
		printVclie("Error. 원정대 입장 실패. 종료", clie)
		SetInit(clie)
		SB_SetText("대기")
		return
	}
	sleep 1000
	adbClick(640, 266, clie) ;3지역입장
	r:=Img3Find("Image\buzok\ready.bmp","Image\buzok\another.bmp","Image\buzok\noWon.bmp",clie,10,500)
	if(r=2) {
		printVclie("다른부족원 수행중. 지역 하나 넘어감.", clie)
		adbClick(401, 352, clie) ;확인
		Goto, EndRegion
	}
	else if(r=3) {
		SetInit(clie)
		SB_SetText("대기")
		return
	}
	else if(r<0) {
		printVclie("Error. 원정대 지역 입장 실패. 종료", clie)
		SetInit(clie)
		SB_SetText("대기")
		return
	}
ThdRegion2:
	r:=ImgFind("Image\buzok\ready.bmp",clie,10,500)	
	if(r<0) {
		printVclie("Error. 원정대 지역 입장 실패. 종료", clie)
		SetInit(clie)
		SB_SetText("대기")
		return
	}
	r:=ImgFind("Image\buzok\already.bmp",clie,2,500)	
	if(r=1) {
		adbClick(33, 65, clie) ;뒤로가기
		Goto, EndRegion
	}
	r:=Img3Find("Image\buzok\1_10_in.bmp","Image\buzok\2_10_in.bmp","Image\buzok\3_10_in.bmp",clie,1,1000)
	if (r>0) {
		printVclie("10지역임을 확인", clie)
		adbClick(618, 475, clie) ; 준비
		r:=ImgFind("Image\buzok\teamSet.bmp",clie,5,500) ;팀설정
		adbClick(132, 165, clie) ; 펫빼기
		adbClick(239, 165, clie) ; 펫빼기
		adbClick(353, 165, clie) ; 펫빼기
		adbClick(132, 288, clie) ; 펫빼기
		adbClick(240, 288, clie) ; 펫빼기
		sleep 500
		adbClick(564, 474, clie) ; 1팀완료
		r:=ImgFind("Image\buzok\team2.bmp",clie,5,500) ;팀설정
		adbClick(132, 165, clie) ; 펫빼기
		adbClick(239, 165, clie) ; 펫빼기
		adbClick(353, 165, clie) ; 펫빼기
		adbClick(132, 288, clie) ; 펫빼기
		adbClick(240, 288, clie) ; 펫빼기
		sleep 500
		adbClick(564, 474, clie) ; 2팀완료
		r:=ImgFind("Image\buzok\team3.bmp",clie,5,500) ;팀설정
		adbClick(132, 165, clie) ; 펫빼기
		adbClick(239, 165, clie) ; 펫빼기
		adbClick(353, 165, clie) ; 펫빼기
		adbClick(132, 288, clie) ; 펫빼기
		adbClick(240, 288, clie) ; 펫빼기
		sleep 500
		adbClick(564, 474, clie) ; 전투시작
		r:=ImgFind("Image\buzok\readyCannot.bmp",clie,3,500) ;이미 다른부족원
		if(r=1) {
			printVclie("이미 다른부족원 수행중. 지역 하나 넘어감.", clie)
			sleep 1000
			adbClick(31,61, clie) ; 뒤로가기
			Goto, EndRegion
		}
	}
	else {
		adbClick(618, 475, clie) ; 준비
		r:=ImgFind("Image\buzok\teamSet.bmp",clie,5,500) ;팀설정
		adbClick(246, 377, clie) ; 자동배치
		sleep 500
		adbClick(564, 474, clie) ; 1팀완료
		r:=ImgFind("Image\buzok\team2.bmp",clie,5,500) ;팀설정
		adbClick(246, 377, clie) ; 자동배치
		sleep 500
		adbClick(564, 474, clie) ; 2팀완료
		r:=ImgFind("Image\buzok\team3.bmp",clie,5,500) ;팀설정
		adbClick(246, 377, clie) ; 자동배치
		sleep 500
		adbClick(564, 474, clie) ; 전투시작
		r:=ImgFind("Image\buzok\readyCannot.bmp",clie,3,500) ;이미 다른부족원
		if(r=1) {
			printVclie("이미 다른부족원 수행중. 지역 하나 넘어감.", clie)
			sleep 1000
			adbClick(31,61, clie) ; 뒤로가기
			Goto, EndRegion
		}
	}
	r:=ImgFind("Image\buzok\fighting.bmp",clie,17,1000)
	if (r<0) {
		printVclie("진입 실패. 이미 다른 부족원 수행중인듯. 지역하나 넘어감.", clie)
		sleep 500
		adbClick(31,61, clie) ; 뒤로가기
		Goto, EndRegion
	}
	printVclie("지역 전투중", clie)
	r:=Img2Find("Image\buzok\endFight.bmp","Image\buzok\clear.bmp",clie,300,1000) ;전투종료
	sleep 1000
	adbClick(628, 373, clie) ; 상자까기
	r:=ImgFind("Image\buzok\perl.bmp",clie,6,500) ;상자깜
	adbClick(661, 457, clie) ; 나감
	Goto, ThdRegion2
	
EndRegion:
	SetInit(clie)
	SB_SetText("대기")
	return
}

Quest(clie)
{
	SB_SetText("퀘스트 수행중")
	if (CheckOpt(clie) < 0) {
		printVclie("체크해제 되어있음. 대기로 전환.", clie)
		SB_SetText("대기")
		return
	}
	printVclie("퀘스트 시작", clie)
	SetInit(clie)
	adbClick(758, 465, clie) ;입장
FindNew:
	r:=ImgFind("Image\quest\start.bmp", clie, 5,500) ;
	r:=ImgFind("Image\quest\new.bmp", clie, 2,500) ;완료퀘스트
	if (r<0) {
		SetInit(clie)
		SB_SetText("대기")
		return
	}
	adbClick(681, 173, clie)
	r:=ImgFind("Image\quest\confirm.bmp", clie, 5,500) ; 확인
	if (r<0) {
		printVclie("확인안뜸", clie)
	}
	adbClick(399, 376, clie)
	Goto, FindNew
}


PetPvP(clie)
{
	SB_SetText("펫대전 수행중")
	if (CheckOpt(clie) < 0) {
		printVclie("체크해제 되어있음. 대기로 전환.", clie)
		SB_SetText("대기")
		return
	}
	printVclie("펫대전 시작", clie)
	SetInit(clie)
	adbSwipe(700, 300, 50, 300, 50, clie) ;오른쪽으로 화면이동
	sleep 500
	adbClick(42, 335, clie) ;입장
	
	r:=Img2Find("Image\petpvp\start.bmp", "Image\petpvp\reward.bmp", clie, 5,500) ;
	if(r=2) {
		adbClick(400, 400, clie) ;확인
		sleep 1000
	}
	else if (r<0) {
		printVclie("리그 참여 대기 시간 쿨타임이라 미수행하고 종료", clie)
		SetInit(clie)
		SB_SetText("대기")
		return
	}
	
	adbClick(701, 431, clie) ;리그
	r:=ImgFind("Image\petpvp\challenge.bmp", clie, 5,500) ; 
	if (r<0) {
		printVclie("Error. 리그 참가 실패. 종료", clie)
		SetInit(clie)
		SB_SetText("대기")
		return
	}
	adbClick(320, 400, clie) ;도전
	r:=ImgFind("Image\petpvp\ready.bmp", clie, 5,500) ; 
	if (r<0) {
		printVclie("Error. 준비 실패. 티켓부족일 가능성 큼. 종료", clie)
		SetInit(clie)
		SB_SetText("대기")
		return
	}
	adbClick(552, 467, clie) ;펫 대전
PetPvPStart:
	r:=Img3Find("Image\petpvp\win.bmp","Image\petpvp\lose.bmp","Image\petpvp\error.bmp", clie, 300,1000) ; 
	if(r=1) {
		adbClick(405, 274, clie) ;상자클릭
		adbClick(405, 274, clie) ;상자클릭
		k:=ImgFind("Image\petpvp\opened.bmp", clie, 5,500) ;
		if(k<0) {
			printVclie("Error. 상자 안까짐, 다시 까봄.", clie)
			adbClick(405, 274, clie) ;상자클릭
			sleep 1000
			adbClick(405, 274, clie) ;상자클릭
		}
		adbClick(405, 441, clie) ;확인클릭
		k:=ImgFind("Image\petpvp\final.bmp", clie, 5,500) ;
		adbClick(346, 464, clie) ; 홈키클릭		
	}
	else if(r=2) {
		adbClick(346, 464, clie) ; 홈키클릭	
	}
	else if(r=3) {
		adbClick(396, 353, clie) ;확인클릭
		Goto, PetPvPStart
	}
	else if(r<0) {
		printVclie("Error. 펫 대전 완료 실패. 종료", clie)
		SetInit(clie)
		SB_SetText("대기")
		return
	}
	
	SB_SetText("대기")
	return
}


SetInit(clie) 
{
	while(1) {
		r := Img2Find("Image\petdon\icon.bmp","Image\hottime\petMan.bmp", clie, 1, 1000) ;초기 화면인지 확인
		if (r<0) {
			k:=ImgFind("Image\mohum\giveup.bmp",clie,1,1000)
			if(k>0) {
				adbClick(330, 353, clie)
				
				adbClick(132, 165, clie) ; 전투시작
				adbClick(239, 165, clie) ; 전투시작
				adbClick(353, 165, clie) ; 전투시작
				adbClick(132, 288, clie) ; 전투시작
				adbClick(240, 288, clie) ; 전투시작
				sleep 200
				adbClick(607, 470, clie) ; 전투시작
				
				m:=ImgFind("Image\raid\use.bmp",clie,5,500)
				if (m<0) {
					printVclie("Error. 레이드 시작에 문제. 종료", clie)
					SB_SetText("대기")
					SetInit(clie)
					return
				}
				adbClick(470, 354, clie) ; 전투시작
				r:=ImgFind("Image\mohum\endRaid.bmp", clie, 100,1000) ; 전투완료 기다리기
				SetInit(clie)
			}
			
			
			adbKey(4,clie)
			sleep 1000
		}
		else if(r=1) {
			sleep 500
			return
		}
		else if(r=2) {
			adbSwipe(700, 300, 50, 300, 50, clie) ;오른쪽으로 화면이동
		}
	}
}


GSearch(img, clie)
{
	global obj1, obj2, obj3, obj4, dev1IP, dev2IP, dev3IP, dev4IP
	global vx:=0, vy:=0
	
	if(clie = 1) {
		obj := obj1
		devIP := dev1IP
		bg := "bg1.bmp"
	}
	else if (clie = 2) {
		obj := obj2
		devIP := dev2IP
		bg := "bg2.bmp"
	}
	else if (clie = 3) {
		obj := obj3
		devIP := dev3IP
		bg := "bg3.bmp"
	}
	else if (clie = 4) {
		obj := obj4
		devIP := dev4IP
		bg := "bg4.bmp"
	}
	cardbg := "/sdcard/" . bg
	imgbg := "Image\" . bg
	
	RunWait, nox_adb.exe -s %devIP% shell screencap -p %cardbg%, % obj.path, Hide 
	RunWait, nox_adb.exe -s %devIP% pull %cardbg% %A_ScriptDir%\Image, % obj.path, Hide 
 	
	gdipToken := Gdip_Startup()
	bmpHaystack := Gdip_CreateBitmapFromFile(imgbg)
	bmpNeedle := Gdip_CreateBitmapFromFile(img)
		
	result := Gdip_ImageSearch(bmpHaystack, bmpNeedle, GXY,0,0,0,0,30)
	Gdip_DisposeImage(bmpHaystack)
	Gdip_DisposeImage(bmpNeedle)
	Gdip_Shutdown(gdipToken)
	StringSplit, gxy, GXY,`,
	vx := gxy1
	vy := gxy2
	return result
}

ImgFind(img, clie, rep=3, sleepT=1000)
{
	while(1)
	{
		if(GSearch(img, clie) = 1) {
			return 1
		}
		rep := rep-1
		if(rep<1) {
			return -1
		}
		sleep sleepT
	}
}

Img2Find(img, img2, clie, rep=3, sleepT=1000)
{
	while(1)
	{
		if(GSearch(img, clie) = 1) {
			return 1
		}
		if(GSearch(img2, clie) = 1) {
			return 2
		}
		rep := rep-1
		if(rep<1) {
			return -1
		}
		sleep sleepT
	}
}

Img3Find(img, img2, img3, clie, rep=3, sleepT=1000)
{
	while(1)
	{
		if(GSearch(img, clie) = 1) {
			return 1
		}
		if(GSearch(img2, clie) = 1) {
			return 2
		}
		if(GSearch(img3, clie) = 1) {
			return 3
		}
		rep := rep-1
		if(rep<1) {
			return -1
		}
		sleep sleepT
	}
}

WaitUntilImgShow_Click(img, x, y, clie)
{
	while (1)
	{
		sleep 300
		adbClick(x,y,clie)
		if(GSearch(img, clie) = 1) {
			return 1
		}
	}
}

WaitUntil2ImgShow_Click(img,img2, x, y, clie)
{
	while (1)
	{
		sleep 1000
		adbClick(x,y,clie)
		if(GSearch(img, clie) = 1) {
			return 1
		}
		if(GSearch(img2, clie) = 1) {
			return 2
		}
	}
}





adbClick(adbx, adby, clie)
{
	global obj1, obj2, obj3, obj4, dev1IP, dev2IP, dev3IP, dev4IP

	if(clie = 1) {
		obj := obj1
		devIP := dev1IP
	}
	else if (clie = 2) {
		obj := obj2
		devIP := dev2IP
	}
	else if (clie = 3) {
		obj := obj3
		devIP := dev3IP
	}
	else if (clie = 4) {
		obj := obj4
		devIP := dev4IP
	}	
	x := adbx - 2
	y := adby - 36
	
	RunWait, nox_adb.exe -s %devIP% shell input tap %x% %y%, % obj.path, Hide  
	return
}

adbKey(key, clie)
{
	global obj1, obj2, obj3, obj4, dev1IP, dev2IP, dev3IP, dev4IP

	if(clie = 1) {
		obj := obj1
		devIP := dev1IP
	}
	else if (clie = 2) {
		obj := obj2
		devIP := dev2IP
	}
	else if (clie = 3) {
		obj := obj3
		devIP := dev3IP
	}
	else if (clie = 4) {
		obj := obj4
		devIP := dev4IP
	}
	RunWait, nox_adb.exe -s %devIP% shell input keyevent %key%, % obj.path, Hide  
	return
}

adbSwipe(adbx1, adby1, adbx2, adby2, vel, clie)
{
	global obj1, obj2, obj3, obj4, dev1IP, dev2IP, dev3IP, dev4IP

	if(clie = 1) {
		obj := obj1
		devIP := dev1IP
	}
	else if (clie = 2) {
		obj := obj2
		devIP := dev2IP
	}
	else if (clie = 3) {
		obj := obj3
		devIP := dev3IP
	}
	else if (clie = 4) {
		obj := obj4
		devIP := dev4IP
	}
		
	x1 := adbx1 - 2
	y1 := adby1 - 36
	x2 := adbx2 - 2
	y2 := adby2 - 36
	
	RunWait, nox_adb.exe -s %devIP% shell input swipe %x1% %y1% %x2% %y2% %vel%, % obj.path, Hide  
	return
}

printV(Text) 
{
	global hOut
    static Start, Stop ; remember positions
	Text := Text . "`n"
    SendMessage, 0xB1, &Start, &Stop,, ahk_id %hOut% ; EM_SETSEL
    SendMessage, 0xC2,       , &Text,, ahk_id %hOut% ; EM_REPLACESEL
}

printVclie(Text, clie) 
{
	global hOut
    static Start, Stop ; remember positions
	Text := "[" . clie . "클라] " . Text . "`n"
    SendMessage, 0xB1, &Start, &Stop,, ahk_id %hOut% ; EM_SETSEL
    SendMessage, 0xC2,       , &Text,, ahk_id %hOut% ; EM_REPLACESEL
}

CheckOpt(clie)
{
	global Opt1, Opt2, Opt3, Opt4
	GuiControlGet, Opt1
	GuiControlGet, Opt2
	GuiControlGet, Opt3
	GuiControlGet, Opt4
	
	if(clie = 1) {
		if(Opt1 = 0)  
			return -1
	}
	else if(clie = 2) {
		if(Opt2 = 0)  
			return -1
	}
	else if(clie = 3) {
		if(Opt3 = 0)  
			return -1
	}
	else if(clie = 4) {
		if(Opt4 = 0)  
			return -1
	}
	return 1
	
}