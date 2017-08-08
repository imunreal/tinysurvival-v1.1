:Start
SETLOCAL EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set "DEL=%%a"
)
Set /A ForceUnlock=1
Set /A WonGame=0
SET /A QUESTID=(%RANDOM%*376/15)+1
SET /A QUESTRUN=00+QUESTID
Title Tiny Survival
CLS
@ECHO OFF
ECHO.
TYPE "img\text\title.txt"
ECHO.
TYPE "img\text\logo.txt"
ECHO.
ECHO.
ECHO Tiny Survival 1.1b
ECHO.
CALL :ColorText 0E "Created by imunreal"
ECHO.
ECHO.
ECHO.
PAUSE
CLS
Set /A IntroKey=0
Set /A BiomeLocation=Default
Set /A ExhaustionLevel=Default
Set /A ClimateType=Default
Set /A CharacterType=Default
Set /A WeaponType=Default
Set /A Environment=%RANDOM% %% 11
Set /A Tiredness=%RANDOM% %% 11
Set /A Power=%RANDOM% %% 11
Set /A Luck=%RANDOM% %% 3
SET /A RestCounter=0
Set /A BulzolgonGate=0
SET /A WaterCount=0
SET /A FoodCount=0
SET /A MedCount=0
@ECHO OFF
setlocal enabledelayedexpansion
set "pseudo1=Nick Abi Sarah Hunter Greg Pauly Phillip Vanessa Jimmy Siria Timmy Tommy Dillon Mark Galgulon Dennis"
set cnt1=0 & for %%P in (!pseudo1!) do (
	set /a cnt1+=1
	set "pseudo1[!cnt1!]=%%P"
)
set "pseudo2=Alcoholic Drifter Addict Friendly Intelligent Calm"
set cnt2=0 & for %%P in (!pseudo2!) do (
	set /a cnt2+=1
	set "pseudo2[!cnt2!]=%%P"
)
set "pseudo3=Colorblind Idiotic Lethargic Angry Pleased Strange"
set cnt3=0 & for %%P in (!pseudo3!) do (
	set /a cnt3+=1
	set "pseudo3[!cnt3!]=%%P"
)
set "pseudo4=Leader Stupid Autistic Happy Sad Winded"
set cnt4=0 & for %%P in (!pseudo4!) do (
	set /a cnt4+=1
	set "pseudo4[!cnt4!]=%%P"
)
set /a rndInt=%random% %% cnt1 +1
set /a rndInt2=%random% %% cnt2 +1
set /a rndInt3=%random% %% cnt3 +1
set /a rndInt4=%random% %% cnt4 +1
SET /A Climate=%RANDOM% %% 4
SET /A Character=%RANDOM% %% 4
SET /A Weapon=%RANDOM% %% 4
SET /A Health=(50+(%RANDOM% %%51))
SET /A Stamina=(100+(%RANDOM% %%101))
Set /A Turn=0
Set /A Radiation=0
ECHO Character Generated:
IF %Climate% EQU 0 Set ClimateType=Temperate
IF %Climate% EQU 1 Set ClimateType=Hot
IF %Climate% EQU 2 Set ClimateType=Cold
IF %Climate% EQU 3 Set ClimateType=Wet
IF %Character% EQU 0 Set CharacterType=Fat& Set /A Tiredness=%Tiredness% - 3
IF %Character% EQU 1 Set CharacterType=Skinny& Set /A Tiredness=%Tiredness% - 0
IF %Character% EQU 2 Set CharacterType=Chubby& Set /A Tiredness=%Tiredness% - 2
IF %Character% EQU 3 Set CharacterType=Athletic& Set /A Tiredness=%Tiredness% + 2
IF %Weapon% EQU 0 Set WeaponType=Stick& Set /A Power=%Power% - 2
IF %Weapon% EQU 1 Set WeaponType=Club& Set /A Power=%Power% + 1
IF %Weapon% EQU 2 Set WeaponType=Knife& Set /A Power=%Power% + 3
IF %Weapon% EQU 3 Set WeaponType=Gun& Set /A Power=%Power% + 5
Set /A PositionX=%RANDOM% %% 251
Set /A Position=%RANDOM% %% 251
ECHO The objective of the game is to survive for an entire year.
ECHO.
ECHO Your name is !pseudo1[%rndInt%]!
ECHO.
ECHO You are %CharacterType% and sensitive to %ClimateType% weather. You are equipped with a %WeaponType%.
ECHO.
ECHO --- Stats ---
ECHO Your starting health is: %Health%
ECHO Your starting stamina is: %Stamina%
ECHO Your randomly generated traits are: !pseudo2[%rndInt2%]! !pseudo3[%rndInt3%]! !pseudo4[%rndInt4%]!
ECHO.
ECHO.
ECHO Roll Results: %Environment%%Tiredness%%Power%%Luck%
ECHO -------------
ECHO.
ECHO.
ECHO Moving forward will start the game.
ECHO.
PAUSE
GOTO :BiomeGen

:BiomeGen
SET /A BiomeQuad1=%RANDOM% %% 4
SET /A BiomeQuad2=%RANDOM% %% 4
SET /A BiomeQuad3=%RANDOM% %% 4
SET /A BiomeQuad4=%RANDOM% %% 4
IF %BiomeQuad1% EQU 0 Set BiomeLocation1=Waste& Set /A Environment=%Environment% - 3&  Set /A Tiredness=Tiredness - 1
IF %BiomeQuad1% EQU 1 Set BiomeLocation1=Snow& Set /A Environment=%Environment% - 2& Set /A Tiredness=Tiredness - 2
IF %BiomeQuad1% EQU 2 Set BiomeLocation1=Forest&  Set /A Environment=%Environment% + 1& Set /A Tiredness=Tiredness - 1
IF %BiomeQuad1% EQU 3 Set BiomeLocation1=Desert& Set /A Environment=%Environment% - 2& Set /A Tiredness=Tiredness - 3

IF %BiomeQuad2% EQU 0 Set BiomeLocation2=Waste& Set /A Environment=%Environment% - 3&  Set /A Tiredness=Tiredness - 1
IF %BiomeQuad2% EQU 1 Set BiomeLocation2=Snow& Set /A Environment=%Environment% - 2& Set /A Tiredness=Tiredness - 2
IF %BiomeQuad2% EQU 2 Set BiomeLocation2=Forest&  Set /A Environment=%Environment% + 1& Set /A Tiredness=Tiredness - 1
IF %BiomeQuad2% EQU 3 Set BiomeLocation2=Desert& Set /A Environment=%Environment% - 2& Set /A Tiredness=Tiredness - 3

IF %BiomeQuad3% EQU 0 Set BiomeLocation3=Waste& Set /A Environment=%Environment% - 3&  Set /A Tiredness=Tiredness - 1
IF %BiomeQuad3% EQU 1 Set BiomeLocation3=Snow& Set /A Environment=%Environment% - 2& Set /A Tiredness=Tiredness - 2
IF %BiomeQuad3% EQU 2 Set BiomeLocation3=Forest&  Set /A Environment=%Environment% + 1& Set /A Tiredness=Tiredness - 1
IF %BiomeQuad3% EQU 3 Set BiomeLocation3=Desert& Set /A Environment=%Environment% - 2& Set /A Tiredness=Tiredness - 3

IF %BiomeQuad4% EQU 0 Set BiomeLocation4=Waste& Set /A Environment=%Environment% - 3&  Set /A Tiredness=Tiredness - 1
IF %BiomeQuad4% EQU 1 Set BiomeLocation4=Snow& Set /A Environment=%Environment% - 2& Set /A Tiredness=Tiredness - 2
IF %BiomeQuad4% EQU 2 Set BiomeLocation4=Forest&  Set /A Environment=%Environment% + 1& Set /A Tiredness=Tiredness - 1
IF %BiomeQuad4% EQU 3 Set BiomeLocation4=Desert& Set /A Environment=%Environment% - 2& Set /A Tiredness=Tiredness - 3
GOTO :Drawbridge

:Drawbridge
Title Tiny Survival
SET /A TotalDays=%Turn% / 3
IF %Position% GEQ 0 ( IF %Position% LEQ 250 ( IF %PositionX% LEQ 0 ( IF %PositionX% GEQ -250 ( SET BiomeLocation=%BiomeLocation1% & SET /A Quadrant=1))))
IF %Position% LEQ 0 ( IF %Position% GEQ -250 ( IF %PositionX% LEQ 0 ( IF %PositionX% GEQ -250 ( SET BiomeLocation=%BiomeLocation2% & SET /A Quadrant=2))))
IF %Position% LEQ 0 ( IF %Position% GEQ -250 ( IF %PositionX% GEQ 0 ( IF %PositionX% LEQ 250 ( SET BiomeLocation=%BiomeLocation3% & SET /A Quadrant=3))))
IF %Position% GEQ 0 ( IF %Position% LEQ 250 ( IF %PositionX% LEQ 250 ( IF %PositionX% GEQ 0 ( SET BiomeLocation=%BiomeLocation4% & SET /A Quadrant=4))))
CLS
:PostCheck
ECHO Health: %Health% Rads: %Radiation%
ECHO Stamina: %Stamina%
ECHO Weapon: %WeaponType%
Echo Climate: %ClimateType%
ECHO Location: %BiomeLocation%
ECHO Position: X:(%PositionX%) Y:(%Position%)
Echo Turn: %Turn%
ECHO Rest: %RestCounter%
ECHO.
ECHO.
ECHO.
IF %BiomeLocation%==Mountains ECHO You are currently in the mountain biome.
IF %BiomeLocation%==Mountains ECHO You feel amazing. 
IF %BiomeLocation%==Snow ECHO You are currently in the snow biome.
IF %BiomeLocation%==Snow ECHO You look around and see nothing but cold, rigid mountains lined with frost. 
IF %BiomeLocation%==Forest ECHO You are currently in the forest biome.
IF %BiomeLocation%==Forest ECHO You look around and see beautiful rolling hills lined with pine trees. Deer wander in the forest around you. 
IF %BiomeLocation%==Waste ECHO You are currently in the waste biome.
IF %BiomeLocation%==Waste ECHO The earth around you is scorched with radiation. Everything is sight is ruined.& SET /A Radiation=%Radiation% + 2
IF %BiomeLocation%==Waste ECHO You are slowly feeling the effects of radiation.
IF %BiomeLocation%==Desert ECHO You are currently in the desert biome.
IF %BiomeLocation%==Desert ECHO You look around and see scorching bright white sands in every direction.
If %WonGame%==0 (If %TotalDays% GEQ 366 GOTO WinCondition)
IF %RestCounter% GEQ 8 ECHO You can hear the flapping of Bulzolgons mighty wings in the distance.
IF %RestCounter% GEQ 8 ECHO You fear Bulzolgon.
IF %Stamina% LEQ 0 ECHO You must rest. & Pause & GOTO :Rest
IF %Health% LEQ 0 GOTO :Death
IF %Radiation% GEQ 56 GOTO :Death
IF %Position%==0 ( IF %PositionX%==0 ( GOTO :MountainEncounter ))
ECHO.
:PostCheck2
ECHO You can move, check your map or check your inventory.
IF %IntroKey%==0 ECHO If this is your first time playing type "Help" when asked what to do.
ECHO.
SET /P CHOICE1=What will you do?: 
IF %CHOICE1%==North GOTO North
IF %CHOICE1%==South GOTO South
IF %CHOICE1%==East GOTO East
IF %CHOICE1%==West GOTO West
IF %CHOICE1%==Rest GOTO Rest
IF %CHOICE1%==Map GOTO Map
IF %CHOICE1%==Force GOTO Force
IF %CHOICE1%==Help GOTO Help
IF %CHOICE1%==Journal GOTO Journal
IF %CHOICE1%==Inventory GOTO Inventory
IF %CHOICE1%==north GOTO North
IF %CHOICE1%==south GOTO South
IF %CHOICE1%==east GOTO East
IF %CHOICE1%==west GOTO West
IF %CHOICE1%==rest GOTO Rest
IF %CHOICE1%==map GOTO Map
IF %CHOICE1%==force GOTO Force
IF %CHOICE1%==help GOTO Help
IF %CHOICE1%==journal GOTO Journal
IF %CHOICE1%==inventory GOTO Inventory
IF %CHOICE1%==N GOTO North
IF %CHOICE1%==S GOTO South
IF %CHOICE1%==E GOTO East
IF %CHOICE1%==W GOTO West
IF %CHOICE1%==R GOTO Rest
IF %CHOICE1%==M GOTO Map
IF %CHOICE1%==F GOTO Force
IF %CHOICE1%==H GOTO Help
IF %CHOICE1%==J GOTO Journal
IF %CHOICE1%==I GOTO Inventory
IF %CHOICE1%==n GOTO North
IF %CHOICE1%==s GOTO South
IF %CHOICE1%==e GOTO East
IF %CHOICE1%==w GOTO West
IF %CHOICE1%==r GOTO Rest
IF %CHOICE1%==m GOTO Map
IF %CHOICE1%==f GOTO Force
IF %CHOICE1%==h GOTO Help
IF %CHOICE1%==j GOTO Journal
IF %CHOICE1%==i GOTO Inventory
GOTO ResponseNotValid
PAUSE

:Journal
CLS
ECHO.
TYPE "img\items\journal.txt"
ECHO.
ECHO.
ECHO You pull your journal out of your bag.
ECHO ------------------------------------------
ECHO Name: !pseudo1[%rndInt%]!
ECHO Last Movement: %Direction%
ECHO Current Biome: %BiomeLocation%
ECHO Days Survived So Far: %TotalDays%
ECHO Weapon Equipped: %WeaponType%
ECHO Enviornment Factor: %Environment%
ECHO Tiredness Factor: %Tiredness%
ECHO Current Attack: %Power%
ECHO Luck: %Luck%
ECHO.
PAUSE.
ECHO After reading for a while you put the journal back in your bag.
PAUSE
GOTO :Drawbridge


