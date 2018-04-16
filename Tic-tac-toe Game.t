% Swapnil Iqbal

View.Set ("Graphics") 

var moveCount : int %declaring moveCount as an integer

var blocked : boolean := false

var squareNumber : int %declaring squareNumber as an integer

var font1 : int

font1 := Font.New ("comicsans:16")

var success : boolean

%next move win

var winSquare : int

var opponentX, weGofirst, gameReady : boolean

var current_val, opponent_val : char

var opponentWin : boolean := false

%will most likely be replaced by squareNumber

var winX, winY : int

var nextMoveWin : boolean := false

var grid : array 1 .. 9 of char

var mouse, mouseY, mouseX, button, mouseState : int

const oneX := maxx div 2 - 50
const twoX := maxx div 2 + 50
const oneY := maxy div 2 - 50
const twoY := maxy div 2 + 50
const zeroX := maxx div 2 - 150
const zeroY := maxy div 2 - 150
const threeX := maxx div 2 + 150
const threeY := maxy div 2 + 150


procedure emptyBoard (var grid : array 1 .. 9 of char)
    for i : 1 .. 9
	grid (i) := 'e'
    end for
end emptyBoard


procedure intro
    Font.Draw ("Welcome To My Game!", 210, 220, font1, green)
    delay (700)
end intro


procedure gameOptions
    intro
    delay (500)
    cls

    locate (maxrow div 2 - 4, maxcol div 2 - 13)
    Font.Draw ("START GAME", 260, 220, font1, red)
    

    loop
	mousewhere (mouseX, mouseY, button)
	if mouseX > (maxx div 2 - 130 - 100) and mouseX < (maxx div 2 + 130 - 100)
		and mouseY > (maxy div 2 - 130) and mouseY < (maxy div 2 + 130) and button = 1 then
	    weGofirst := true
	    cls
	    locate (maxrow div 2 - 4, maxcol div 2 - 13)
	    Font.Draw ("Let's Start!", 260, 220, font1, red)
	    delay (1000)
	    cls
	    exit

	end if

    end loop

end gameOptions
gameOptions


procedure drawGrid
    Draw.Fill (1, 2, 150, 200)
    %The Horizontal Lines
    Draw.Line ((maxx div 2) - 150, (maxy div 2) - 50, (maxx div 2) + 150, (maxy div 2) - 50, 7)
    Draw.Line ((maxx div 2) - 150, (maxy div 2) + 50, (maxx div 2) + 150, (maxy div 2) + 50, 7)

    %The Vertical Lines
    Draw.Line ((maxx div 2) - 50, (maxy div 2) - 150, (maxx div 2) - 50, (maxy div 2) + 150, 7)
    Draw.Line ((maxx div 2) + 50, (maxy div 2) - 150, (maxx div 2) + 50, (maxy div 2) + 150, 7)
end drawGrid



procedure mmX
    Draw.Line (maxx div 2 - 30, maxy div 2 - 30, maxx div 2 + 30, maxy div 2 + 30, black)
    Draw.Line (maxx div 2 - 30, maxy div 2 + 30, maxx div 2 + 30, maxy div 2 - 30, black)
    %new
    grid (5) := 'x'
end mmX


procedure mlX
    Draw.Line (maxx div 2 - 30 - 100, maxy div 2 - 30, maxx div 2 + 30 - 100, maxy div 2 + 30, black)
    Draw.Line (maxx div 2 - 30 - 100, maxy div 2 + 30, maxx div 2 + 30 - 100, maxy div 2 - 30, black)
    grid (4) := 'x'
end mlX


procedure mrX
    Draw.Line (maxx div 2 - 30 + 100, maxy div 2 - 30, maxx div 2 + 30 + 100, maxy div 2 + 30, black)
    Draw.Line (maxx div 2 - 30 + 100, maxy div 2 + 30, maxx div 2 + 30 + 100, maxy div 2 - 30, black)
    grid (6) := 'x'
end mrX


procedure tmX
    Draw.Line (maxx div 2 - 30, maxy div 2 - 30 + 100, maxx div 2 + 30, maxy div 2 + 30 + 100, black)
    Draw.Line (maxx div 2 - 30, maxy div 2 + 30 + 100, maxx div 2 + 30, maxy div 2 - 30 + 100, black)
    grid (2) := 'x'
