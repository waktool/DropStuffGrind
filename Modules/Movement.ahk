#Requires AutoHotkey v2.0  ; Ensures the script runs only on AutoHotkey version 2.0, which supports the syntax and functions used in this script.

; ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰
; MOVEMENT/PATHS CONFIGURATION FILE
; ----------------------------------------------------------------------------------------
; This file contains all of the character movement paths to various areas within the game.
; ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰


; ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰
; GLOBAL VARIABLES
; ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰

SHINY_HOVERBOARD_MODIFIER := (GetSetting("HasShinyHoverboard", "Settings") = "true") ? 20 / 27 : 1 ; Calculate a modifier for shiny hoverboard use.

DIRECTION := Map()
DIRECTION.Default := ""
DIRECTION["Up"] := "Up"
DIRECTION["Down"] := "Down"
DIRECTION["Left"] := "A"
DIRECTION["Right"] := "D"

; ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰
; MOVEMENT VARIABLES
; ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰

; ----------------------------------------------------------------------------------------
; moveToCentreOfTheBestZone Function
; Description: Moves the character to the center of the best zone.
; ----------------------------------------------------------------------------------------
moveToCentreOfTheBestZone() {
    ; Modify the current status to indicate moving to the zone center.
    setCurrentAction("Moving To Zone Centre")
    
    clickHoverboard(true)
    stabiliseHoverboard(DIRECTION["Up"])

    ; ========================================
    ; Edit the following in need.
    ; ========================================
    moveDirection(DIRECTION["Up"], 900 * SHINY_HOVERBOARD_MODIFIER)
    ; ========================================
    
    clickHoverboard(false)

    ; Modify the current status back to default.
    setCurrentAction("-")
}


; ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰
; MOVEMENT FUNCTIONS
; ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰

; ----------------------------------------------------------------------------------------
; moveUpLeft Function
; Description: Simulates moving diagonally up-left by pressing and holding the 'w' and 'a' keys.
; Parameters:
;   - milliseconds: Duration to hold the 'w' and 'a' keys.
; Operation:
;   - Presses and holds both the 'w' and 'a' keys, sleeps for specified milliseconds, then releases the keys.
; Return: None; directly interacts with keyboard inputs.
; ----------------------------------------------------------------------------------------
moveUpLeft(milliseconds) {
    Send "{w down}{a down}"
    Sleep milliseconds
    Send "{w up}{a up}"
}

; ----------------------------------------------------------------------------------------
; moveUpRight Function
; Description: Simulates moving diagonally up-right by pressing and holding the 'w' and 'd' keys.
; Parameters:
;   - milliseconds: Duration to hold the 'w' and 'd' keys.
; Operation:
;   - Presses and holds both the 'w' and 'd' keys, sleeps for specified milliseconds, then releases the keys.
; Return: None; directly interacts with keyboard inputs.
; ----------------------------------------------------------------------------------------
moveUpRight(milliseconds) {
    Send "{w down}{d down}"
    Sleep milliseconds
    Send "{w up}{d up}"
}

; ----------------------------------------------------------------------------------------
; moveDownLeft Function
; Description: Simulates moving diagonally down-left by pressing and holding the 's' and 'a' keys.
; Parameters:
;   - milliseconds: Duration to hold the 's' and 'a' keys.
; Operation:
;   - Presses and holds both the 's' and 'a' keys, sleeps for specified milliseconds, then releases the keys.
; Return: None; directly interacts with keyboard inputs.
; ----------------------------------------------------------------------------------------
moveDownLeft(milliseconds) {
    Send "{s down}{a down}"
    Sleep milliseconds
    Send "{s up}{a up}"
}

; ----------------------------------------------------------------------------------------
; moveDownRight Function
; Description: Simulates moving diagonally down-right by pressing and holding the 's' and 'd' keys.
; Parameters:
;   - milliseconds: Duration to hold the 's' and 'd' keys.
; Operation:
;   - Presses and holds both the 's' and 'd' keys, sleeps for specified milliseconds, then releases the keys.
; Return: None; directly interacts with keyboard inputs.
; ----------------------------------------------------------------------------------------
moveDownRight(milliseconds) {
    Send "{s down}{d down}"
    Sleep milliseconds
    Send "{s up}{d up}"
}

; ---------------------------------------------------------------------------------
; stabiliseHoverboard Function
; Description: Simulates pressing a movement key three times with short intervals and then waits for 1000 milliseconds to stabilize the hoverboard.
; Operation:
;   - Loops three times to send a key down event, wait for a short interval, and send a key up event.
;   - Waits for 1000 milliseconds after the loop to allow the hoverboard to stabilize.
; Dependencies:
;   - Send: AHK command to send key events.
;   - Sleep: AHK command to pause execution for a specified duration.
; Return: None; the function stabilizes the hoverboard by simulating key presses.
; ---------------------------------------------------------------------------------
stabiliseHoverboard(moveKey) {
    Loop 3 {
        Send "{" moveKey " down}"  ; Send the key down event for the specified movement key.
        Sleep 10  ; Wait for 10 milliseconds.
        Send "{" moveKey " up}"  ; Send the key up event to stop the movement.
    }
    Sleep 1000  ; Wait for 1000 milliseconds to stabilize the hoverboard.
}

; ---------------------------------------------------------------------------------
; moveDirection Function
; Description: Simulates movement by sending a key down event, waiting for a specified time, and then sending a key up event.
; Operation:
;   - Sends a key down event for the specified movement key.
;   - Waits for the specified duration in milliseconds.
;   - Sends a key up event to stop the movement.
; Dependencies:
;   - Send: AHK command to send key events.
;   - Sleep: AHK command to pause execution for a specified duration.
; Return: None; the function simulates movement by pressing and releasing a key.
; ---------------------------------------------------------------------------------
moveDirection(moveKey, timeMs) {
    Send "{" moveKey " down}"  ; Send the key down event for the specified movement key.
    Sleep timeMs  ; Wait for the specified duration in milliseconds.
    Send "{" moveKey " up}"  ; Send the key up event to stop the movement.
}