:Help
Set /A IntroKey=1
CLS
TYPE "img\text\help.txt"
ECHO.
ECHO To move around type: North, South, East or West when prompted.
ECHO To open your inventory type: Inventory or I when prompted.
ECHO To view your map type: Map or M when prompted. 
ECHO You can view your journal by typing: Journal or J when prompted.
ECHO You can also rest by typing: Rest or R when prompted.
ECHO.
ECHO Some scenarious require context sensitive decisions. For example...
ECHO If you are prompted like this: What will you do?: (Yes, No)
ECHO Then your context sensitive options would be yes or no.
ECHO You would enter Yes or No depending on your personal thoughts and interpretation of the situation at hand.
ECHO.
ECHO Hopefully this is enough information to get you through the game.
PAUSE
GOTO :Drawbridge

:Inventory
Set /A IntroKey=1
CLS
Echo You open up your bag to check your inventory.
ECHO.
Echo Inside you find:
ECHO.
Echo %WaterCount%x water bottles.
Echo %FoodCount%x food items.
Echo %MedCount%x medications.
ECHO.
ECHO You can drink, eat, medicate or close your inventory.
ECHO.
SET /P InventoryCheck=What do you want to do?(Drink, Eat, Medicate or Close):
IF %InventoryCheck%==Drink (IF %WaterCount% LEQ 0 ECHO You do not have any water to drink. & PAUSE & GOTO Inventory) 
IF %InventoryCheck%==Drink IF %WaterCount% GEQ 1 ECHO You drink the water and feel refreshed. & SET /A WaterCount=(%WaterCount%-1) & SET /A Stamina=(%Stamina% + 20) & SET /A Health=(%Health% +5) & PAUSE & GOTO Inventory
IF %InventoryCheck%==Eat (If %FoodCount% LEQ 0 ECHO You do not have any food to eat. & PAUSE & GOTO Inventory)
IF %InventoryCheck%==Eat If %FoodCount% GEQ 1 ECHO You eat the food and feel refreshed. & SET /A FoodCount=(%FoodCount%-1) & SET /A Stamina=(%Stamina% + 10) & SET /A Health=(%Health% +20) & PAUSE & GOTO Inventory
IF %InventoryCheck%==Medicate (If %MedCount% LEQ 0 ECHO You do not have any medications to take. & PAUSE & GOTO Inventory)
IF %InventoryCheck%==Medicate If %MedCount% GEQ 1 ECHO You take the medication and feel better. & SET /A MedCount=(%MedCount%-1) & SET /A Radiation=(%Radiation% -30) & SET /A Health=(%Health% +40) & PAUSE & GOTO Inventory
IF %InventoryCheck%==Close ECHO You close your bag. & PAUSE & GOTO Drawbridge
Pause
GOTO :Inventory
PAUSE


:ResponseNotValid
Set /A IntroKey=1
CLS
Title Something went wrong.
ECHO.
ECHO You may have entered something incorrectly.
ECHO.
ECHO Try that again.
ECHO.
PAUSE
GOTO :Drawbridge

:Force
If %ForceUnlock%==3 GOTO ResponseNotValid
If %ForceUnlock%==0 GOTO MiniGame
If %ForceUnlock%==2 ECHO You are disqualified from playing any and all minigames. & PAUSE & GOTO Drawbridge
Set /P Going=X:
GOTO :%Going%
PAUSE

:MiniGame
CLS
TITLE You have discovered a secret!
ECHO Welcome to Bulzolgons minigame madness.
ECHO.
ECHO You have encountered the mysterious stranger and now wish to use the 'Force'.
ECHO But before you can enjoy this awesome power, you must complete a series of challenges.
ECHO.
ECHO Let the games begin.
ECHO.
ECHO Question 1:
ECHO --------------------------------------
ECHO.
ECHO What is the meaning of life?
ECHO.
ECHO A - Life has no point.
ECHO B - Life has no point.
ECHO C - Life has no point.
ECHO D - Taco Bell Cheese Biproduct
SET /P Answer1=Answer: 
If %Answer1%==C GOTO Question2
ECHO That is not the correct answer. You are now disqualified from using the 'Force' for this playthrough. & Set /A ForceUnlock=2 & PAUSE & GOTO Drawbridge

:Question2
CLS
TITLE You have discovered a secret!: Round 2
ECHO Welcome to Bulzolgons minigame madness.
ECHO.
ECHO You have encountered the mysterious stranger and now wish to use the 'Force'.
ECHO But before you can enjoy this awesome power, you must complete a series of challenges.
ECHO.
ECHO.
ECHO Question 2:
ECHO --------------------------------------
ECHO.
ECHO What is a "invisible observable"?
ECHO.
ECHO A - That isnt a thing.
ECHO B - I dont see what this has to do with anything.
ECHO C - Life has no point.
ECHO D - It is an invisible manifestation of an observable phenomenon.
SET /P Answer2=Answer: 
If %Answer2%==C GOTO Question3
ECHO That is not the correct answer. You are now disqualified from using the 'Force' for this playthrough. & Set /A ForceUnlock=2 & PAUSE & GOTO Drawbridge

:Question3
CLS
TITLE You have discovered a secret!: Round 2
ECHO Welcome to Bulzolgons minigame madness.
ECHO.
ECHO You have encountered the mysterious stranger and now wish to use the 'Force'.
ECHO But before you can enjoy this awesome power, you must complete a series of challenges.
ECHO.
ECHO.
ECHO Question 3:
ECHO --------------------------------------
ECHO.
ECHO Why are we here?
ECHO.
ECHO A - Im not here. I am a husk of a human being who cannot feel.
ECHO B - Are any of us really ever here?
ECHO C - Life has no point.
ECHO D - Because we are.
SET /P Answer3=Answer: 
If %Answer3%==C ECHO. & ECHO Congradulations. You can now use the 'Force'. Good luck figuring out how to use it. & Set /A ForceUnlock=1 & PAUSE & GOTO Drawbridge
ECHO That is not the correct answer. You are now disqualified from using the 'Force' for this playthrough. & Set /A ForceUnlock=2 & PAUSE & GOTO Drawbridge

:MountainEncounter
CLS
ECHO You are standing in the center of the map.
ECHO You look around and see an amazing mountain range.
ECHO.
TYPE "img\encounters\mountain.txt"
ECHO.
Set BiomeLocation=Mountains & ECHO You feel amazing in this moment. & SET /A Stamina=(%Stamina% + 150) & SET /A Health=(%Health% +150) & Set /A BiomeStart=5
ECHO.
PAUSE
GOTO :PostCheck2
PAUSE

:SetPosition
ECHO All of a sudden you are able to teleport around the map.
SET /P PositionX=Enter the desired (X) Coordinate: 
SET /P Position=Enter the desired (Y) Coordinate: 
PAUSE
ECHO Position: X:(%PositionX%) Y:(%Position%)
PAUSE
GOTO :PostCheck

:SetDays
ECHO All of a sudden you are able to teleport into the future.
SET /P TotalDays=Enter the desired number of days survived: 
PAUSE
ECHO Total Days Survived: %TotalDays%
PAUSE
GOTO :PostCheck

:Map
Set /A IntroKey=1
CLS
ECHO Position: X:(%PositionX%) Y:(%Position%)
SET /A MapID=0
::IF %Position% LEQ 25 ( IF %Position% GEQ 0 ( IF %PositionX% LEQ 25 ( IF %PositionX% GEQ 0 ( TYPE "img\maps\0_x0y0.txt" & SET /A MapID=1 & SET /A Tile=0))))
IF %Position% GEQ 0 ( IF %Position% LEQ 125 ( IF %PositionX% GEQ -125 ( IF %PositionX% LEQ 0 ( TYPE "img\maps\1_x-125y+125.txt" & SET /A MapID=1 & SET /A Tile=1))))
IF %Position% LEQ 0 ( IF %Position% GEQ -125 ( IF %PositionX% GEQ -125 ( IF %PositionX% LEQ 0 ( TYPE "img\maps\2_x-125y-125.txt" & SET /A MapID=1 & SET /A Tile=2))))
IF %Position% LEQ 0 ( IF %Position% GEQ -125 ( IF %PositionX% LEQ 125 ( IF %PositionX% GEQ 0 ( TYPE "img\maps\3_x+125y-125.txt" & SET /A MapID=1 & SET /A Tile=3))))
IF %Position% GEQ 0 ( IF %Position% LEQ 125 ( IF %PositionX% LEQ 125 ( IF %PositionX% GEQ 0 ( TYPE "img\maps\4_x+125y+125.txt" & SET /A MapID=1 & SET /A Tile=4))))
IF %Position% GEQ 125 ( IF %Position% LEQ 250 ( IF %PositionX% LEQ 125 ( IF %PositionX% GEQ 0 ( TYPE "img\maps\5_x+125y+250.txt" & SET /A MapID=1 & SET /A Tile=5))))
IF %Position% GEQ 125 ( IF %Position% LEQ 250 ( IF %PositionX% GEQ -125 ( IF %PositionX% LEQ 0 ( TYPE "img\maps\6_x-125y+250.txt" & SET /A MapID=1 & SET /A Tile=6))))
IF %Position% GEQ 125 ( IF %Position% LEQ 250 ( IF %PositionX% GEQ -250 ( IF %PositionX% LEQ -125 ( TYPE "img\maps\7_x-250y+250.txt" & SET /A MapID=1 & SET /A Tile=7))))
IF %Position% GEQ 0 ( IF %Position% LEQ 125 ( IF %PositionX% GEQ -250 ( IF %PositionX% LEQ -125 ( TYPE "img\maps\8_x-250y+125.txt" & SET /A MapID=1 & SET /A Tile=8))))
IF %Position% LEQ 0 ( IF %Position% GEQ -125 ( IF %PositionX% GEQ -250 ( IF %PositionX% LEQ -125 ( TYPE "img\maps\9_x-250y-125.txt" & SET /A MapID=1 & SET /A Tile=9))))
IF %Position% LEQ -125 ( IF %Position% GEQ -250 ( IF %PositionX% GEQ -250 ( IF %PositionX% LEQ -125 ( TYPE "img\maps\10_x-250y-250.txt" & SET /A MapID=1 & SET /A Tile=10))))
IF %Position% LEQ -125 ( IF %Position% GEQ -250 ( IF %PositionX% LEQ 0 ( IF %PositionX% GEQ -125 ( TYPE "img\maps\11_x-125y-250.txt" & SET /A MapID=1 & SET /A Tile=11))))
IF %Position% LEQ -125 ( IF %Position% GEQ -250 ( IF %PositionX% GEQ 0 ( IF %PositionX% LEQ 125 ( TYPE "img\maps\12_x+125y-250.txt" & SET /A MapID=1 & SET /A Tile=12))))
IF %Position% LEQ -125 ( IF %Position% GEQ -250 ( IF %PositionX% GEQ 125 ( IF %PositionX% LEQ 250 ( TYPE "img\maps\13_x+250y-250.txt" & SET /A MapID=1 & SET /A Tile=13))))
IF %Position% GEQ -125 ( IF %Position% LEQ 0 ( IF %PositionX% GEQ 125 ( IF %PositionX% LEQ 250 ( TYPE "img\maps\14_x+250y-125.txt" & SET /A MapID=1 & SET /A Tile=14))))
IF %Position% GEQ 0 ( IF %Position% LEQ 125 ( IF %PositionX% GEQ 125 ( IF %PositionX% LEQ 250 ( TYPE "img\maps\15_x+250y+125.txt" & SET /A MapID=1 & SET /A Tile=15))))
IF %Position% GEQ 125 ( IF %Position% LEQ 250 ( IF %PositionX% GEQ 125 ( IF %PositionX% LEQ 250 ( TYPE "img\maps\16_x+250y+250.txt" & SET /A MapID=1 & SET /A Tile=16))))
IF %MapID%==0 ECHO NO MAP FOUND FOR RELATIVE POSITION
ECHO.
ECHO You take a look at your map of the area.
ECHO.
ECHO Key: X - Your approximate location.
::ECHO @ - Bulzolgons location
ECHO.
PAUSE
GOTO :Drawbridge

:North
Set /A IntroKey=1
CLS
IF %RestCounter% GEQ 1 SET /A RestCounter=%RestCounter% - 1
Set Direction=North
SET /A Turnroll=%RANDOM% %% 21
Set /A Turn=%Turn% + 1
IF %BiomeLocation%==Waste Set /A Stamina=%Stamina% - 8
IF %BiomeLocation%==Snow Set /A Stamina=%Stamina% - 6
IF %BiomeLocation%==Forest Set /A Stamina=%Stamina% - 2
IF %BiomeLocation%==Desert Set /A Stamina=%Stamina% - 10
Set /A Position=%Position%+4
ECHO Health: %Health% Rads: %Radiation%
ECHO Stamina: %Stamina%
ECHO Weapon: %WeaponType%
Echo Climate: %ClimateType%
ECHO Location: %BiomeLocation%
ECHO Position: X:(%PositionX%) Y:(%Position%)
Echo Turn: %Turn%
ECHO Direction: %Direction% Turn: %Turnroll% >> "exp\debug.log"
ECHO.
ECHO.
ECHO.
IF %Position% GEQ 250 Set /A Position=250 & ECHO You can not travel any further north.
IF %Position% LEQ 250 ECHO You went north.
::EncounterBlock1
IF %Turnroll%==1 GOTO :Wolf
IF %Turnroll%==2 GOTO :Zombie
IF %Turnroll%==3 GOTO :Water
IF %Turnroll%==4 GOTO :WeaponBreaks
IF %Turnroll%==5 GOTO :Horde
IF %Turnroll%==6 GOTO :Food
IF %Turnroll%==11 GOTO :SleepDemonGate
IF %Turnroll%==12 GOTO :ConditionalDamage
IF %Turnroll%==14 GOTO :NewEncounters
IF %Turnroll%==15 GOTO :NewEncounters
IF %Turnroll%==16 GOTO :Wasp
IF %Turnroll%==17 GOTO :vWolf
IF %Turnroll%==18 GOTO :Licker
IF %Turnroll%==19 GOTO :sPig
IF %Turnroll%==20 (IF %Health% LEQ 50 GOTO :unexObj)
IF %Turnroll%==20 (IF %Health% GEQ 51 GOTO :Wolf)
IF %Stamina% LEQ 0 ECHO You must rest. & Pause & GOTO :Rest
IF %Health% LEQ 0 GOTO :Death
IF %Radiation% GEQ 56 GOTO :Death
IF %BiomeLocation%==Waste ECHO You are taking radiation damage.
PAUSE
GOTO :Drawbridge