end tmX


procedure tlX
    Draw.Line (maxx div 2 - 30 - 100, maxy div 2 - 30 + 100, maxx div 2 + 30 - 100, maxy div 2 + 30 + 100, black)
    Draw.Line (maxx div 2 - 30 - 100, maxy div 2 + 30 + 100, maxx div 2 + 30 - 100, maxy div 2 - 30 + 100, black)
    grid (1) := 'x'
end tlX


procedure trX
    Draw.Line (maxx div 2 - 30 + 100, maxy div 2 - 30 + 100, maxx div 2 + 30 + 100, maxy div 2 + 30 + 100, black)
    Draw.Line (maxx div 2 - 30 + 100, maxy div 2 + 30 + 100, maxx div 2 + 30 + 100, maxy div 2 - 30 + 100, black)
    grid (3) := 'x'
end trX


procedure bmX
    Draw.Line (maxx div 2 - 30, maxy div 2 - 30 - 100, maxx div 2 + 30, maxy div 2 + 30 - 100, black)
    Draw.Line (maxx div 2 - 30, maxy div 2 + 30 - 100, maxx div 2 + 30, maxy div 2 - 30 - 100, black)
    grid (8) := 'x'
end bmX


procedure blX
    Draw.Line (maxx div 2 - 30 - 100, maxy div 2 - 30 - 100, maxx div 2 + 30 - 100, maxy div 2 + 30 - 100, black)
    Draw.Line (maxx div 2 - 30 - 100, maxy div 2 + 30 - 100, maxx div 2 + 30 - 100, maxy div 2 - 30 - 100, black)
    grid (7) := 'x'
end blX


procedure brX
    Draw.Line (maxx div 2 - 30 + 100, maxy div 2 - 30 - 100, maxx div 2 + 30 + 100, maxy div 2 + 30 - 100, black)
    Draw.Line (maxx div 2 - 30 + 100, maxy div 2 + 30 - 100, maxx div 2 + 30 + 100, maxy div 2 - 30 - 100, black)
    grid (9) := 'x'
end brX


procedure mmC
    Draw.Oval (maxx div 2, maxy div 2, 36, 36, 7)
    grid (5) := 'o'
end mmC

procedure mlC
    Draw.Oval (maxx div 2 - 100, maxy div 2, 36, 36, 7)
    grid (4) := 'o'
end mlC

procedure mrC
    Draw.Oval (maxx div 2 + 100, maxy div 2, 36, 36, 7)
    grid (6) := 'o'
end mrC

procedure tmC
    Draw.Oval (320, 300, 36, 36, 7)
    grid (2) := 'o'
end tmC

procedure tlC
    Draw.Oval (220, 300, 36, 36, 7)
    grid (1) := 'o'
end tlC

procedure trC
    Draw.Oval (420, 300, 36, 36, 7)
    grid (3) := 'o'
end trC

procedure bmC
    Draw.Oval (maxx div 2, maxy div 4, 36, 36, 7)
    grid (8) := 'o'
end bmC

procedure blC
    Draw.Oval (maxx div 2 - 100, maxy div 4, 36, 36, 7)
    grid (7) := 'o'
end blC

procedure brC
    Draw.Oval (maxx div 2 + 100, maxy div 4, 36, 36, 7)
    grid (9) := 'o'
end brC

procedure enterX (var square : int)

    if square = 1 then
	tlX
    elsif square = 2 then
	tmX
    elsif square = 3 then
	trX
    elsif square = 4 then
	mlX
    elsif square = 5 then
	mmX
    elsif square = 6 then
	mrX
    elsif square = 7 then
	blX
    elsif square = 8 then
	bmX
    elsif square = 9 then
	brX
    end if

end enterX

procedure enterO (var square : int)

    if square = 1 then
	tlC
    elsif square = 2 then
	tmC
    elsif square = 3 then
	trC
    elsif square = 4 then
	mlC
    elsif square = 5 then
	mmC
    elsif square = 6 then
	mrC
    elsif square = 7 then
	blC
    elsif square = 8 then
	bmC
    elsif square = 9 then
	brC
    end if

    moveCount := moveCount + 1
    %put "moveCount = ", moveCount

end enterO


%bmC
%mmC
%mlC
%mrC
%tmC
%tlC
%trC
%bmC
%blC
%brC
%loop



