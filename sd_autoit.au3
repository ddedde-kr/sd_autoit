#include <MsgBoxConstants.au3>
#include <ImageSearch.au3>
HotKeySet("^{F3}", "stop")

global $y = 0, $x = 0



;~ $prompt_value = "{{{{masterpiece}}}},   rabbit"

$number_of_iterations = 5   ;; 반복 횟수

$Generate_button = "Generate.png" ;; 이미지 생성 버튼 이미지

$wait_name = "wait.png"   ;;; 대기 이미지

$save_button = "save.png"   ;; 저장 버튼 이미지

$wait_time = 5    ;; 이미지 생성 시간


__main__()


Func __main__()
	For $i = $number_of_iterations To 1 Step -1
;~ 		click_image($prompt_button) ;;; 이미지 생성 프롬프트 입력
;~ 		send_text($text_value)  ;;; 이미지 생성 프롬프트 입력

		click_image($Generate_button) ;;; 이미지 생성 클릭
		wait_image()
		Sleep(1000)
		click_image($save_button) ;;; 저장하기 버튼
		Sleep(1000)
	Next
EndFunc


Func send_text($text_value)
	ClipPut($text_value)
	Send("^v")
EndFunc

Func wait_image()
	For $i = $wait_time To 1 Step -1
		$Search_temp = _ImageSearchArea(@ScriptDir & "\Image_Folder\" & $wait_name ,0,   0  , 	0	,@DesktopWidth  ,	 @DesktopHeight  ,$x , $y, 9 )
		if $Search_temp = 1 Then
			ExitLoop
			Return True
		EndIf
		Sleep(1000)
	Next
EndFunc



Func click_image($image_file_name)
	$Search_temp = _ImageSearchArea(@ScriptDir & "\Image_Folder\" & $image_file_name ,0,   0  , 	0	,@DesktopWidth  ,	 @DesktopHeight  ,$x , $y, 5 )
	if $Search_temp = 1 Then
		MouseClick("left" ,$x + 18, $y + 18  )
		sleep(1000)
	Else
	EndIf
EndFunc

;~ 이미지를 순차적으로 찍고 머지 하기
Func stop()
	Exit
EndFunc