:South
Set /A IntroKey=1
IF %RestCounter% GEQ 1 SET /A RestCounter=%RestCounter% - 1
Set Direction=South
SET /A Turnroll=%RANDOM% %% 21
CLS
Set /A Turn=%Turn% + 1
IF %BiomeLocation%==Waste Set /A Stamina=%Stamina% - 8
IF %BiomeLocation%==Snow Set /A Stamina=%Stamina% - 6
IF %BiomeLocation%==Forest Set /A Stamina=%Stamina% - 2
IF %BiomeLocation%==Desert Set /A Stamina=%Stamina% - 10
Set /A Position=%Position%-4
ECHO Health: %Health% Rads: %Radiation%
ECHO Stamina: %Stamina%
ECHO Weapon: %WeaponType%
Echo Climate: %ClimateType%
ECHO Location: %BiomeLocation%
ECHO Position: X:(%PositionX%) Y:(%Position%)
Echo Turn: %Turn%
ECHO Direction: %Direction% Turn: %Turnroll% >> "exp\debug.log"
ECHO.
ECHO.
ECHO.
IF %Position% LEQ -250 Set /A Position=-250 & ECHO You can not travel any further south.
IF %Position% GEQ -250 ECHO You went South.
IF %Turnroll%==1 GOTO :Wolf
IF %Turnroll%==2 GOTO :Zombie
IF %Turnroll%==3 GOTO :Water
IF %Turnroll%==4 GOTO :WeaponBreaks
IF %Turnroll%==5 GOTO :Horde
IF %Turnroll%==6 GOTO :Food
IF %Turnroll%==11 GOTO :SleepDemonGate
IF %Turnroll%==12 GOTO :ConditionalDamage
IF %Turnroll%==14 GOTO :NewEncounters
IF %Turnroll%==15 GOTO :NewEncounters
IF %Turnroll%==16 GOTO :Wasp
IF %Turnroll%==17 GOTO :vWolf
IF %Turnroll%==18 GOTO :Licker
IF %Turnroll%==19 GOTO :sPig
IF %Turnroll%==20 (IF %Health% LEQ 50 GOTO :unexObj)
IF %Turnroll%==20 (IF %Health% GEQ 51 GOTO :Wolf)
IF %Stamina% LEQ 0 ECHO You must rest. & Pause & GOTO :Rest
IF %Health% LEQ 0 GOTO :Death
IF %Radiation% GEQ 56 GOTO :Death
IF %BiomeLocation%==Waste ECHO You are taking radiation damage.
PAUSE
GOTO :Drawbridge

:East
Set /A IntroKey=1
IF %RestCounter% GEQ 1 SET /A RestCounter=%RestCounter% - 1
Set Direction=East
SET /A Turnroll=%RANDOM% %% 21
CLS
Set /A Turn=%Turn% + 1
IF %BiomeLocation%==Waste Set /A Stamina=%Stamina% -     8
IF %BiomeLocation%==Snow Set /A Stamina=%Stamina% - 4
IF %BiomeLocation%==Forest Set /A Stamina=%Stamina% - 3
IF %BiomeLocation%==Desert Set /A Stamina=%Stamina% - 8
Set /A PositionX=%PositionX%+4
ECHO Health: %Health% Rads: %Radiation%
ECHO Stamina: %Stamina%
ECHO Weapon: %WeaponType%
Echo Climate: %ClimateType%
ECHO Location: %BiomeLocation%
ECHO Position: X:(%PositionX%) Y:(%Position%)
Echo Turn: %Turn%
ECHO Direction: %Direction% Turn: %Turnroll% >> "exp\debug.log"
ECHO.
ECHO.
ECHO.
IF %PositionX% GEQ 250 Set /A PositionX=250 & ECHO You can not travel any further East.
IF %PositionX% LEQ 250 ECHO You went East.
IF %Turnroll%==1 GOTO :Wolf
IF %Turnroll%==2 GOTO :Zombie
IF %Turnroll%==3 GOTO :Water
IF %Turnroll%==4 GOTO :WeaponBreaks
IF %Turnroll%==5 GOTO :Horde
IF %Turnroll%==6 GOTO :Food
IF %Turnroll%==11 GOTO :SleepDemonGate
IF %Turnroll%==12 GOTO :ConditionalDamage
IF %Turnroll%==14 GOTO :NewEncounters
IF %Turnroll%==15 GOTO :NewEncounters
IF %Turnroll%==16 GOTO :Wasp
IF %Turnroll%==17 GOTO :vWolf
IF %Turnroll%==18 GOTO :Licker
IF %Turnroll%==19 GOTO :sPig
IF %Turnroll%==20 (IF %Health% LEQ 50 GOTO :unexObj)
IF %Turnroll%==20 (IF %Health% GEQ 51 GOTO :Wolf)
IF %Stamina% LEQ 0 ECHO You must rest. & Pause & GOTO :Rest
IF %Health% LEQ 0 GOTO :Death
IF %Radiation% GEQ 56 GOTO :Death
IF %BiomeLocation%==Waste ECHO You are taking radiation damage.
PAUSE
GOTO :Drawbridge

:West
Set /A IntroKey=1
IF %RestCounter% GEQ 1 SET /A RestCounter=%RestCounter% - 1
Set Direction=West
SET /A Turnroll=%RANDOM% %% 21
CLS
Set /A Turn=%Turn% + 1
IF %BiomeLocation%==Waste Set /A Stamina=%Stamina% - 8
IF %BiomeLocation%==Snow Set /A Stamina=%Stamina% - 2
IF %BiomeLocation%==Forest Set /A Stamina=%Stamina% - 3
IF %BiomeLocation%==Desert Set /A Stamina=%Stamina% - 8
Set /A PositionX=%PositionX%-4
ECHO Health: %Health% Rads: %Radiation%
ECHO Stamina: %Stamina%
ECHO Weapon: %WeaponType%
Echo Climate: %ClimateType%
ECHO Location: %BiomeLocation%
ECHO Position: X:(%PositionX%) Y:(%Position%)
Echo Turn: %Turn%
ECHO Direction: %Direction% Turn: %Turnroll% >> "exp\debug.log"
ECHO.
ECHO.
ECHO.
IF %PositionX% LEQ -250 Set /A PositionX=-250 & ECHO You can not travel any further West.
IF %PositionX% GEQ -250 ECHO You went West.
IF %Turnroll%==1 GOTO :Wolf
IF %Turnroll%==2 GOTO :Zombie
IF %Turnroll%==3 GOTO :Water
IF %Turnroll%==4 GOTO :WeaponBreaks
IF %Turnroll%==5 GOTO :Horde
IF %Turnroll%==6 GOTO :Food
IF %Turnroll%==11 GOTO :SleepDemonGate
IF %Turnroll%==12 GOTO :ConditionalDamage
IF %Turnroll%==14 GOTO :NewEncounters
IF %Turnroll%==15 GOTO :NewEncounters
IF %Turnroll%==16 GOTO :Wasp
IF %Turnroll%==17 GOTO :vWolf
IF %Turnroll%==18 GOTO :Licker
IF %Turnroll%==19 GOTO :sPig
IF %Turnroll%==20 (IF %Health% LEQ 50 GOTO :unexObj)
IF %Turnroll%==20 (IF %Health% GEQ 51 GOTO :Wolf)
IF %Stamina% LEQ 0 ECHO You must rest. & Pause & GOTO :Rest
IF %Health% LEQ 0 GOTO :Death
IF %Radiation% GEQ 56 GOTO :Death
IF %BiomeLocation%==Waste ECHO You are taking radiation damage.
PAUSE
GOTO :Drawbridge

:Rest
Set /A IntroKey=1
SET /A RestCounter=%RestCounter% + 4
Set Direction=NoWhere
SET /A Turnroll=%RANDOM% %% 21
CLS
Set /A Turn=%Turn% + 2
IF %Stamina% LEQ 201 Set /A Stamina=%Stamina% + 80
IF %Health% LEQ 101 Set /A Health=%Health% + 20
Set /A Position=%Position% + 0
ECHO Health: %Health% Rads: %Radiation%
ECHO Stamina: %Stamina%
ECHO Weapon: %WeaponType%
Echo Climate: %ClimateType%
ECHO Location: %BiomeLocation%
ECHO Position: X:(%PositionX%) Y:(%Position%)
Echo Turn: %Turn%
ECHO Direction: %Direction% Turn: %Turnroll% >> "exp\debug.log"
ECHO.
ECHO.
ECHO.
ECHO You rested for the night.
IF %Turnroll%==1 GOTO :Wolf
IF %Turnroll%==2 GOTO :Zombie
IF %Turnroll%==3 GOTO :Water
IF %Turnroll%==4 GOTO :SleepDemonGate
IF %Turnroll%==5 GOTO :NewEncounters
IF %Turnroll%==8 GOTO :SleepDemonGate
IF %Turnroll%==6 GOTO :SleepDemonGate
IF %Turnroll%==7 GOTO :SleepDemonGate
IF %Turnroll%==9 GOTO :NewEncounters
IF %Turnroll%==10 GOTO :SleepDemonGate
IF %Turnroll%==12 GOTO :NewEncounters
IF %Turnroll%==14 GOTO :NewEncounters
IF %Turnroll%==15 GOTO :SleepDemonGate
IF %Turnroll%==16 GOTO :Wasp
IF %Turnroll%==17 GOTO :vWolf
IF %Turnroll%==18 GOTO :Licker
IF %Turnroll%==19 GOTO :sPig
IF %Turnroll%==20 (IF %Health% LEQ 50 GOTO :unexObj)
IF %Turnroll%==20 (IF %Health% GEQ 51 GOTO :Wolf)
IF %Health% LEQ 0 GOTO :Death
IF %Radiation% GEQ 56 GOTO :Death
IF %RestCounter% GEQ 8 ECHO Your rest has awakened Bulzongon. His thirst for well rested individuals will not be sated until you are dead. & Set /A BulzolgonGate=1
IF %BiomeLocation%==Waste ECHO You are taking radiation damage.
PAUSE
GOTO :Drawbridge

:SleepFull
ECHO Sleepcount: %RestCounter% 
PAUSE
Set /A RestCounter=%RestCounter%+50 & Set /A BulzolgonGate=1
ECHO Sleepcount: %RestCounter% 
ECHO Bulzulgon Enemies Spawned (Active): %BulzolgonGate%
ECHO.
PAUSE
GOTO :Drawbridge

:SleepDemonGate
IF %BulzolgonGate%==0 ECHO You head %Direction% in an attempt to avoid the harsh nature of the %BiomeLocation%.
IF %BulzolgonGate%==1 GOTO SleepDemon
PAUSE
GOTO :Drawbridge

::EncounterBlock2
:NewEncounters
CLS
SET /A EncounterRoll=%RANDOM% %% 26
ECHO NewEncounter Table Roll: %EncounterRoll% >> "exp\debug.log"
IF %EncounterRoll%==0 GOTO :Skeleton
IF %EncounterRoll%==1 GOTO :Beaver
IF %EncounterRoll%==2 GOTO :Cow
IF %EncounterRoll%==3 GOTO :DeathNPC
IF %EncounterRoll%==4 GOTO :Dementos
IF %EncounterRoll%==5 GOTO :FemaleNPC
IF %EncounterRoll%==8 GOTO :HybridAlien
IF %EncounterRoll%==6 GOTO :MaleNPC
IF %EncounterRoll%==7 GOTO :MysteryNPC
IF %EncounterRoll%==8 GOTO :Scorpion
IF %EncounterRoll%==9 GOTO :Skeleton
IF %EncounterRoll%==10 GOTO :TwinDancer
IF %EncounterRoll%==11 GOTO :Unicorn
IF %EncounterRoll%==12 GOTO :AlienBlaster
IF %EncounterRoll%==13 GOTO :Cig
IF %EncounterRoll%==14 GOTO :Liquor
IF %EncounterRoll%==15 GOTO :Shotgun
IF %EncounterRoll%==16 GOTO :Sword
IF %EncounterRoll%==17 GOTO :Wine
IF %EncounterRoll%==18 GOTO :Weed
IF %EncounterRoll%==19 GOTO :Medication
IF %EncounterRoll%==20 GOTO :MaleNPC
IF %EncounterRoll%==21 GOTO :Skeleton
IF %EncounterRoll%==22 GOTO :Skeleton
IF %EncounterRoll%==23 GOTO :Skeleton
IF %EncounterRoll%==24 GOTO :Liquor
IF %EncounterRoll%==25 GOTO :RareEncounters
ECHO.
PAUSE
GOTO :Drawbridge
ECHO.