procedure OpponentX

    var userClicked : boolean := false

    var success : boolean := false

    loop

	mousewhere (mouseX, mouseY, mouseState)
	if mouseX > oneX and mouseX < twoX and mouseY > oneY and mouseY < twoY and mouseState = 1
		and grid (5) = 'e' then
	    grid (5) := 'x'
	    userClicked := true
	    mmX
	    moveCount := moveCount + 1
	    success := true
	    exit
	end if

	if mouseX > zeroX and mouseX < oneX and mouseY > oneY and mouseY < twoY and mouseState = 1
		and grid (4) = 'e' then
	    grid (4) := 'x'
	    userClicked := true
	    mlX
	    moveCount := moveCount + 1
	    success := true
	    exit
	end if

	if mouseX > twoX and mouseX < threeX and mouseY > oneY and mouseY < twoY and mouseState = 1
		and grid (6) = 'e'
		then
	    grid (6) := 'x'
	    userClicked := true
	    mrX
	    moveCount := moveCount + 1
	    success := true
	    exit
	end if

	if mouseX > zeroX and mouseX < oneX and mouseY > zeroY and mouseY < oneY and mouseState = 1
		and grid (7) = 'e'
		then
	    grid (7) := 'x'
	    userClicked := true
	    blX
	    moveCount := moveCount + 1
	    success := true
	    exit
	end if

	if mouseX > oneX and mouseX < twoX and mouseY > zeroY and mouseY < oneY and mouseState = 1
		and grid (8) = 'e'
		then
	    grid (8) := 'x'
	    userClicked := true
	    bmX
	    moveCount := moveCount + 1
	    success := true
	    exit
	end if

	if mouseX > twoX and mouseX < threeX and mouseY > zeroY and mouseY < oneY and mouseState = 1
		and grid (9) = 'e'
		then
	    grid (9) := 'x'
	    userClicked := true
	    brX
	    moveCount := moveCount + 1
	    success := true
	    exit
	end if

	if mouseX > zeroX and mouseX < oneX and mouseY > twoY and mouseY < threeY and mouseState = 1
		and grid (1) = 'e'
		then
	    grid (1) := 'x'
	    userClicked := true
	    tlX
	    moveCount := moveCount + 1
	    success := true
	    exit
	end if

	if mouseX > oneX and mouseX < twoX and mouseY > twoY and mouseY < threeY and mouseState = 1
		and grid (2) = 'e'
		then
	    grid (2) := 'x'
	    userClicked := true
	    tmX
	    moveCount := moveCount + 1
	    success := true
	    exit
	end if

	if mouseX > twoX and mouseX < threeX and mouseY > twoY and mouseY < threeY and mouseState = 1
		and grid (3) = 'e'
		then
	    grid (3) := 'x'
	    userClicked := true
	    trX
	    moveCount := moveCount + 1
	    success := true
	    exit
	end if

	exit when success
    end loop

    %put "moveCount = ", moveCount

end OpponentX
%end loop