::EncounterBlock3
:RareEncounters
CLS
SET /A EncounterRoll2=%RANDOM% %% 7
ECHO RareEncounter Table Roll: %EncounterRoll2% >> "exp\debug.log"
IF %EncounterRoll2%==0 ECHO Wow. & ECHO. & TYPE "img\text\rare.txt" & ECHO. & PAUSE & GOTO :Walrus
IF %EncounterRoll2%==1 ECHO Hell yeah. & ECHO. & TYPE "img\text\rare.txt" & ECHO. & PAUSE & GOTO :hPig
IF %EncounterRoll2%==2 ECHO Sweet. & ECHO. & TYPE "img\text\rare.txt" & ECHO. & PAUSE & GOTO :Portal
IF %EncounterRoll2%==3 ECHO Great job. & ECHO. & TYPE "img\text\rare.txt" & ECHO. & PAUSE & GOTO :cGoblin
IF %EncounterRoll2%==4 ECHO Excellent. & ECHO. & TYPE "img\text\rare.txt" & ECHO. & PAUSE & GOTO :2Goblin
IF %EncounterRoll2%==5 ECHO Oh no... & PAUSE & GOTO :NewEncounters
IF %EncounterRoll2%==6 ECHO Damn... & PAUSE & GOTO :NewEncounters
ECHO.
PAUSE
GOTO :Drawbridge
ECHO.

:2Goblin
SET /A waGen=%RANDOM% %% 6
SET /A fuGen=%RANDOM% %% 6
SET /A meGen=%RANDOM% %% 6
CLS
ECHO Achievement: Dual Gobby. >> "exp\stats.log"
ECHO You have encountered two goblins roaming the %BiomeLocation%.
ECHO The leftmost goblin identifies himself as obby.
ECHO The rightmost goblin identifies herself as zoppy.
TYPE "img\enemies\dual-goblins.txt"
ECHO.
ECHO The two goblins scurry up to you and speak unison.
ECHO "Hello dumbass, here are a few key items to make your journey through the %BiomeLocation% easier".
ECHO.
ECHO The two goblins give you %waGen% water bottles, %fuGen% canned foods, %meGen% medications and a dirty shotgun. & Set /A WaterCount=(%WaterCount%+%waGen%) & Set /A FoodCount=(%FoodCount%+%fuGen%) & Set /A MedCount=(%MedCount%+%meGen%) & Set WeaponType=Shotgun& Set /A Power=%Power% + 25
ECHO.
ECHO The goblins scurry off into the distance.
PAUSE
GOTO :Drawbridge

:cGoblin
CLS
ECHO Achievement: Technicolor Gremlin. >> "exp\stats.log"
SET /A CritThresh=%Health% / 2
SET /A Stamina=(%Stamina% - 5)
ECHO You have come across a goblin.
ECHO The Goblin murmurs and then says alloud, "Hello friend my name is Azul."
ECHO "I live in a yellow house here in the %BiomeLocation% and have been known to eat purple berries."
ECHO.
TYPE "img\enemies\color-goblin.txt"
ECHO. 
ECHO "I will grant you a mythical item if you can answer my simple question.", he continues.
ECHO "But if you fail, you will face perverted consequences"
ECHO Do you accept my challenge?:
SET /P cGoblinChoice=Will you?(Yes, No): 
IF %cGoblinChoice%==Yes GOTO GoblinChallenge
IF %cGoblinChoice%==No GOTO AvoidGoblin
ECHO That is not a valid response. & PAUSE & GOTO :cGoblin
:GoblinChallenge
ECHO You accept the goblins challenge.
ECHO.
ECHO He laughs and says, "It is quite a simple question if I do say so myself".
ECHO.
ECHO What is the color of my...
IF !pseudo3[%rndInt3%]!==Colorblind Call :ColorText 0E "jerry-jimbuckle" & ECHO ?", laughing as he points to his dick.
IF !pseudo3[%rndInt3%]!==Idiotic Call :ColorText 0C "jerry-jimbuckle" & ECHO ?", laughing as he points to his dick.
IF !pseudo3[%rndInt3%]!==Lethargic Call :ColorText 09 "jerry-jimbuckle" & ECHO ?", laughing as he points to his dick.
IF !pseudo3[%rndInt3%]!==Angry Call :ColorText 0A "jerry-jimbuckle" & ECHO ?", laughing as he points to his dick.
IF !pseudo3[%rndInt3%]!==Pleased Call :ColorText 0D "jerry-jimbuckle" & ECHO ?", laughing as he points to his dick.
IF !pseudo3[%rndInt3%]!==Strange Call :ColorText 0F "jerry-jimbuckle" & ECHO ?", laughing as he points to his dick.
ECHO.
SET /P cGoblinChoice2=What is the color of his jerry-jimbuckle?(Yellow, Red, Blue, Green, Purple, White): 
IF %cGoblinChoice2%==Yellow GOTO WinGoblinChallenge
GOTO LoseGoblinChallenge
:WinGoblinChallenge
CLS
ECHO "Excellent", the goblin says aloud.
ECHO.
ECHO The goblin snaps his fingers and materializes a chest in front of you.
ECHO You open the chest to find...
TYPE "img\items\cgsword.txt"
ECHO.
ECHO ... "Its the unholy sword of bananas", he explains.
ECHO Use it wisely. & Set WeaponType=UnholySword& Set /A Power=%Power% + 300
ECHO.
ECHO It grants great power....
ECHO But if it ever breaks, you will become the least powerful being on earth.
ECHO You nod and head off into the %BiomeLocation%.
PAUSE
GOTO :Drawbridge
:LoseGoblinChallenge
ECHO You answered incorrectly. The Goblin gets hard as a rock and thrusts into you.
SET /A NPCRNG=%RANDOM% %% 1000
SET /A PLAYERRNG=%RANDOM% %% 300
SET /A NPCRAND=((%RANDOM% %% 250) + NPCRNG)
SET /A PLAYERRAND=(%RANDOM% %% 500) + Power
ECHO.
PAUSE
IF %NPCRAND% LEQ %PLAYERRAND% ECHO You struck the rock hard goblin with %PLAYERRAND% points of damage. You killed him. & SET /A Health=%Health% - %NPCRAND%
IF %NPCRAND% GEQ %PLAYERRAND% ECHO The goblin inserts himeself into you with %NPCRAND% points of damage and then flys off. & SET /A Health=%Health% - %NPCRAND% & IF %NPCRAND% GEQ %CritThresh% Type "img\text\criticalhit.txt" & ECHO. & ECHO You took an exceptional amount of damage. & ECHO.
IF %NPCRAND% == %PLAYERRAND% ECHO You blocked the attack. & PAUSE & GOTO :LoseGoblinChallenge
PAUSE
GOTO :Drawbridge
:AvoidGoblin
CLS
ECHO.
IF !pseudo4[%rndInt4%]!==Autistic ECHO You are so enthralled by the brilliant challenge that the goblin presents you.
IF !pseudo4[%rndInt4%]!==Autistic ECHO Your autism and perpensity to act out cause you to accept the goblins challenge. & PAUSE & GOTO :GoblinChallenge
ECHO You decide to decline the goblins challenge.
ECHO. 
ECHO "Thats to bad", he exclaims.
ECHO You would have made an excellent goblin queen.
ECHO If only you would have accepted the goblins challenge...
ECHO.
PAUSE & GOTO :Drawbridge
PAUSE
GOTO :Drawbridge

:Portal
CLS
SET /A PortalRoll=%RANDOM% %% 2
SET /A Stamina=(%Stamina% + 40)
ECHO You come across a wall in the %BiomeLocation%.
ECHO The wall is swirling and binging with a mystical blue smoke.
ECHO As you get closer to the wall you relize that it is covered with a viscous mirror like substance.
ECHO You are in awe of this event.
ECHO.
TYPE "img\enemies\portal.txt"
ECHO. 
ECHO Do you attempt to enter the wall covered in the mirror substance or not?
SET /P PortalChoice=Will you?(Yes, No): 
IF %PortalChoice%==Yes GOTO EnterPortal
IF %PortalChoice%==No GOTO LeavePortal
ECHO That is not a valid response. & PAUSE & GOTO :Portal
:EnterPortal
CLS
ECHO.
ECHO You decide to enter the wall.
ECHO.
If %PortalRoll%==0 ECHO Achievement: Different Dimension Survivor. >> "exp\stats.log"
If %PortalRoll%==0 ECHO You enter the portal and everything around you goes black.
If %PortalRoll%==0 ECHO All of a sudden your body is distorted and twisted to a single point on the horizon.
If %PortalRoll%==0 ECHO Days pass in the span of seconds.
If %PortalRoll%==0 ECHO You are traveling past worlds in other deminsions when suddenly you find yourself hurling towards another portal.
If %PortalRoll%==0 ECHO You collide with the portal and find yourself back on earth.
If %PortalRoll%==0 ECHO.
If %PortalRoll%==0 TYPE "img\items\ddsword.txt"
If %PortalRoll%==0 ECHO.
If %PortalRoll%==0 ECHO Mysteriously, you find an enchanted flaming sword in your inventory and equipt it. & Set WeaponType=DimensionalSword & Set /A Power=%Power% + 150 
If %PortalRoll%==0 ECHO.
If %PortalRoll%==0 ECHO You make your way away from the portal and head toward the %BiomeLocation%.
If %PortalRoll%==0 PAUSE & GOTO :Drawbridge
If %PortalRoll%==0 ECHO Achievement: Different Dimension Dier. >> "exp\stats.log"
If %PortalRoll%==1 ECHO You enter the portal and everythng goes yellow.
If %PortalRoll%==1 ECHO All of a sudden the world around you twists and bends into a single point on the horizon.
If %PortalRoll%==1 ECHO Your bones crack and break as your body contorts into nothingness.
If %PortalRoll%==1 ECHO You are instanalty killed.
If %PortalRoll%==1 PAUSE & GOTO :Death
PAUSE
GOTO :Drawbridge
:LeavePortal
CLS
ECHO.
IF !pseudo4[%rndInt4%]!==Stupid ECHO You attempt to walk away from the portal.
IF !pseudo4[%rndInt4%]!==Stupid ECHO You are so stupid that you accidently walk into it instead. & PAUSE & GOTO :EnterPortal
If %PortalRoll%==0 ECHO Achievement: Different Dimension Deserter. >> "exp\stats.log"
ECHO You decide to leave the wall.
ECHO. 
ECHO You walk off into the distance wondering what cool items or adventures could have taken place.
ECHO If only you would have walked through thr portal...
ECHO.
PAUSE & GOTO :Drawbridge
PAUSE
GOTO :Drawbridge


:Walrus
CLS
ECHO Achievement: Walrus Lover. >> "exp\stats.log"
SET /A CritThresh=%Health% / 2
SET /A Stamina=(%Stamina% - 5)
ECHO You have come across a trio of enchanted talking walri.
ECHO The three walri wobble toward you on your trek through the %BiomeLocation%.
ECHO.
TYPE "img\enemies\walrus.txt"
ECHO. 
ECHO The largest walri garfs, "Howdy there, do you wish to battle"
ECHO The smallest one chimes in, "Or partake in our darkest sexual fantasies"
ECHO The middlest walrus harps, "The choice is yours and only yours to make my friend"
SET /P WalrusChoice=What do you do?(Battle, Sex): 
IF %WalrusChoice%==Battle GOTO WalrusBattle
IF %WalrusChoice%==Sex GOTO WalrusSex
ECHO That is not a valid response. & PAUSE & GOTO :Walrus
:WalrusBattle
ECHO You decide to battle the walri.
SET /A NPCRNG=%RANDOM% %% 1000
SET /A PLAYERRNG=%RANDOM% %% 300
SET /A NPCRAND=((%RANDOM% %% 250) + NPCRNG)
SET /A PLAYERRAND=(%RANDOM% %% 500) + Power
ECHO.
PAUSE
IF %NPCRAND% LEQ %PLAYERRAND% ECHO You struck the three walri with %PLAYERRAND% points of damage. You killed them and found a weapon in the aftermath of the battle & SET /A Health=%Health% - %NPCRAND% & Set WeaponType=Spoon& Set /A Power=%Power% + 110 
IF %NPCRAND% GEQ %PLAYERRAND% ECHO The three walri fuck you with %NPCRAND% points of damage and flee the battle scene. & SET /A Health=%Health% - %NPCRAND% & IF %NPCRAND% GEQ %CritThresh% Type "img\text\criticalhit.txt" & ECHO. & ECHO You took an exceptional amount of damage. & ECHO.
IF %NPCRAND% == %PLAYERRAND% ECHO You blocked the attack. & PAUSE & GOTO :WalrusBattle
PAUSE
GOTO :Drawbridge
:WalrusSex
ECHO.
ECHO You decide to have sex with the walri.
ECHO You strip down and embrace the love of your new sea mammal companions.
ECHO.
ECHO After hours of extremely satisfying sex you pass out.
ECHO Hours later you wake up to the three walri making you a hearty breakfast.
ECHO "Mmm" you take in a delicious helping of eggs and bacon. & SET /A Health=(%Health% + 100)
ECHO.
ECHO You and the three walri part ways for now...
ECHO.
Pause
GOTO :Drawbridge

:hPig
CLS
ECHO Achievement: Count Pigulons Horde. >> "exp\stats.log"
SET /A CritThresh=%Health% / 2
SET /A Stamina=(%Stamina% - 5)
ECHO You hear rumbling off in the distance. It gets louder and louder untill..
ECHO.
ECHO BOOM. Thousands of pigs cross your path, stampeding through the %BiomeLocation%.
ECHO You hear them chanting "Kill the infidel."
ECHO.
TYPE "img\enemies\pig-horde.txt"
ECHO. 
ECHO In a moment of panick you are prompted to make a decision.
ECHO Do you run from the pig horde?
ECHO Or do you attack the piggy foes?
SET /P PigHordeChoice=What do you do?(Battle, Run): 
IF %PigHordeChoice%==Battle GOTO PigHordeBattle
IF %PigHordeChoice%==Run GOTO PigHordeRun
ECHO That is not a valid response. & PAUSE & GOTO :hPig
:PigHordeBattle
ECHO You decide to battle the pig horde.
SET /A NPCRNG=%RANDOM% %% 200
SET /A PLAYERRNG=%RANDOM% %% 150
SET /A NPCRAND=((%RANDOM% %% 65) + NPCRNG)
SET /A PLAYERRAND=(%RANDOM% %% 35) + Power
ECHO.
PAUSE
IF %NPCRAND% LEQ %PLAYERRAND% ECHO You strike the pig horde with %PLAYERRAND% points of damage. You killed them and found 5x medications in the wake of battle. & SET /A Health=%Health% - %NPCRAND% & Set /A MedCount=%MedCount% + 5 & PAUSE & GOTO :Drawbridge
IF %NPCRAND% GEQ %PLAYERRAND% ECHO The countless pigs trample you with %NPCRAND% points of damage and run off into the distance. & SET /A Health=%Health% - %NPCRAND% & IF %NPCRAND% GEQ %CritThresh% Type "img\text\criticalhit.txt" & ECHO. & ECHO You took an exceptional amount of damage. & ECHO.
IF %NPCRAND% == %PLAYERRAND% ECHO You blocked the attack. & PAUSE & GOTO :PigHordeBattle
PAUSE
GOTO :Drawbridge
:PigHordeRun
ECHO.
ECHO You attempt to run from the pig horde.
ECHO You run as fast as you can but they eventually trample you anyway.
ECHO.
ECHO They break your weapon and cause you to drop everything from your bag. & SET /A Health=(%Health% - 50) & SET /A WaterCount=0 & SET /A FoodCount=0 & SET /A MedCount=0 & SET /A FoodCount=0 & Set WeaponType=None & Set /A Power=%Power% - 50
ECHO.
ECHO The pig horde runs off into the distance, never to be seen again... for now...
ECHO.
Pause
GOTO :Drawbridge

:Weed
CLS
SET /A ItemRoll=%RANDOM% %% 4
TYPE "img\encounters\weed.txt"
ECHO.
ECHO Bruh.. You totally just found a hookah loaded up with that dank ass weed in the %BiomeLocation%.
ECHO.
IF !pseudo2[%rndInt2%]!==Alcoholic ECHO After several puffs you begin to realize, "Damn alcohol sucks". You are now cured of alcoholism.
IF !pseudo2[%rndInt2%]!==Drifter ECHO After several puffs you realize that home is probably where the heart is.
IF !pseudo2[%rndInt2%]!==Addict ECHO After several puffs you think to yourself, "Damn I could use a bump of meth."
IF !pseudo2[%rndInt2%]!==Friendly ECHO After several puffs you wish you had a friend to share it with.
IF !pseudo2[%rndInt2%]!==Intelligent ECHO After several puffs you discover the key to mortality and the meaning of life. & SET /A Health=(%Health% + 999)
IF !pseudo2[%rndInt2%]!==Calm ECHO After several puffs you lose track of time. & Set /A Turn=%Turn% + 99
IF !pseudo3[%rndInt3%]!==Colorblind ECHO You take a few more puffs of the great green plant... or is it blue? or red? Hmm.. You dont know.
IF !pseudo3[%rndInt3%]!==Idiotic ECHO You take few more puffs of the substance and come to realize that it is nothing but toilet paper.
IF !pseudo3[%rndInt3%]!==Lethargic ECHO You try to take a few more puffs but cant muster the strength. You are now suffering from muscle atrophy. & SET /A Stamina=(%Stamina% - 999)
IF !pseudo3[%rndInt3%]!==Angry ECHO You take a few more puffs and go into a blind rage and fight a scorpion crawling around in the %BiomeLocation% next to you. & PAUSE & GOTO Scorpion
IF !pseudo3[%rndInt3%]!==Pleased ECHO You take a few more puffs and realize just how satisfied you are living in a post apocalyptic world.
IF !pseudo3[%rndInt3%]!==Strange ECHO You take a few more puffs, decide to get naked and fuck a cactus. This inflicts harsh genetial wounds. & SET /A Health=(%Health% + 40)
IF !pseudo4[%rndInt4%]!==Leader ECHO You inhale your last puff and order all the animals around you to construct a status in your honor.
IF !pseudo4[%rndInt4%]!==Leader ECHO You managed to have a statue erected in your honor. >> "exp\stats.log"
IF %BiomeLocation%==Desert (IF !pseudo4[%rndInt4%]!==Stupid ECHO You inhale the last puff and decide to start smoking sand. You inhale glass shards and die. & PAUSE & GOTO :Death)
IF %BiomeLocation%==Snow (IF !pseudo4[%rndInt4%]!==Stupid ECHO You inhale the last puff and attempt to start smoking ice. It melts and ruins the hookah. Good job dummy.)
IF %BiomeLocation%==Forest (IF !pseudo4[%rndInt4%]!==Stupid ECHO You inhale the last puff and decide to start smoking tree bark. It gives you headlice and you think "things would be better if I wasnt so fucking stupid.")
IF %BiomeLocation%==Waste (IF !pseudo4[%rndInt4%]!==Stupid SET /A Radiation=0 & ECHO You inhale the last puff and decide to start smoking radioactive material. Surprisingly, it cures your radiation.)
IF %BiomeLocation%==Mountains (IF !pseudo4[%rndInt4%]!==Stupid ECHO You take your last puff and reach up into the sky, pull a cloud down and pack it into the hookah. Thats right, you are smoking a god damn cloud.)
IF !pseudo4[%rndInt4%]!==Autistic ECHO You throw the hookah out in the %BiomeLocation% and start playing with your fidget spinner.
IF !pseudo4[%rndInt4%]!==Happy ECHO You take the last puff and feel happy with the results.
IF !pseudo4[%rndInt4%]!==Sad ECHO You take the last puff and feel sad about the person you are on the inside.
IF !pseudo4[%rndInt4%]!==Winded ECHO You take the last puff and almost die from lack of oxygen. & SET /A Health=1
ECHO.
PAUSE
GOTO :Drawbridge
PAUSE

:Wine
CLS
SET /A ItemRoll=%RANDOM% %% 4
TYPE "img\items\wine.txt"
ECHO.
ECHO While piddle-paddling around in the %BiomeLocation% you managed to find some wine.
ECHO You know wine makes you a sassy kitty but decide to drink it anyway.
IF !pseudo2[%rndInt2%]!==Alcoholic ECHO You are an alcoholic who is now relapsing. You pass out crying after reflecting on what you have done.
IF !pseudo2[%rndInt2%]!==Alcoholic ECHO You hang yourself in the morning. & PAUSE & GOTO :Death
IF %ItemRoll%==1 ECHO You drink the wine and feel like you are ready to take on Bulzolgog. & SET /A Stamina=(%Stamina% + 100) & SET /A Health=(%Health% +20) & PAUSE & GOTO :SleepDemon
IF %ItemRoll%==2 ECHO You drink the wine and immediatly need a cigarette. & SET /A Stamina=(%Stamina% + 80) & SET /A Health=(%Health% +5) & PAUSE & GOTO :Cig
IF %ItemRoll%==3 ECHO You drink the wine and immediatly seek out male attention. & SET /A Stamina=(%Stamina% + 120) & SET /A Health=(%Health% -10) & PAUSE & GOTO :MaleNPC
ECHO.
PAUSE
GOTO :Drawbridge

:Sword
CLS
SET /A BlasterRoll=%RANDOM% %% 4
ECHO You stumble upon a sword in the %BiomeLocation%.
ECHO It is embedded in the skull of another player.
ECHO You think to yourself, "This will help me replace my shitty %WeaponType%."
ECHO.
TYPE "img\items\sword.txt"
ECHO.
IF %BlasterRoll%==0 ECHO The sword is in excellent condition. & Set WeaponType=Sword& Set /A Power=%Power% + 40
IF %BlasterRoll%==1 ECHO The sword is in good condition. & Set WeaponType=Sword& Set /A Power=%Power% + 38
IF %BlasterRoll%==2 ECHO The sword is in decent condition. & Set WeaponType=Sword& Set /A Power=%Power% + 32
IF %BlasterRoll%==3 ECHO The sword is in assy condition. & Set WeaponType=Sword& Set /A Power=%Power% + 28
PAUSE
GOTO :Drawbridge

:Liquor
CLS
SET /A ItemRoll=%RANDOM% %% 4
TYPE "img\items\liquor.txt"
ECHO.
ECHO While stumbling around in the %BiomeLocation% you manage to find some of ol' granpappys spirit juice.
IF !pseudo2[%rndInt2%]!==Alcoholic ECHO You are an alcoholic who is now relapsing. You pass out crying after reflecting on what you have done.
IF !pseudo2[%rndInt2%]!==Alcoholic ECHO You hang yourself in the morning. & PAUSE & GOTO :Death
IF %ItemRoll%==0 ECHO You drink the whiskey and feel "Zach Daniels" strong. & SET /A Stamina=(%Stamina% + 100) & SET /A Health=(%Health% +20)
IF %ItemRoll%==1 ECHO You drink the whiskey and feel drunk. & SET /A Stamina=(%Stamina% + 80) & SET /A Health=(%Health% +5)
IF %ItemRoll%==2 ECHO You drink the whiskey and get too fucked up. & SET /A Stamina=(%Stamina% + 120) & SET /A Health=(%Health% -10)
IF %ItemRoll%==3 ECHO You drink the whiskey and get plastered. You think to yourself "zzzzzzcksdidDs" & SET /A Stamina=(%Stamina% - 40) & SET /A Health=(%Health% -20) & PAUSE & GOTO :Drawbridge
ECHO.
PAUSE
GOTO :Drawbridge

:Cig
CLS
SET /A ItemRoll=%RANDOM% %% 4
TYPE "img\items\cig.txt"
ECHO.
ECHO While stumbling around in the %BiomeLocation% you manage to find some of those sweet, sweet cancer sticks.
IF %ItemRoll%==0 ECHO You smoke the cigs and feel amazing. & SET /A Stamina=(%Stamina% + 65) & SET /A Health=(%Health% +10)
IF %ItemRoll%==1 ECHO You smoke the cigs and feel better about yourself. & SET /A Stamina=(%Stamina% + 40) & SET /A Health=(%Health% +7)
IF %ItemRoll%==2 ECHO You smoke the cigs and feel ok. & SET /A Stamina=(%Stamina% + 20) & SET /A Health=(%Health% +5)
IF %ItemRoll%==3 ECHO You smoke the cigs and immediatly get addicted. You think to yourself "Damn, I really fucked up." & SET /A Stamina=(%Stamina% - 40) & SET /A Health=(%Health% -20) & PAUSE & GOTO :Drawbridge
ECHO.
PAUSE
GOTO :Drawbridge

:Shotgun
CLS
SET /A BlasterRoll=%RANDOM% %% 4
ECHO You stumble upon a gunstore in the %BiomeLocation%.
ECHO You walk and see that the place has been looted.
ECHO "Fuck" you think to yourself. How am I ever going to get rid of this shitty %WeaponType%
ECHO A box to the left catches your eye. You open it and find the last remaining shotgun.
ECHO.
TYPE "img\items\shotgun.txt"
ECHO.
IF %BlasterRoll%==0 ECHO The shotgun is in pristine condition. & Set WeaponType=Shotgun& Set /A Power=%Power% + 80 
IF %BlasterRoll%==1 ECHO The shotgun is in good condition. & Set WeaponType=Shotgun& Set /A Power=%Power% + 30
IF %BlasterRoll%==2 ECHO The shotgun is in decent condition. & Set WeaponType=Shotgun& Set /A Power=%Power% + 25
IF %BlasterRoll%==3 ECHO The shotgun is in poor condition. & Set WeaponType=Shotgun& Set /A Power=%Power% + 20
PAUSE
GOTO :Drawbridge

:AlienBlaster
CLS
SET /A BlasterRoll=%RANDOM% %% 4
ECHO You stumble upon an alien corpse in the %BiomeLocation%.
ECHO On its body you find a strange and interesting weapon.
ECHO You pick it up and immeditly think "Fuck yeah, im going to win this game."
ECHO.
TYPE "img\items\alienblaster.txt"
ECHO.
IF %BlasterRoll%==0 ECHO The blaster is in pristine condition. & Set WeaponType=Alienblaster& Set /A Power=%Power% + 65 
IF %BlasterRoll%==1 ECHO The blaster is in good condition. & Set WeaponType=Alienblaster& Set /A Power=%Power% + 45
IF %BlasterRoll%==2 ECHO The blaster is in decent condition. & Set WeaponType=Alienblaster& Set /A Power=%Power% + 25
IF %BlasterRoll%==3 ECHO The blaster is in poor condition. & Set WeaponType=Alienblaster& Set /A Power=%Power% + 15 
PAUSE
GOTO :Drawbridge 