procedure checkWin (var grid : array 1 .. 9 of char, current_val, opponent_val : char)
    var x1, x2, y1, y2 : int
    %Case 1
    if grid (7) = current_val or grid (7) = 'e' then
	if grid (8) = current_val and grid (9) = 'e' and grid (7) = current_val then
	    nextMoveWin := true
	    winSquare := 9
	    if current_val = 'o' then
		enterO (winSquare)
	    else
		enterX (winSquare)
	    end if
	    % winX := 3
	    % winY := 1
	elsif grid (8) = 'e' and grid (9) = current_val and grid (7) = current_val then
	    nextMoveWin := true
	    winSquare := 8
	    if current_val = 'o' then
		enterO (winSquare)
	    else
		enterX (winSquare)
	    end if
	    % winX := 2
	    % winY := 1
	elsif grid (7) = 'e' and grid (8) = current_val and grid (9) = current_val then
	    nextMoveWin := true
	    winSquare := 7
	    if current_val = 'o' then
		enterO (winSquare)
	    else
		enterX (winSquare)
	    end if
	    % winX := 1
	    % winY := 1
	    %Case 2
	elsif grid (5) = 'e' and grid (3) = current_val and grid (7) = current_val then
	    nextMoveWin := true
	    winSquare := 5
	    if current_val = 'o' then
		enterO (winSquare)
	    else
		enterX (winSquare)
	    end if
	elsif grid (3) = 'e' and grid (5) = current_val and grid (7) = current_val then
	    nextMoveWin := true
	    winSquare := 3
	    if current_val = 'o' then
		enterO (winSquare)
	    else
		enterX (winSquare)
	    end if
	elsif grid (5) = current_val and grid (3) = current_val and grid (7) = 'e' then
	    nextMoveWin := true
	    winSquare := 7
	    if current_val = 'o' then
		enterO (winSquare)
	    else
		enterX (winSquare)
	    end if
	    %Case 4
	elsif grid (4) = 'e' and grid (7) = current_val and grid (1) = current_val then
	    nextMoveWin := true
	    winSquare := 4
	    if current_val = 'o' then
		enterO (winSquare)
	    else
		enterX (winSquare)
	    end if
	elsif grid (1) = 'e' and grid (4) = current_val and grid (7) = current_val then
	    nextMoveWin := true
	    winSquare := 1
	    if current_val = 'o' then
		enterO (winSquare)
	    else
		enterX (winSquare)
	    end if
	elsif grid (7) = 'e' and grid (4) = current_val and grid (1) = current_val then
	    nextMoveWin := true
	    winSquare := 7
	    if current_val = 'o' then
		enterO (winSquare)
	    else
		enterX (winSquare)
	    end if
	end if
    end if
    %second pass
    if grid (8) = 'e' or grid (8) = current_val then
	%Case 1
	if grid (8) = 'e' and grid (5) = current_val and grid (2) = current_val then
	    nextMoveWin := true
	    winSquare := 8
	    if current_val = 'o' then
		enterO (winSquare)
	    else
		enterX (winSquare)
	    end if
	elsif grid (8) = current_val and grid (5) = 'e' and grid (2) = current_val then
	    nextMoveWin := true
	    winSquare := 5
	    if current_val = 'o' then
		enterO (winSquare)
	    else
		enterX (winSquare)
	    end if
	elsif grid (2) = 'e' and grid (5) = current_val and grid (8) = current_val then
	    nextMoveWin := true
	    winSquare := 2
	    if current_val = 'o' then
		enterO (winSquare)
	    else
		enterX (winSquare)
	    end if
	    %Case 2
	elsif grid (8) = current_val and grid (9) = current_val and grid (7) = 'e' then
	    nextMoveWin := true
	    winSquare := 7
	    if current_val = 'o' then
		enterO (winSquare)
	    else
		enterX (winSquare)
	    end if
	elsif grid (9) = 'e' and grid (8) = current_val and grid (7) = current_val then
	    nextMoveWin := true
	    winSquare := 9
	    if current_val = 'o' then
		enterO (winSquare)
	    else
		enterX (winSquare)
	    end if
	elsif grid (7) = 'e' and grid (8) = current_val and grid (9) = current_val then
	    nextMoveWin := true
	    winSquare := 7
	    if current_val = 'o' then
		enterO (winSquare)
	    else
		enterX (winSquare)
	    end if
	end if
    end if
    %Third pass
    %Case 1
    if grid (9) = 'e' or grid (9) = current_val then
	if grid (9) = current_val and grid (6) = current_val and grid (3) = 'e' then
	    nextMoveWin := true
	    winSquare := 3
	    if current_val = 'o' then
		enterO (winSquare)
	    else
		enterX (winSquare)
	    end if
	elsif grid (9) = 'e' and grid (6) = current_val and grid (3) = current_val then
	    nextMoveWin := true
	    winSquare := 9
	    if current_val = 'o' then
		enterO (winSquare)
	    else
		enterX (winSquare)
	    end if
	elsif grid (6) = 'e' and grid (9) = current_val and grid (3) = current_val then
	    nextMoveWin := true
	    winSquare := 6
	    if current_val = 'o' then
		enterO (winSquare)
	    else
		enterX (winSquare)
	    end if
	    %Case 2
	elsif grid (9) = current_val and grid (5) = current_val and grid (1) = 'e' then
	    nextMoveWin := true
	    winSquare := 1
	    if current_val = 'o' then
		enterO (winSquare)
	    else
		enterX (winSquare)
	    end if
	elsif grid (5) = 'e' and grid (9) = current_val and grid (1) = current_val then
	    nextMoveWin := true
	    winSquare := 5
	    if current_val = 'o' then
		enterO (winSquare)
	    else
		enterX (winSquare)
	    end if
	elsif grid (9) = 'e' and grid (5) = current_val and grid (1) = current_val then
	    nextMoveWin := true
	    winSquare := 9
	    if current_val = 'o' then
		enterO (winSquare)
	    else
		enterX (winSquare)
	    end if
	end if
    end if
    %Fourth pass
    if grid (4) = 'e' or grid (4) = current_val then
	%Case 1
	if grid (4) = current_val and grid (5) = current_val and grid (6) = 'e' then
	    nextMoveWin := true
	    winSquare := 6
	    if current_val = 'o' then
		enterO (winSquare)
	    else
		enterX (winSquare)
	    end if
	elsif grid (4) = 'e' and grid (5) = current_val and grid (6) = current_val then
	    nextMoveWin := true
	    winSquare := 4
	    if current_val = 'o' then
		enterO (winSquare)
	    else
		enterX (winSquare)
	    end if
	elsif grid (5) = 'e' and grid (4) = current_val and grid (6) = current_val then
	    nextMoveWin := true
	    winSquare := 5
	    if current_val = 'o' then
		enterO (winSquare)
	    else
		enterX (winSquare)
	    end if
	end if
    end if
    %Final pass
    if grid (3) = 'e' or grid (3) = current_val then
	if grid (3) = current_val and grid (2) = current_val and grid (1) = 'e' then
	    nextMoveWin := true
	    winSquare := 1
	    if current_val = 'o' then
		enterO (winSquare)
	    else
		enterX (winSquare)
	    end if
	elsif grid (3) = 'e' and grid (2) = current_val and grid (1) = current_val then
	    nextMoveWin := true
	    winSquare := 3
	    if current_val = 'o' then
		enterO (winSquare)
	    else
		enterX (winSquare)
	    end if
	elsif grid (3) = current_val and grid (2) = 'e' and grid (1) = current_val then
	    nextMoveWin := true
	    winSquare := 2
	    if current_val = 'o' then
		enterO (winSquare)
	    else
		enterX (winSquare)
	    end if
	end if
    end if

    %%%%%%%%%%%%%%%%%%%%%% CAREFUL %%%%%%%%%%%%%%%%%%%%%%
    %             if nextMoveWin then                   %
    %       grid (winSquare) := current_val             %
    %              blocked := true                      %
    %                  end if                           %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end checkWin