:Unicorn
CLS
SET /A CritThresh=%Health% / 2
SET /A Stamina=(%Stamina% + 25)
ECHO You have encountered a mystical unicorn.
ECHO You gaze at it in awe of its majesty. You immediatly feel like you should kill it and take its horn.
ECHO "Come here you beautiful bitch" you say as you make your way toward the unicorn
TYPE "img\enemies\unicorn.txt"
SET /A NPCRNG=%RANDOM% %% 10
SET /A PLAYERRNG=%RANDOM% %% 3
SET /A NPCRAND=((%RANDOM% %% 40) + NPCRNG)
SET /A PLAYERRAND=(%RANDOM% %% 18) + Power
ECHO.
PAUSE
IF %NPCRAND% LEQ %PLAYERRAND% ECHO You striked the unicorn with %PLAYERRAND% points of damage. You killed itand crafted a makeshift sword out of its horn. & SET /A Health=%Health% - %NPCRAND% & Set WeaponType=Hornsword& Set /A Power=%Power% + 45 
IF %NPCRAND% GEQ %PLAYERRAND% ECHO The unicorn crushed you with %NPCRAND% points of damage and ran off. & SET /A Health=%Health% - %NPCRAND% & IF %NPCRAND% GEQ %CritThresh% Type "img\text\criticalhit.txt" & ECHO. & ECHO You took an exceptional amount of damage. & ECHO.
IF %NPCRAND% == %PLAYERRAND% ECHO You blocked the attack. & PAUSE & GOTO :Unicorn
PAUSE
GOTO :Drawbridge

:TwinDancer
CLS
SET /A CritThresh=%Health% / 2
SET /A Stamina=(%Stamina% - 65)
ECHO You have encountered a %BiomeLocation% dragon.
ECHO The dragon has adapted to living in the %BiomeLocation%. Because of this, he is a hard ass.
TYPE "img\enemies\twindancer.txt"
SET /A NPCRNG=%RANDOM% %% 10
SET /A PLAYERRNG=%RANDOM% %% 3
SET /A NPCRAND=((%RANDOM% %% 30) + NPCRNG)
SET /A PLAYERRAND=(%RANDOM% %% 18) + Power
ECHO.
PAUSE
IF %NPCRAND% LEQ %PLAYERRAND% ECHO You striked the %BiomeLocation% dragon with %PLAYERRAND% points of damage. You killed it. What a swell guy. & SET /A Health=%Health% - %NPCRAND%
IF %NPCRAND% GEQ %PLAYERRAND% ECHO The dragon crushed you with %NPCRAND% points of damage and ran off. & SET /A Health=%Health% - %NPCRAND% & IF %NPCRAND% GEQ %CritThresh% Type "img\text\criticalhit.txt" & ECHO. & ECHO You took an exceptional amount of damage. & ECHO.
IF %NPCRAND% == %PLAYERRAND% ECHO You blocked the attack. & PAUSE & GOTO :TwinDancer
PAUSE
GOTO :Drawbridge

:Skeleton
CLS
SET /A CritThresh=%Health% / 2
SET /A Stamina=(%Stamina% - 10)
ECHO You have encountered an enchanted %BiomeLocation% skeleton.
ECHO The skeletons bones squeak as he swings an iron greataxe at your head.
TYPE "img\enemies\skeleton.txt"
SET /A NPCRNG=%RANDOM% %% 25
SET /A PLAYERRNG=%RANDOM% %% 3
SET /A NPCRAND=((%RANDOM% %% 3) + NPCRNG)
SET /A PLAYERRAND=(%RANDOM% %% 15) + Power
ECHO.
PAUSE
IF %NPCRAND% LEQ %PLAYERRAND% ECHO You striked the enchanted skeleton with %PLAYERRAND% points of damage. You killed it. What an asshole. & SET /A Health=%Health% - %NPCRAND%
IF %NPCRAND% GEQ %PLAYERRAND% ECHO The skeleton smashed you with %NPCRAND% points of damage and ran off. & SET /A Health=%Health% - %NPCRAND% & IF %NPCRAND% GEQ %CritThresh% Type "img\text\criticalhit.txt" & ECHO. & ECHO You took an exceptional amount of damage. & ECHO.
IF %NPCRAND% == %PLAYERRAND% ECHO You blocked the attack. & PAUSE & GOTO :Skeleton
PAUSE
GOTO :Drawbridge

:Scorpion
CLS
SET /A CritThresh=%Health% / 2
SET /A Stamina=(%Stamina% - 10)
ECHO You have encountered a lil' ass scorpion.
ECHO The lil' ass scorpion says "Hey motherfucker you got a light for my ciggy?"
TYPE "img\enemies\scorp.txt"
SET /A NPCRNG=%RANDOM% %% 100
SET /A PLAYERRNG=%RANDOM% %% 3
SET /A NPCRAND=((%RANDOM% %% 3) + NPCRNG)
SET /A PLAYERRAND=(%RANDOM% %% 25) + Power
ECHO.
PAUSE
IF %NPCRAND% LEQ %PLAYERRAND% ECHO You striked the dank ass lil' scorpion with %PLAYERRAND% points of damage. You killed it. What an asshole. & SET /A Health=%Health% - %NPCRAND%
IF %NPCRAND% GEQ %PLAYERRAND% ECHO The scorpion fucked you up with %NPCRAND% points of damage and ran off. & SET /A Health=%Health% - %NPCRAND% & IF %NPCRAND% GEQ %CritThresh% Type "img\text\criticalhit.txt" & ECHO. & ECHO You took an exceptional amount of damage. & ECHO.
IF %NPCRAND% == %PLAYERRAND% ECHO You blocked the attack. & PAUSE & GOTO :Scorpion
PAUSE
GOTO :Drawbridge

:MysteryNPC
Set /A ForceUnlock=0
CLS
SET /A RestCounter=%RestCounter% + 3
Set /A Turn=%Turn% + 6
SET /A CritThresh=%Health% / 2
SET /A Stamina=(%Stamina% + 50)
SET /A Health=%Health%+50
ECHO As you make your way through the %BiomeLocation% you come across a mysterious figure.
ECHO As you get closer to it you realize it is a man in a trench coat.
ECHO "Hello traveler, did you know if you type 'Force' when prompted for a command something special happens?"
ECHO You nod your head in agreement.
ECHO.
TYPE "img\enemies\mysterios_npc.txt"
ECHO.
ECHO All of a sudden two days have passed. You feel very strange.
ECHO You make your way toward the %BiomeLocation3% area.
PAUSE
GOTO :Drawbridge

:MaleNPC
CLS
SET /A RestCounter=%RestCounter% + 6
Set /A Turn=%Turn% + 3
SET /A CritThresh=%Health% / 2
SET /A Stamina=(%Stamina% + 25)
SET /A Health=%Health%+20
ECHO As you make your way through the %BiomeLocation% you come across a small village.
ECHO In a building off to the left you see a bulky man slamming a hammer.
ECHO "Hello traveler, care for rest and food?"
ECHO You nod your head in agreement.
ECHO.
TYPE "img\enemies\male_npc.txt"
ECHO.
ECHO All of a sudden a day has passed. You feel somewhat refreshed.
ECHO You leave the village.
ECHO.
PAUSE
GOTO :Drawbridge

:HybridAlien
CLS
SET /A CritThresh=%Health% / 2
SET /A Stamina=(%Stamina% - 50)
ECHO All of a sudden a human-alien hybrid lunges from the %BiomeLocation% and attacks you.
ECHO His jowls are filled with hot green goo.
ECHO.
TYPE "img\enemies\hybrid.txt"
SET /A NPCRNG=%RANDOM% %% 45
SET /A PLAYERRNG=%RANDOM% %% 10
SET /A NPCRAND=((%RANDOM% %% 10) + NPCRNG)
SET /A PLAYERRAND=(%RANDOM% %%15) + Power
ECHO.
PAUSE
IF %NPCRAND% LEQ %PLAYERRAND% ECHO You striked the hybrid with %PLAYERRAND% points of damage. You killed it. & SET /A Health=%Health% - %NPCRAND%
IF %NPCRAND% GEQ %PLAYERRAND% ECHO The hybrid struck you with %NPCRAND% points of damage and ran off. & SET /A Health=%Health% - %NPCRAND% & IF %NPCRAND% GEQ %CritThresh% Type "img\text\criticalhit.txt" & ECHO. & ECHO You took an exceptional amount of damage. & ECHO.
IF %NPCRAND% == %PLAYERRAND% ECHO You blocked the attack. & PAUSE & GOTO :HybridAlien
PAUSE
GOTO :Drawbridge

:FemaleNPC
CLS
SET /A RestCounter=%RestCounter% + 3
Set /A Turn=%Turn% + 9
SET /A CritThresh=%Health% / 2
SET /A Stamina=(%Stamina% + 100)
SET /A Health=%Health%+50
ECHO As you make your way through the %BiomeLocation% you come across a small village.
ECHO In a building off to the right you see a beautiful woman waving at you.
ECHO "Hello traveler, care to partake in unheard of sexual acts?"
ECHO You nod your head in agreement.
ECHO.
TYPE "img\enemies\female_npc.txt"
ECHO.
ECHO All of a sudden three days have passed. You feel extremely refreshed.
ECHO You leave the village.
ECHO.
PAUSE
GOTO :Drawbridge

:Dementos
CLS
SET /A CritThresh=%Health% / 2
SET /A Stamina=(%Stamina% - 50)
ECHO You have encountered Dementos: Lord of the Grey Army.
ECHO Dementos screeches and sprints toward you weilding two daggers.
ECHO.
TYPE "img\enemies\dementos.txt"
SET /A NPCRNG=%RANDOM% %% 15
SET /A PLAYERRNG=%RANDOM% %% 10
SET /A NPCRAND=((%RANDOM% %% 25) + NPCRNG)
SET /A PLAYERRAND=(%RANDOM% %% 6) + Power
ECHO.
PAUSE
IF %NPCRAND% LEQ %PLAYERRAND% ECHO You striked Dementos with %PLAYERRAND% points of damage. You killed dementos and looted one of his ancient daggers. & SET /A Health=%Health% - %NPCRAND% & Set WeaponType=Dagger& Set /A Power=%Power% + 22
IF %NPCRAND% GEQ %PLAYERRAND% ECHO Dementos struck you with %NPCRAND% points of damage and ran off. & SET /A Health=%Health% - %NPCRAND% & IF %NPCRAND% GEQ %CritThresh% Type "img\text\criticalhit.txt" & ECHO. & ECHO You took an exceptional amount of damage. & ECHO.
IF %NPCRAND% == %PLAYERRAND% ECHO You blocked the attack. & PAUSE & GOTO :Dementos
PAUSE
GOTO :Drawbridge

:DeathNPC
CLS
SET /A CritThresh=%Health% / 2
SET /A Stamina=(%Stamina% - 1000)
ECHO A shadowy figure slowly makes its way toward you.
ECHO As it gets closer you start to feel more and more powerless.
ECHO.
ECHO "Your time will come soon" the figure whispers as it makes its way passed you.
TYPE "img\enemies\death_npc.txt"
ECHO.
ECHO You feel extremely drained. This beings presence had a terrible effect on you.
ECHO.
ECHO You must rest.
ECHO.
PAUSE
GOTO :Drawbridge

:Cow
CLS
SET /A CritThresh=%Health% / 2
SET /A Stamina=(%Stamina% - 10)
ECHO You have encountered a dumbass riding a cow.
ECHO The cow is somewhat autistic. Keep clear of his fat shitter.
TYPE "img\enemies\cow.txt"
SET /A NPCRNG=%RANDOM% %% 3
SET /A PLAYERRNG=%RANDOM% %% 3
SET /A NPCRAND=((%RANDOM% %% 3) + NPCRNG)
SET /A PLAYERRAND=(%RANDOM% %% 7) + Power
ECHO.
PAUSE
IF %NPCRAND% LEQ %PLAYERRAND% ECHO You striked the man riding the cow with %PLAYERRAND% points of damage. You killed them both. & SET /A Health=%Health% - %NPCRAND%
IF %NPCRAND% GEQ %PLAYERRAND% ECHO The man riding the cow shit all over you with %NPCRAND% points of damage and ran off. & SET /A Health=%Health% - %NPCRAND% & IF %NPCRAND% GEQ %CritThresh% Type "img\text\criticalhit.txt" & ECHO. & ECHO You took an exceptional amount of damage. & ECHO.
IF %NPCRAND% == %PLAYERRAND% ECHO You blocked the attack. & PAUSE & GOTO :Cow
PAUSE
GOTO :Drawbridge


:Beaver
CLS
SET /A CritThresh=%Health% / 2
SET /A Stamina=(%Stamina% - 30)
ECHO You have encountered a %BiomeLocation% Beaver.
ECHO The beaver approaches you, chipping and biting a wooden stick
TYPE "img\enemies\beaver.txt"
SET /A NPCRNG=%RANDOM% %% 3
SET /A PLAYERRNG=%RANDOM% %% 3
SET /A NPCRAND=((%RANDOM% %% 3) + NPCRNG)
SET /A PLAYERRAND=(%RANDOM% %% 7) + Power
ECHO.
PAUSE
IF %NPCRAND% LEQ %PLAYERRAND% ECHO You striked the beaver with %PLAYERRAND% points of damage. You killed the creature. & SET /A Health=%Health% - %NPCRAND%
IF %NPCRAND% GEQ %PLAYERRAND% ECHO The beaver striked you with %NPCRAND% points of damage and ran off. & SET /A Health=%Health% - %NPCRAND% & IF %NPCRAND% GEQ %CritThresh% Type "img\text\criticalhit.txt" & ECHO. & ECHO You took an exceptional amount of damage. & ECHO. 
IF %NPCRAND% == %PLAYERRAND% ECHO You blocked the attack. & PAUSE & GOTO :Beaver
PAUSE
GOTO :Drawbridge

:Wolf
CLS
SET /A CritThresh=%Health% / 2
SET /A Stamina=(%Stamina% - 5)
ECHO You have encountered a %BiomeLocation% Wolf.
ECHO The wolf approaches you, snarling and screeching.
TYPE "img\enemies\wolf.txt"
SET /A NPCRNG=%RANDOM% %% 5
SET /A PLAYERRNG=%RANDOM% %% 3
SET /A NPCRAND=((%RANDOM% %% 6) + NPCRNG)
SET /A PLAYERRAND=(%RANDOM% %% 10) + Power
ECHO.
PAUSE
IF %NPCRAND% LEQ %PLAYERRAND% ECHO You striked the Wolf with %PLAYERRAND% points of damage. You killed the creature. & SET /A Health=%Health% - %NPCRAND%
IF %NPCRAND% GEQ %PLAYERRAND% ECHO The Wolf striked you with %NPCRAND% points of damage and ran off. & SET /A Health=%Health% - %NPCRAND% & IF %NPCRAND% GEQ %CritThresh% Type "img\text\criticalhit.txt" & ECHO. & ECHO You took an exceptional amount of damage. & ECHO. 
IF %NPCRAND% == %PLAYERRAND% ECHO You blocked the attack. & PAUSE & GOTO :Wolf
PAUSE
GOTO :Drawbridge

:Zombie
CLS
SET /A CritThresh=%Health% / 2
SET /A Stamina=(%Stamina% - 10)
ECHO You have encountered an Alien.
ECHO The alien charges toward you screaming "zilgaphnif grogdunbog tar tar".
TYPE "img\enemies\alien.txt"
SET /A NPCRNG=%RANDOM% %% 12
SET /A PLAYERRNG=%RANDOM% %% 3
SET /A NPCRAND=((%RANDOM% %% 10) + NPCRNG)
SET /A PLAYERRAND=(%RANDOM% %% 10) + Power
ECHO.
PAUSE
IF %NPCRAND% LEQ %PLAYERRAND% ECHO You striked the alien with %PLAYERRAND% points of damage. You killed the alien. & SET /A Health=%Health% - %NPCRAND%
IF %NPCRAND% GEQ %PLAYERRAND% ECHO The alien striked you with %NPCRAND% points of damage and ran off. & SET /A Health=%Health% - %NPCRAND% & IF %NPCRAND% GEQ %CritThresh% Type "img\text\criticalhit.txt" & ECHO. & ECHO You took an exceptional amount of damage. & ECHO. 
IF %NPCRAND% == %PLAYERRAND% ECHO You blocked the attack. & PAUSE & GOTO :Zombie
PAUSE
GOTO :Drawbridge

:Wasp
CLS
SET /A CritThresh=%Health% / 2
SET /A Stamina=(%Stamina% - 5)
ECHO You have encountered a giant wasp.
ECHO The wasp rips your %WeaponType% from your hands and attacks you with it.
TYPE "img\enemies\wasp.txt"
SET /A NPCRNG=%RANDOM% %% 12
SET /A PLAYERRNG=%RANDOM% %% 3
SET /A NPCRAND=((%RANDOM% %% 20) + NPCRNG)
SET /A PLAYERRAND=(%RANDOM% %% 15) + Power
ECHO.
PAUSE
IF %NPCRAND% LEQ %PLAYERRAND% ECHO You striked the wasp with %PLAYERRAND% points of damage and killed it. & SET /A Health=%Health% - %NPCRAND%
IF %NPCRAND% GEQ %PLAYERRAND% ECHO The wasp striked you with %NPCRAND% points of damage and ran off. & SET /A Health=%Health% - %NPCRAND% & IF %NPCRAND% GEQ %CritThresh% Type "img\text\criticalhit.txt" & ECHO. & ECHO You took an exceptional amount of damage. & ECHO. 
IF %NPCRAND% == %PLAYERRAND% ECHO You blocked the attack. & PAUSE & GOTO :Wasp
PAUSE
GOTO :Drawbridge

:vWolf
CLS
SET /A CritThresh=%Health% / 2
SET /A Stamina=(%Stamina% - 5)
ECHO You have encountered a mutant %BiomeLocation% Wolf named Francis.
ECHO The mutant wolf charges toward you howling loudly in an attempt to call the pack.
TYPE "img\enemies\vicious-wolf.txt"
SET /A NPCRNG=%RANDOM% %% 12
SET /A PLAYERRNG=%RANDOM% %% 3
SET /A NPCRAND=((%RANDOM% %% 10) + NPCRNG)
SET /A PLAYERRAND=(%RANDOM% %% 10) + Power
ECHO.
PAUSE
IF %NPCRAND% LEQ %PLAYERRAND% ECHO You striked the mutant wolf with %PLAYERRAND% points of damage. You killed Francis. & SET /A Health=%Health% - %NPCRAND%
IF %NPCRAND% GEQ %PLAYERRAND% ECHO The mutant wolf striked you with %NPCRAND% points of damage and ran off. & SET /A Health=%Health% - %NPCRAND% & IF %NPCRAND% GEQ %CritThresh% Type "img\text\criticalhit.txt" & ECHO. & ECHO You took an exceptional amount of damage. & ECHO. 
IF %NPCRAND% == %PLAYERRAND% ECHO You blocked the attack. & PAUSE & GOTO :vWolf
PAUSE
GOTO :Drawbridge

:Licker
CLS
SET /A CritThresh=%Health% / 2
SET /A Stamina=(%Stamina% - 25)
ECHO You have encountered the sewer beast, licki-licki.
ECHO Licki-licki is extremely upset that you fucked his sister.
ECHO He hobbles toward you on all fours wailing explatives.
TYPE "img\enemies\licker.txt"
SET /A NPCRNG=%RANDOM% %% 40
SET /A PLAYERRNG=%RANDOM% %% 3
SET /A NPCRAND=((%RANDOM% %% 5) + NPCRNG)
SET /A PLAYERRAND=(%RANDOM% %% 30) + Power
ECHO.
PAUSE
IF %NPCRAND% LEQ %PLAYERRAND% ECHO You struck licki-licki with %PLAYERRAND% points of damage and killed it. & SET /A Health=%Health% - %NPCRAND%
IF %NPCRAND% GEQ %PLAYERRAND% ECHO Licki-licki struck you with %NPCRAND% points of damage and ran off. & SET /A Health=%Health% - %NPCRAND% & IF %NPCRAND% GEQ %CritThresh% Type "img\text\criticalhit.txt" & ECHO. & ECHO You took an exceptional amount of damage. & ECHO. 
IF %NPCRAND% == %PLAYERRAND% ECHO You blocked the attack. & PAUSE & GOTO :Licker
PAUSE
GOTO :Drawbridge

:sPig
CLS
SET /A CritThresh=%Health% / 2
SET /A Stamina=(%Stamina% - 50)
ECHO You have encountered the solidary pig of muscle atrophy.
ECHO The pig is extremely easy to defeat but emits an aura of depression.
ECHO The pig rolls around in the %BiomeLocation% near your feet.
TYPE "img\enemies\pig-single.txt"
SET /A NPCRNG=%RANDOM% %% 2
SET /A PLAYERRNG=%RANDOM% %% 2
SET /A NPCRAND=((%RANDOM% %% 5) + NPCRNG)
SET /A PLAYERRAND=(%RANDOM% %% 4) + Power
ECHO.
PAUSE
IF %NPCRAND% LEQ %PLAYERRAND% ECHO You struck the wee pig with %PLAYERRAND% points of damage and killed it. & SET /A Health=%Health% - %NPCRAND%
IF %NPCRAND% GEQ %PLAYERRAND% ECHO The pig struck you with %NPCRAND% points of damage and ran off. & SET /A Health=%Health% - %NPCRAND% & IF %NPCRAND% GEQ %CritThresh% Type "img\text\criticalhit.txt" & ECHO. & ECHO You took an exceptional amount of damage. & ECHO. 
IF %NPCRAND% == %PLAYERRAND% ECHO You blocked the attack. & PAUSE & GOTO :sPig
PAUSE
GOTO :Drawbridge

:unexObj
CLS
SET /A CritThresh=%Health% / 2
SET /A Stamina=(%Stamina% + 20)
ECHO You have encountered an unexplainable phenomenon.
ECHO You can not comprehend what you are seeing.
ECHO A voice calls out to you, "!pseudo1[%rndInt%]! you must retore the order to our universe"
ECHO "I will heal you ever so slightly so that you may continue on in your journey"
TYPE "img\enemies\unexplainobject.txt"
ECHO.
PAUSE
IF !pseudo2[%rndInt2%]!==Alcoholic ECHO The unexplainable being grants you the power of everlasting love. & SET /A Health=(%Health% + 20)
IF !pseudo2[%rndInt2%]!==Drifter ECHO The unexplainable being grants you the power of undreamable dreams. & SET /A Health=(%Health% + 20)
IF !pseudo2[%rndInt2%]!==Addict ECHO The unexplainable being grants you the power of systematic disadvantages. & SET /A Health=(%Health% + 20)
IF !pseudo2[%rndInt2%]!==Friendly ECHO The unexplainable being grants you the power of unlimited experiences. & SET /A Health=(%Health% + 20)
IF !pseudo2[%rndInt2%]!==Intelligent ECHO The unexplainable being grants you the power of a commited relationship. & SET /A Health=(%Health% + 20)
IF !pseudo2[%rndInt2%]!==Calm ECHO The unexplainable being grants you the power of mindful insight. & SET /A Health=(%Health% + 20)
::
IF !pseudo3[%rndInt3%]!==Colorblind ECHO The being floats toward and then away from you, but for a brief moment you feel happy.
IF !pseudo3[%rndInt3%]!==Idiotic ECHO The being floats toward and then away from you, but for a brief moment you feel sick.
IF !pseudo3[%rndInt3%]!==Lethargic ECHO The being floats toward and then away from you, but for a brief moment you feel sexy.
IF !pseudo3[%rndInt3%]!==Angry ECHO The being floats toward and then away from you, but for a brief moment you feel globular.
IF !pseudo3[%rndInt3%]!==Pleased ECHO The being floats toward and then away from you, but for a brief moment you feel sad.
IF !pseudo3[%rndInt3%]!==Strange ECHO The being floats toward and then away from you, but for a brief moment you feel high.
::
IF !pseudo4[%rndInt4%]!==Leader ECHO The being sprays a mist in your face, giggles and then floats into the distance. You are left with a sense of regret.
IF !pseudo4[%rndInt4%]!==Stupid ECHO The being sprays a mist in your face, giggles and then floats into the distance. You are left with a sense of importance.
IF !pseudo4[%rndInt4%]!==Autistic ECHO The being sprays a mist in your face, giggles and then floats into the distance. You are left with a sense of meaning.
IF !pseudo4[%rndInt4%]!==Happy ECHO The being sprays a mist in your face, giggles and then floats into the distance. You are left with a sense of negativity.
IF !pseudo4[%rndInt4%]!==Sad ECHO The being sprays a mist in your face, giggles and then floats into the distance. You are left with a sense of hunger.
IF !pseudo4[%rndInt4%]!==Winded ECHO The being sprays a mist in your face, giggles and then floats into the distance. You are left with a sense of humor.
PAUSE
GOTO :Drawbridge

:WeaponBreaks
CLS
IF %WeaponType%==Stick ECHO Your %WeaponType% is corroded and no longer usable.
IF %WeaponType%==Stick ECHO You drop the %WeaponType%. & Set WeaponType=None& Set /A Power=%Power% + 2 & PAUSE & GOTO :Drawbridge
IF %WeaponType%==Club ECHO Your %WeaponType% is corroded and no longer usable.
IF %WeaponType%==Club ECHO You drop the %WeaponType%. & Set WeaponType=None& Set /A Power=%Power% - 1 & PAUSE & GOTO :Drawbridge
IF %WeaponType%==Knife ECHO Your %WeaponType% is corroded and no longer usable.
IF %WeaponType%==Knife ECHO You drop the %WeaponType%. & Set WeaponType=None& Set /A Power=%Power% - 3 & PAUSE & GOTO :Drawbridge
IF %WeaponType%==Gun ECHO Your %WeaponType% is corroded and no longer usable.
IF %WeaponType%==Gun ECHO You drop the %WeaponType%. & Set WeaponType=None& Set /A Power=%Power% - 5 & PAUSE & GOTO :Drawbridge
IF %WeaponType%==Shotgun ECHO Your %WeaponType% is corroded and no longer usable.
IF %WeaponType%==Shotgun ECHO You drop the %WeaponType%. & Set WeaponType=None& Set /A Power=%Power% - 35 & PAUSE & GOTO :Drawbridge
IF %WeaponType%==Sword ECHO Your %WeaponType% is corroded and no longer usable.
IF %WeaponType%==Sword ECHO You drop the %WeaponType%. & Set WeaponType=None& Set /A Power=%Power% - 40 & PAUSE & GOTO :Drawbridge
IF %WeaponType%==Hornsword ECHO Your %WeaponType% is corroded and no longer usable.
IF %WeaponType%==Hornsword ECHO You drop the %WeaponType%. & Set WeaponType=None& Set /A Power=%Power% - 40 & PAUSE & GOTO :Drawbridge
IF %WeaponType%==Alienblaster ECHO Your %WeaponType% is corroded and no longer usable.
IF %WeaponType%==Alienblaster ECHO You drop the %WeaponType%. & Set WeaponType=None& Set /A Power=%Power% - 35 & PAUSE & GOTO :Drawbridge
IF %WeaponType%==Dagger ECHO Your %WeaponType% is corroded and no longer usable.
IF %WeaponType%==Dagger ECHO You drop the %WeaponType%. & Set WeaponType=None& Set /A Power=%Power% - 20 & PAUSE & GOTO :Drawbridge
IF %WeaponType%==BulzolgonsAmulet ECHO Your %WeaponType% falls into the %BiomeLocation%. You pick it back up and equipt it.
IF %WeaponType%==BulzolgonsAmulet ECHO Bulzolgons Amulet is unbreakable. & PAUSE & GOTO :Drawbridge
IF %WeaponType%==Spoon ECHO Your %WeaponType% is corroded and no longer usable.
IF %WeaponType%==Spoon ECHO You drop the %WeaponType%. & Set WeaponType=None& Set /A Power=%Power% - 110 & PAUSE & GOTO :Drawbridge
IF %WeaponType%==UnholySword ECHO Your %WeaponType% is corroded and no longer usable.
IF %WeaponType%==UnholySword ECHO You drop the %WeaponType%. & Set WeaponType=None& Set /A Power=%Power% - 1000 & PAUSE & GOTO :Drawbridge
IF %WeaponType%==DimensionalSword ECHO Your %WeaponType% is corroded and no longer usable.
IF %WeaponType%==DimensionalSword ECHO You drop the %WeaponType%. & Set WeaponType=None& Set /A Power=%Power% - 175 & PAUSE & GOTO :Drawbridge
IF %WeaponType%==None GOTO :WeaponCheck
PAUSE
GOTO :Drawbridge