procedure weTheO


    var ourMove : int
    %loop

    if moveCount = 1 then

	if grid (1) = opponent_val
		or grid (3) = opponent_val
		or grid (7) = opponent_val
		or grid (9) = opponent_val then
	    %take middle
	    ourMove := 5
	    enterO (ourMove)

	    success := true

	    %exit
	else
	    ourMove := 1
	    enterO (ourMove)

	    success := true

	    %exit
	end if

    elsif moveCount = 3 then



	delay (1000)

	if (grid (2) = opponent_val and grid (6) = opponent_val and grid (1) not= 'e') then

	    ourMove := 5
	    enterO (ourMove)

	    success := true

	elsif (grid (6) = opponent_val and grid (8) = opponent_val and grid (3) not= 'e') then

	    ourMove := 5
	    enterO (ourMove)

	    success := true

	elsif (grid (4) = opponent_val and grid (8) = opponent_val and grid (9) not= 'e') then

	    ourMove := 5
	    enterO (ourMove)

	    success := true


	elsif (grid (2) = opponent_val and grid (4) = opponent_val and grid (7) not= 'e') then

	    ourMove := 5
	    enterO (ourMove)

	    success := true


	elsif (grid (6) = opponent_val and grid (8) = opponent_val and grid (1) not= 'e') then

	    ourMove := 3
	    enterO (ourMove)

	    success := true

	elsif (grid (4) = opponent_val and grid (8) = opponent_val and grid (3) not= 'e') then

	    ourMove := 9
	    enterO (ourMove)

	    success := true

	elsif (grid (2) = opponent_val and grid (6) = opponent_val and grid (7) not= 'e') then

	    ourMove := 1
	    enterO (ourMove)

	    success := true

	elsif (grid (2) = opponent_val and grid (4) = opponent_val and grid (9) not= 'e') then

	    ourMove := 7
	    enterO (ourMove)

	    success := true


	elsif (grid (1) = opponent_val and grid (6) = opponent_val and grid (5) not= 'e') then

	    ourMove := 3
	    enterO (ourMove)

	    success := true

	elsif (grid (3) = opponent_val and grid (8) = opponent_val and grid (5) not= 'e') then

	    ourMove := 9
	    enterO (ourMove)

	    success := true

	elsif (grid (2) = opponent_val and grid (7) = opponent_val and grid (5) not= 'e') then

	    ourMove := 1
	    enterO (ourMove)

	    success := true

	elsif (grid (4) = opponent_val and grid (9) = opponent_val and grid (5) not= 'e') then

	    ourMove := 7
	    enterO (ourMove)

	    success := true


	elsif (grid (5) = opponent_val and grid (9) = opponent_val and grid (1) not= 'e') then

	    ourMove := 3
	    enterO (ourMove)

	    success := true

	elsif (grid (3) = opponent_val and grid (5) = opponent_val and grid (7) not= 'e') then

	    ourMove := 1
	    enterO (ourMove)

	    success := true

	elsif (grid (1) = opponent_val and grid (5) = opponent_val and grid (9) not= 'e') then

	    ourMove := 7
	    enterO (ourMove)

	    success := true

	elsif (grid (5) = opponent_val and grid (7) = opponent_val and grid (3) not= 'e') then

	    ourMove := 9
	    enterO (ourMove)

	    success := true

	elsif (grid (6) = opponent_val and grid (7) = opponent_val and grid (5) not= 'e') then

	    ourMove := 2
	    enterO (ourMove)

	    success := true

	elsif (grid (2) = opponent_val and grid (9) = opponent_val and grid (5) not= 'e') then

	    ourMove := 4
	    enterO (ourMove)

	    success := true

	elsif (grid (1) = opponent_val and grid (8) = opponent_val and grid (5) not= 'e') then

	    ourMove := 6
	    enterO (ourMove)

	    success := true
	elsif (grid (3) = opponent_val and grid (4) = opponent_val and grid (5) not= 'e') then

	    ourMove := 8
	    enterO (ourMove)

	    success := true
	elsif ((grid (2) = opponent_val and grid (4) = opponent_val and grid (1) not= 'e')
		or
		(grid (2) = opponent_val and grid (6) = opponent_val and grid (3) not= 'e')
		or
		(grid (6) = opponent_val and grid (8) = opponent_val and grid (9) not= 'e')
		or
		(grid (6) = opponent_val and grid (8) = opponent_val and grid (7) not= 'e'))

		then



	    ourMove := 5
	    enterO (ourMove)

	    success := true

	    %exit


	elsif (grid (1) = opponent_val and grid (9) = opponent_val and grid (5) not= 'e') then



	    loop
		randint (ourMove, 1, 9)
		if (ourMove = 2 or ourMove = 4 or ourMove = 6 or ourMove = 8)
			and grid (ourMove) = 'e' then
		    enterO (ourMove)
		    success := true
		end if
		exit when (ourMove = 2 or ourMove = 4 or ourMove = 6 or ourMove = 8)
	    end loop

	    %exit

	elsif (grid (3) = opponent_val and grid (7) = opponent_val and grid (5) not= 'e') then



	    loop
		randint (ourMove, 1, 9)
		if (ourMove = 2 or ourMove = 4 or ourMove = 6 or ourMove = 8) and
			grid (ourMove) = 'e' then
		    enterO (ourMove)
		    success := true
		end if
		exit when (ourMove = 2 or ourMove = 4 or ourMove = 6 or ourMove = 8)
	    end loop

	    %exit

	end if
	%exit
    end if


    %end loop

    if not success then
	loop
	    randint (ourMove, 1, 9)
	    if grid (ourMove) = 'e' then
		enterO (ourMove)
		exit
	    end if
	end loop
    end if

    %moveCount := moveCount + 1