:WeaponCheck
CLS
SET /A WeaponRoll=%Random% %% 2
IF %Direction%==Sleep ECHO You are suffering from loneliness. & PAUSE & GOTO :Drawbridge
ECHO You head %Direction% in the hopes of finding a weapon.
IF %WeaponRoll%==0 ECHO Unfortunately you are unable to find one. & PAUSE & GOTO :Drawbridge
IF %WeaponRoll%==1 GOTO :FoundWeapon

:FoundWeapon
SET /A Weapon=%RANDOM% %% 4
IF %Weapon% EQU 0 Set WeaponType=Stick& Set /A Power=%Power% - 2
IF %Weapon% EQU 1 Set WeaponType=Club& Set /A Power=%Power% + 1
IF %Weapon% EQU 2 Set WeaponType=Knife& Set /A Power=%Power% + 3
IF %Weapon% EQU 3 Set WeaponType=Gun& Set /A Power=%Power% + 5
ECHO You found and equipped a %WeaponType%. & Pause & GOTO :Drawbridge

:Horde
CLS
SET /A CritThresh=%Health% / 2
SET /A Stamina=(%Stamina% - 20)
ECHO You have encountered an Alien Horde.
ECHO The horde surrounds you chanting "xentotot nigloty ugop yar dan".
TYPE "img\enemies\horde.txt"
SET /A NPCRNG=((%RANDOM% %% 15) + 7)
SET /A PLAYERRNG=%RANDOM% %% 3
SET /A NPCRAND=((%RANDOM% %% 14) + NPCRNG)
SET /A PLAYERRAND=(%RANDOM% %% 13) + Power
ECHO.
PAUSE
IF %NPCRAND% LEQ %PLAYERRAND% ECHO You striked the alien horde with %PLAYERRAND% points of damage. You killed all the aliens. & SET /A Health=%Health% - %NPCRAND%
IF %NPCRAND% GEQ %PLAYERRAND% ECHO The alien horde strikes you with %NPCRAND% points of damage and ran off. & SET /A Health=%Health% - %NPCRAND% & IF %NPCRAND% GEQ %CritThresh% Type "img\text\criticalhit.txt" & ECHO. & ECHO You took an exceptional amount of damage. & ECHO.
IF %NPCRAND% == %PLAYERRAND% ECHO You blocked all attacks. & PAUSE & GOTO :Horde
PAUSE
GOTO :Drawbridge

:SleepDemon
SET /A CritThresh=%Health% / 2
CLS
SET /A Stamina=(%Stamina% - 60)
ECHO You have encountered the ancient sleep demon Bulzolgon.
ECHO Bulzolgon breathes intense flames in your direction screaching "You shall never rest again".
TYPE "img\enemies\bulzolgon.txt"
SET /A BulzolgonAddPower=%RANDOM% %% 45
SET /A NPCRNG=(((%RANDOM% %% 20) + 18) + %BulzolgonAddPower)
SET /A PLAYERRNG=%RANDOM% %% 12
SET /A NPCRAND=((%RANDOM% %% 50) + NPCRNG)
SET /A PLAYERRAND=(%RANDOM% %% 66) + Power
ECHO.
PAUSE
IF %NPCRAND% LEQ %PLAYERRAND% ECHO You striked Bulzolgon with %PLAYERRAND% points of damage. You have defeated Bulzolgon and looted his amulet of power & SET /A Health=%Health% - %NPCRAND% & Set WeaponType=BulzolgonsAmulet& Set /A Power=%Power% + 30
IF %NPCRAND% GEQ %PLAYERRAND% ECHO Bulzolgon strikes you with %NPCRAND% points of damage and ran off. & ECHO. & SET /A Health=%Health% - %NPCRAND% & IF %NPCRAND% GEQ %CritThresh% Type "img\text\criticalhit.txt" & ECHO. & ECHO You took an exceptional amount of damage.
IF %NPCRAND% == %PLAYERRAND% ECHO You blocked the flames with your mighty %WeaponType%. & PAUSE & GOTO :SleepDemon
PAUSE
IF %Health% LEQ 0 GOTO :Death
GOTO :Drawbridge

:Water
CLS
SET /A WaterRoll=%RANDOM% %% 4
TYPE "img\items\water.txt"
ECHO.
ECHO While stumbling around in the %BiomeLocation% you managed to find bottled murky water.
SET /P WaterChoice=Do you want to drink the water or store it?(Drink, Store): 
IF %WaterChoice%==Drink GOTO DrinkTable
IF %WaterChoice%==Store Echo You place the water in your bag for later. & SET /A WaterCount=%WaterCount%+1 & PAUSE & GOTO Drawbridge
:DrinkTable
IF %WaterRoll%==0 ECHO You drink the water and feel very refreshed. & SET /A Stamina=(%Stamina% + 40) & SET /A Health=(%Health% +10) & PAUSE & GOTO :Drawbridge
IF %WaterRoll%==1 ECHO You drink the water and feel somewhat refreshed. & SET /A Stamina=(%Stamina% + 20) & SET /A Health=(%Health% +5) & PAUSE & GOTO :Drawbridge
IF %WaterRoll%==2 ECHO You drink the water and feel somewhat refreshed. & SET /A Stamina=(%Stamina% + 20) & SET /A Health=(%Health% +5) & PAUSE & GOTO :Drawbridge
IF %WaterRoll%==3 ECHO You drink the water and immediatly feel your stomach hurting.
IF %WaterRoll%==3 ECHO You have contracted temporary dissentary and need to rest. & SET /A Stamina=(%Stamina% - 40) & SET /A Health=(%Health% -10) & PAUSE & GOTO :Rest
PAUSE
GOTO :Water 

:Food
CLS
SET /A FoodRoll=%RANDOM% %% 4
TYPE "img\items\food.txt"
ECHO.
ECHO While stumbling around in the %BiomeLocation% you managed to find some food.
SET /P FoodChoice=Do you want to eat the food or store it?(Eat, Store): 
IF %FoodChoice%==Eat GOTO FoodTable
IF %FoodChoice%==Store Echo You place the food in your bag for later. & SET /A FoodCount=%FoodCount%+1 & PAUSE & GOTO Drawbridge
:FoodTable
IF %FoodRoll%==0 ECHO You eat the food and feel very full. & SET /A Stamina=(%Stamina% + 35) & SET /A Health=(%Health% +30) & PAUSE & GOTO :Drawbridge
IF %FoodRoll%==1 ECHO You eat the food and feel somewhat full. & SET /A Stamina=(%Stamina% + 5) & SET /A Health=(%Health% +10) & PAUSE & GOTO :Drawbridge
IF %FoodRoll%==2 ECHO You eat the food and feel somewhat full. & SET /A Stamina=(%Stamina% + 5) & SET /A Health=(%Health% +10) & PAUSE & GOTO :Drawbridge
IF %FoodRoll%==3 ECHO You eat the food and immediatly feel your stomach hurting.
IF %FoodRoll%==3 ECHO You have contracted temporary food poisoning and need to rest. & SET /A Stamina=(%Stamina% - 40) & SET /A Health=(%Health% -20) & PAUSE & GOTO :Rest
ECHO.
PAUSE
GOTO :Food

:Medication
CLS
SET /A MedRoll=%RANDOM% %% 4
TYPE "img\items\meds.txt"
ECHO.
ECHO While stumbling around in the %BiomeLocation% you managed to find some medication.
SET /P MedChoice=Do you want to take the medication or store it?(Medicate, Store): 
IF %MedChoice%==Medicate GOTO MedTable
IF %MedChoice%==Store Echo You place the medication in your bag for later. & SET /A MedCount=%MedCount%+1 & PAUSE & GOTO Drawbridge
:MedTable
IF %MedRoll%==0 ECHO You take the medication and feel much better. & SET /A Radiation=(%Radiation% -50) & SET /A Health=(%Health% +60) & PAUSE & GOTO :Drawbridge
IF %MedRoll%==1 ECHO You take the meds and feel good. & SET /A Radiation=(%Radiation% -30) & SET /A Health=(%Health% +40) & PAUSE & GOTO :Drawbridge
IF %MedRoll%==2 ECHO You take the meds and feel good. & SET /A Radiation=(%Radiation% -30) & SET /A Health=(%Health% +40) & PAUSE & GOTO :Drawbridge
IF %MedRoll%==3 ECHO You take the meds and immediatly feel strange.
IF %MedRoll%==3 ECHO You have an alergic reaction to the meds and need to rest. & SET /A Stamina=(%Stamina% - 10) & SET /A Health=(%Health% -20) & PAUSE & GOTO :Rest
ECHO.
PAUSE
GOTO :Medication

:ConditionalDamage
CLS
Set /A ConditionaDamage=%Random% %% 6
If %BiomeLocation%==Waste ECHO You stumble into an area with severe radiation.
If %BiomeLocation%==Waste ECHO You take an extreme amount of radiation damage. & Set /A Radiation=((%Radiation% + 10) + %ConditionaDamage%) & SET /A Stamina=(%Stamina% - 15) & SET /A Health=(%Health% -10)
If %BiomeLocation%==Snow ECHO The air around you is freezing cold.
If %BiomeLocation%==Snow ECHO You pass out from the cold and awake the next morning. & SET /A Stamina=(%Stamina% - 50) & SET /A Health=((%Health% - 30) + %ConditionaDamage%)
If %BiomeLocation%==Desert ECHO You wander endlessly in the desert as the sun burns your skin.
If %BiomeLocation%==Desert ECHO You are exhausted from the heat and need to rest. & SET /A Stamina=(%Stamina% - 200) & SET /A Health=((%Health% - 8) + %ConditionaDamage%) & PAUSE & GOTO :Rest
If %BiomeLocation%==Forest ECHO You are starving from the trek through the forest. & ECHO. & TYPE "img\items\mushroom.txt" & ECHO.
If %BiomeLocation%==Forest ECHO You find a delicious looking trio of mushrooms.
If %BiomeLocation%==Forest ECHO You consume the mushrooms and immediatly start hallucinating.
If %BiomeLocation%==Forest ECHO You wake up hours later extremely thirsty with a terrible headache. & SET /A Stamina=(%Stamina% - 30) & SET /A Health=((%Health% - 40) + %ConditionaDamage%) & PAUSE & GOTO :Rest
PAUSE
GOTO :Drawbridge

:Death
SET /A TotalDays=%Turn% / 3
CLS
ECHO You have died.
ECHO.
TYPE "img\encounters\death.txt"
ECHO.
ECHO Total number of days survived: %TotalDays%
ECHO If you want more information about this playthrough go to .\bin\exp\stats.log!
ECHO.
ECHO Better luck next time!
ECHO %DATE% %TIME% Player: !pseudo1[%rndInt%]!. SurvivalID: %QUESTRUN% >> ECHO. >> "exp\stats.log"
ECHO You survived %TotalDays% days. >> ".\exp\stats.log"
IF %WonGame%==1 ECHO Congradulations. During this playthrough you beat the game. >> "exp\stats.log"
ECHO -----------STATS------------- >> "exp\stats.log"
ECHO. >> "exp\stats.log"
ECHO Ending Biome: %BiomeLocation% >> "exp\stats.log"
ECHO Climate: %ClimateType% >> "exp\stats.log"
ECHO Physical Status: %CharacterType% >> "exp\stats.log"
ECHO Ending Weapon: %WeaponType% >> "exp\stats.log"
ECHO Env Facto: %Environment% >> "exp\stats.log"
ECHO Tir Facto: %Tiredness% >> "exp\stats.log"
ECHO Pow Facto: %Power% >> "exp\stats.log"
ECHO Luk Facto: %Luck% >> "exp\stats.log"
ECHO ----------------------------- >> "exp\stats.log"
ECHO. >> "exp\stats.log"
ECHO.
PAUSE
TIMEOUT /T 5 /NOBREAK
GOTO :Start

:WinCondition
CLS
Set /A WonGame=1
ECHO Congradulations. You have managed to survive for an entire year.
ECHO.
TYPE "img\encounters\beach.txt"
ECHO.
ECHO At this point, you have won the game.
ECHO.
ECHO You can continue to play until you eventually die anyway.
PAUSE
GOTO :Drawbridge
ECHO.

:ColorText
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1
goto :eof