end weTheO


%Mr.J
%06/11/2015
%CheckWin
procedure checkOppWin (var grid : array 1 .. 9 of char, current_val, opponent_val : char)
    var x1, x2, y1, y2 : int
    %Case 1
    if grid (7) = current_val or grid (7) = 'e' and not blocked then
	if grid (8) = current_val and grid (9) = 'e' and grid (7) = current_val and not blocked then
	    blocked := true
	    winSquare := 9

	    %do not and not blocked at this level
	    if current_val = 'o' then
		enterX (winSquare)
	    else
		enterO (winSquare)
	    end if



	    % winX := 3
	    % winY := 1
	elsif grid (8) = 'e' and grid (9) = current_val and grid (7) = current_val and not blocked then
	    blocked := true
	    winSquare := 8
	    if current_val = 'o' then
		enterX (winSquare)
	    else
		enterO (winSquare)
	    end if
	    % winX := 2
	    % winY := 1
	elsif grid (7) = 'e' and grid (8) = current_val and grid (9) = current_val and not blocked then
	    blocked := true
	    winSquare := 7
	    if current_val = 'o' then
		enterX (winSquare)
	    else
		enterO (winSquare)
	    end if
	    % winX := 1
	    % winY := 1
	    %Case 2
	elsif grid (5) = 'e' and grid (3) = current_val and grid (7) = current_val and not blocked then
	    blocked := true
	    winSquare := 5
	    if current_val = 'o' then
		enterX (winSquare)
	    else
		enterO (winSquare)
	    end if
	elsif grid (3) = 'e' and grid (5) = current_val and grid (7) = current_val and not blocked then
	    blocked := true
	    winSquare := 3
	    if current_val = 'o' then
		enterX (winSquare)
	    else
		enterO (winSquare)
	    end if
	elsif grid (5) = current_val and grid (3) = current_val and grid (7) = 'e' and not blocked then
	    blocked := true
	    winSquare := 7
	    if current_val = 'o' then
		enterX (winSquare)
	    else
		enterO (winSquare)
	    end if
	    %Case 4
	elsif grid (4) = 'e' and grid (7) = current_val and grid (1) = current_val and not blocked then
	    blocked := true
	    winSquare := 4
	    if current_val = 'o' then
		enterX (winSquare)
	    else
		enterO (winSquare)
	    end if
	elsif grid (1) = 'e' and grid (4) = current_val and grid (7) = current_val and not blocked then
	    blocked := true
	    winSquare := 1
	    if current_val = 'o' then
		enterX (winSquare)
	    else
		enterO (winSquare)
	    end if
	elsif grid (7) = 'e' and grid (4) = current_val and grid (1) = current_val and not blocked then
	    blocked := true
	    winSquare := 7
	    if current_val = 'o' then
		enterX (winSquare)
	    else
		enterO (winSquare)
	    end if
	end if
    end if
    %second pass
    if grid (8) = 'e' or grid (8) = current_val and not blocked then
	%Case 1
	if grid (8) = 'e' and grid (5) = current_val and grid (2) = current_val and not blocked then
	    blocked := true
	    winSquare := 8
	    if current_val = 'o' then
		enterX (winSquare)
	    else
		enterO (winSquare)
	    end if
	elsif grid (8) = current_val and grid (5) = 'e' and grid (2) = current_val and not blocked then
	    blocked := true
	    winSquare := 5
	    if current_val = 'o' then
		enterX (winSquare)
	    else
		enterO (winSquare)
	    end if
	elsif grid (2) = 'e' and grid (5) = current_val and grid (8) = current_val and not blocked then
	    blocked := true
	    winSquare := 2
	    if current_val = 'o' then
		enterX (winSquare)
	    else
		enterO (winSquare)
	    end if
	    %Case 2
	elsif grid (8) = current_val and grid (9) = current_val and grid (7) = 'e' and not blocked then
	    blocked := true
	    winSquare := 7
	    if current_val = 'o' then
		enterX (winSquare)
	    else
		enterO (winSquare)
	    end if
	elsif grid (9) = 'e' and grid (8) = current_val and grid (7) = current_val and not blocked then
	    blocked := true
	    winSquare := 9
	    if current_val = 'o' then
		enterX (winSquare)
	    else
		enterO (winSquare)
	    end if
	elsif grid (7) = 'e' and grid (8) = current_val and grid (9) = current_val and not blocked then
	    blocked := true
	    winSquare := 7
	    if current_val = 'o' then
		enterX (winSquare)
	    else
		enterO (winSquare)
	    end if
	end if
    end if
    %Third pass
    %Case 1
    if grid (9) = 'e' or grid (9) = current_val and not blocked then
	if grid (9) = current_val and grid (6) = current_val and grid (3) = 'e' and not blocked then
	    blocked := true
	    winSquare := 3
	    if current_val = 'o' then
		enterX (winSquare)
	    else
		enterO (winSquare)
	    end if
	elsif grid (9) = 'e' and grid (6) = current_val and grid (3) = current_val and not blocked then
	    blocked := true
	    winSquare := 9
	    if current_val = 'o' then
		enterX (winSquare)
	    else
		enterO (winSquare)
	    end if
	elsif grid (6) = 'e' and grid (9) = current_val and grid (3) = current_val and not blocked then
	    blocked := true
	    winSquare := 6
	    if current_val = 'o' then
		enterX (winSquare)
	    else
		enterO (winSquare)
	    end if
	    %Case 2
	elsif grid (9) = current_val and grid (5) = current_val and grid (1) = 'e' and not blocked then
	    blocked := true
	    winSquare := 1
	    if current_val = 'o' then
		enterX (winSquare)
	    else
		enterO (winSquare)
	    end if
	elsif grid (5) = 'e' and grid (9) = current_val and grid (1) = current_val and not blocked then
	    blocked := true
	    winSquare := 5
	    if current_val = 'o' then
		enterX (winSquare)
	    else
		enterO (winSquare)
	    end if
	elsif grid (9) = 'e' and grid (5) = current_val and grid (1) = current_val and not blocked then
	    blocked := true
	    winSquare := 9
	    if current_val = 'o' then
		enterX (winSquare)
	    else
		enterO (winSquare)
	    end if
	end if
    end if
    %Fourth pass
    if grid (4) = 'e' or grid (4) = current_val and not blocked then
	%Case 1
	if grid (4) = current_val and grid (5) = current_val and grid (6) = 'e' and not blocked then
	    blocked := true
	    winSquare := 6
	    if current_val = 'o' then
		enterX (winSquare)
	    else
		enterO (winSquare)
	    end if
	elsif grid (4) = 'e' and grid (5) = current_val and grid (6) = current_val and not blocked then
	    blocked := true
	    winSquare := 4
	    if current_val = 'o' then
		enterX (winSquare)
	    else
		enterO (winSquare)
	    end if
	elsif grid (5) = 'e' and grid (4) = current_val and grid (6) = current_val and not blocked then
	    blocked := true
	    winSquare := 5
	    if current_val = 'o' then
		enterX (winSquare)
	    else
		enterO (winSquare)
	    end if
	end if
    end if
    %Final pass
    if grid (3) = 'e' or grid (3) = current_val and not blocked then
	if grid (3) = current_val and grid (2) = current_val and grid (1) = 'e' and not blocked then
	    blocked := true
	    winSquare := 1
	    if current_val = 'o' then
		enterX (winSquare)
	    else
		enterO (winSquare)
	    end if
	elsif grid (3) = 'e' and grid (2) = current_val and grid (1) = current_val and not blocked then
	    blocked := true
	    winSquare := 3
	    if current_val = 'o' then
		enterX (winSquare)
	    else
		enterO (winSquare)
	    end if
	elsif grid (3) = current_val and grid (2) = 'e' and grid (1) = current_val and not blocked then
	    blocked := true
	    winSquare := 2
	    if current_val = 'o' then
		enterX (winSquare)
	    else
		enterO (winSquare)
	    end if
	end if
    end if

    %%%%%%%%%%%%%%%%%%%%%% CAREFUL %%%%%%%%%%%%%%%%%%%%%%
    %             if not blocked then                   %
    %       grid (winSquare) := current_val             %
    %                    end if                         %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end checkOppWin

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                        %
%                MAIN                    %
%                                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

emptyBoard (grid)
drawGrid
current_val := 'o'
opponent_val := 'x'
moveCount := 0
success := false
loop


    blocked := false
    OpponentX
    delay (100)


    checkWin (grid, current_val, opponent_val)
    delay (100)

    if not nextMoveWin then
	checkOppWin (grid, opponent_val, current_val)
	delay (100)
    end if

    if (not blocked) and (not nextMoveWin) then
	success := false
	weTheO
	delay (100)

    end if


    exit when nextMoveWin or moveCount = 9
end loop
