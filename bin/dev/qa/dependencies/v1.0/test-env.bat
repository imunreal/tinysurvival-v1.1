:Start
Set /A WonGame=0
SET /A QUESTID=(%RANDOM%*376/15)+1
SET /A QUESTRUN=00+QUESTID
Title Tiny Survival - Test Env
CLS
@ECHO OFF
ECHO.
ECHO.
ECHO.
ECHO Test Env
ECHO.
PAUSE
CLS
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
@ECHO OFF
setlocal enabledelayedexpansion
set "pseudo1=Nick Abi Sarah Hunter Greg Pauly Phillip Vanessa"
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
SET /A Health=(9999)
SET /A Stamina=(9999)
Set /A Turn=0
Set /A Radiation=-9999
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
Set /A PositionX=0
Set /A Position=0
ECHO.
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
If %TotalDays% GEQ 366 GOTO WinCondition
IF %RestCounter% GEQ 8 ECHO You can hear the flapping of Bulzolgons mighty wings in the distance.
IF %RestCounter% GEQ 8 ECHO You fear Bulzolgon.
IF %Stamina% LEQ 0 ECHO You must rest. & Pause & GOTO :Rest
IF %Health% LEQ 0 GOTO :Death
IF %Radiation% GEQ 56 GOTO :Death
IF %Position%==0 ( IF %PositionX%==0 ( GOTO :MountainEncounter ))
ECHO.
:PostCheck2
::ECHO You can move North, South, East or West.
ECHO.
GOTO Force
SET /P CHOICE1=What direction will you move in?: 
IF %CHOICE1%==North GOTO North
IF %CHOICE1%==South GOTO South
IF %CHOICE1%==East GOTO East
IF %CHOICE1%==West GOTO West
IF %CHOICE1%==Rest GOTO Rest
IF %CHOICE1%==Map GOTO Map
IF %CHOICE1%==Force GOTO Force
GOTO ResponseNotValid
PAUSE

:ResponseNotValid
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
Set /P Going=X:
GOTO :%Going%
PAUSE

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
ECHO Set your position on the map and biome modifier.
SET /P BiomeMod=(Q) Biome Modifier: 
SET /P PositionX=(X) Coordinates: 
SET /P Position=(Y) Coordinates: 
PAUSE
ECHO Position: X:(%PositionX%) Y:(%Position%)
PAUSE
GOTO :PostCheck

:Map
CLS
ECHO Position: X:(%PositionX%) Y:(%Position%)
SET /A MapID=0
IF %Position% LEQ 25 ( IF %Position% GEQ 0 ( IF %PositionX% LEQ 25 ( IF %PositionX% GEQ 0 ( TYPE "img\maps\0_x0y0.txt" & SET /A MapID=1 & SET /A Tile=0))))
IF %Position% GTR 0 ( IF %Position% LSS 125 ( IF %PositionX% GTR -125 ( IF %PositionX% LSS 0 ( TYPE "img\maps\1_x-125y+125.txt" & SET /A MapID=1 & SET /A Tile=1))))
IF %Position% LSS 0 ( IF %Position% GTR -125 ( IF %PositionX% GTR -125 ( IF %PositionX% LSS 0 ( TYPE "img\maps\2_x-125y-125.txt" & SET /A MapID=1 & SET /A Tile=2))))
IF %Position% LSS 0 ( IF %Position% GTR -125 ( IF %PositionX% LSS 125 ( IF %PositionX% GTR 0 ( TYPE "img\maps\3_x+125y-125.txt" & SET /A MapID=1 & SET /A Tile=3))))
IF %Position% GTR 0 ( IF %Position% LSS 125 ( IF %PositionX% LSS 125 ( IF %PositionX% GTR 0 ( TYPE "img\maps\4_x+125y+125.txt" & SET /A MapID=1 & SET /A Tile=4))))
IF %Position% GTR 125 ( IF %Position% LSS 250 ( IF %PositionX% LSS 125 ( IF %PositionX% GTR 0 ( TYPE "img\maps\5_x+125y+250.txt" & SET /A MapID=1 & SET /A Tile=5))))
IF %Position% GTR 125 ( IF %Position% LSS 250 ( IF %PositionX% GTR -125 ( IF %PositionX% LSS 0 ( TYPE "img\maps\6_x-125y+250.txt" & SET /A MapID=1 & SET /A Tile=6))))
IF %Position% GTR 125 ( IF %Position% LSS 250 ( IF %PositionX% GTR -250 ( IF %PositionX% LSS -125 ( TYPE "img\maps\7_x-250y+250.txt" & SET /A MapID=1 & SET /A Tile=7))))
IF %Position% GTR 0 ( IF %Position% LSS 125 ( IF %PositionX% GTR -250 ( IF %PositionX% LSS -125 ( TYPE "img\maps\8_x-250y+125.txt" & SET /A MapID=1 & SET /A Tile=8))))
IF %Position% LSS 0 ( IF %Position% GTR -125 ( IF %PositionX% GTR -250 ( IF %PositionX% LSS -125 ( TYPE "img\maps\9_x-250y-125.txt" & SET /A MapID=1 & SET /A Tile=9))))
IF %Position% LSS -125 ( IF %Position% GTR -250 ( IF %PositionX% GTR -250 ( IF %PositionX% LSS -125 ( TYPE "img\maps\10_x-250y-250.txt" & SET /A MapID=1 & SET /A Tile=10))))
IF %Position% LSS -125 ( IF %Position% GTR -250 ( IF %PositionX% LSS 0 ( IF %PositionX% GTR -125 ( TYPE "img\maps\11_x-125y-250.txt" & SET /A MapID=1 & SET /A Tile=11))))
IF %Position% LSS -125 ( IF %Position% GTR -250 ( IF %PositionX% GTR 0 ( IF %PositionX% LSS 125 ( TYPE "img\maps\12_x+125y-250.txt" & SET /A MapID=1 & SET /A Tile=12))))
IF %Position% LSS -125 ( IF %Position% GTR -250 ( IF %PositionX% GTR 125 ( IF %PositionX% LSS 250 ( TYPE "img\maps\13_x+250y-250.txt" & SET /A MapID=1 & SET /A Tile=13))))
IF %Position% GTR -125 ( IF %Position% LSS 0 ( IF %PositionX% GTR 125 ( IF %PositionX% LSS 250 ( TYPE "img\maps\14_x+250y-125.txt" & SET /A MapID=1 & SET /A Tile=14))))
IF %Position% GTR 0 ( IF %Position% LSS 125 ( IF %PositionX% GTR 125 ( IF %PositionX% LSS 250 ( TYPE "img\maps\15_x+250y+125.txt" & SET /A MapID=1 & SET /A Tile=15))))
IF %Position% GTR 125 ( IF %Position% LSS 250 ( IF %PositionX% GTR 125 ( IF %PositionX% LSS 250 ( TYPE "img\maps\16_x+250y+250.txt" & SET /A MapID=1 & SET /A Tile=16))))
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
CLS
IF %RestCounter% GEQ 1 SET /A RestCounter=%RestCounter% - 1
Set Direction=North
SET /A Turnroll=%RANDOM% %% 16
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
ECHO.
ECHO.
ECHO.
IF %Position% GEQ 250 Set /A Position=250 & ECHO You can not travel any further north.
IF %Position% LSS 250 ECHO You went north.
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
IF %Stamina% LEQ 0 ECHO You must rest. & Pause & GOTO :Rest
IF %Health% LEQ 0 GOTO :Death
IF %Radiation% GEQ 56 GOTO :Death
IF %BiomeLocation%==Waste ECHO You are taking radiation damage.
PAUSE
GOTO :Drawbridge

:South
IF %RestCounter% GEQ 1 SET /A RestCounter=%RestCounter% - 1
Set Direction=South
SET /A Turnroll=%RANDOM% %% 16
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
ECHO.
ECHO.
ECHO.
IF %Position% LEQ -250 Set /A Position=-250 & ECHO You can not travel any further south.
IF %Position% GTR -250 ECHO You went South.
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
IF %Stamina% LEQ 0 ECHO You must rest. & Pause & GOTO :Rest
IF %Health% LEQ 0 GOTO :Death
IF %Radiation% GEQ 56 GOTO :Death
IF %BiomeLocation%==Waste ECHO You are taking radiation damage.
PAUSE
GOTO :Drawbridge

:East
IF %RestCounter% GEQ 1 SET /A RestCounter=%RestCounter% - 1
Set Direction=East
SET /A Turnroll=%RANDOM% %% 16
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
ECHO.
ECHO.
ECHO.
IF %PositionX% GEQ 250 Set /A PositionX=250 & ECHO You can not travel any further East.
IF %PositionX% LSS 250 ECHO You went East.
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
IF %Stamina% LEQ 0 ECHO You must rest. & Pause & GOTO :Rest
IF %Health% LEQ 0 GOTO :Death
IF %Radiation% GEQ 56 GOTO :Death
IF %BiomeLocation%==Waste ECHO You are taking radiation damage.
PAUSE
GOTO :Drawbridge

:West
IF %RestCounter% GEQ 1 SET /A RestCounter=%RestCounter% - 1
Set Direction=West
SET /A Turnroll=%RANDOM% %% 16
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
ECHO.
ECHO.
ECHO.
IF %PositionX% LEQ -250 Set /A PositionX=-250 & ECHO You can not travel any further West.
IF %PositionX% GTR -250 ECHO You went West.
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
IF %Stamina% LEQ 0 ECHO You must rest. & Pause & GOTO :Rest
IF %Health% LEQ 0 GOTO :Death
IF %Radiation% GEQ 56 GOTO :Death
IF %BiomeLocation%==Waste ECHO You are taking radiation damage.
PAUSE
GOTO :Drawbridge

:Rest
SET /A RestCounter=%RestCounter% + 4
Set Direction=Sleep
SET /A Turnroll=%RANDOM% %% 16
CLS
Set /A Turn=%Turn% + 2
IF %Stamina% LSS 201 Set /A Stamina=%Stamina% + 100
IF %Health% LSS 101 Set /A Health=%Health% + 15
Set /A Position=%Position% + 0
ECHO Health: %Health% Rads: %Radiation%
ECHO Stamina: %Stamina%
ECHO Weapon: %WeaponType%
Echo Climate: %ClimateType%
ECHO Location: %BiomeLocation%
ECHO Position: X:(%PositionX%) Y:(%Position%)
Echo Turn: %Turn%
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
IF %Turnroll%==9 GOTO :SleepDemonGate
IF %Turnroll%==10 GOTO :SleepDemonGate
IF %Turnroll%==12 GOTO :NewEncounters
IF %Turnroll%==14 GOTO :NewEncounters
IF %Turnroll%==15 GOTO :SleepDemonGate
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

:NewEncounters
CLS
SET /A EncounterRoll=%RANDOM% %% 26
IF %EncounterRoll%==1 GOTO :Beaver
IF %EncounterRoll%==2 GOTO :Cow
IF %EncounterRoll%==3 GOTO :DeathNPC
IF %EncounterRoll%==4 GOTO :Demontos
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
IF %EncounterRoll%==19 GOTO :Cow
IF %EncounterRoll%==20 GOTO :MaleNPC
IF %EncounterRoll%==21 GOTO :Skeleton
IF %EncounterRoll%==22 GOTO :Skeleton
IF %EncounterRoll%==23 GOTO :Skeleton
IF %EncounterRoll%==24 GOTO :Liquor
IF %EncounterRoll%==25 GOTO :Cig
ECHO.
PAUSE
GOTO :Drawbridge
ECHO.

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
IF !pseudo3[%rndInt3%]!==Angry ECHO You take a few more puffs and immediatly go into a blind rage and fight a scorpion crawling around in the %BiomeLocation% next to you. & PAUSE & GOTO Scorpion
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
IF %NPCRAND% LSS %PLAYERRAND% ECHO You striked the unicorn with %PLAYERRAND% points of damage. You killed itand crafted a makeshift sword out of its horn. & SET /A Health=%Health% - %NPCRAND% & Set WeaponType=Hornsword& Set /A Power=%Power% + 45 
IF %NPCRAND% GTR %PLAYERRAND% ECHO The dragon crushed you with %NPCRAND% points of damage and ran off. & SET /A Health=%Health% - %NPCRAND% & IF %NPCRAND% GTR %CritThresh% Type "img\text\criticalhit.txt" & ECHO. & ECHO You took an exceptional amount of damage. & ECHO.
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
IF %NPCRAND% LSS %PLAYERRAND% ECHO You striked the %BiomeLocation% dragon with %PLAYERRAND% points of damage. You killed it. What a swell guy. & SET /A Health=%Health% - %NPCRAND%
IF %NPCRAND% GTR %PLAYERRAND% ECHO The dragon crushed you with %NPCRAND% points of damage and ran off. & SET /A Health=%Health% - %NPCRAND% & IF %NPCRAND% GTR %CritThresh% Type "img\text\criticalhit.txt" & ECHO. & ECHO You took an exceptional amount of damage. & ECHO.
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
IF %NPCRAND% LSS %PLAYERRAND% ECHO You striked the enchanted skeleton with %PLAYERRAND% points of damage. You killed it. What an asshole. & SET /A Health=%Health% - %NPCRAND%
IF %NPCRAND% GTR %PLAYERRAND% ECHO The skeleton smashed you with %NPCRAND% points of damage and ran off. & SET /A Health=%Health% - %NPCRAND% & IF %NPCRAND% GTR %CritThresh% Type "img\text\criticalhit.txt" & ECHO. & ECHO You took an exceptional amount of damage. & ECHO.
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
IF %NPCRAND% LSS %PLAYERRAND% ECHO You striked the dank ass lil' scorpion with %PLAYERRAND% points of damage. You killed it. What an asshole. & SET /A Health=%Health% - %NPCRAND%
IF %NPCRAND% GTR %PLAYERRAND% ECHO The scorpion fucked you up with %NPCRAND% points of damage and ran off. & SET /A Health=%Health% - %NPCRAND% & IF %NPCRAND% GTR %CritThresh% Type "img\text\criticalhit.txt" & ECHO. & ECHO You took an exceptional amount of damage. & ECHO.
IF %NPCRAND% == %PLAYERRAND% ECHO You blocked the attack. & PAUSE & GOTO :Scorpion
PAUSE
GOTO :Drawbridge

:MysteryNPC
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
IF %NPCRAND% LSS %PLAYERRAND% ECHO You striked the hybrid with %PLAYERRAND% points of damage. You killed it. & SET /A Health=%Health% - %NPCRAND%
IF %NPCRAND% GTR %PLAYERRAND% ECHO The hybrid struck you with %NPCRAND% points of damage and ran off. & SET /A Health=%Health% - %NPCRAND% & IF %NPCRAND% GTR %CritThresh% Type "img\text\criticalhit.txt" & ECHO. & ECHO You took an exceptional amount of damage. & ECHO.
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
IF %NPCRAND% LSS %PLAYERRAND% ECHO You striked Dementos with %PLAYERRAND% points of damage. You killed dementos and looted one of his ancient daggers. & SET /A Health=%Health% - %NPCRAND% & Set WeaponType=Dagger& Set /A Power=%Power% + 22
IF %NPCRAND% GTR %PLAYERRAND% ECHO Dementos struck you with %NPCRAND% points of damage and ran off. & SET /A Health=%Health% - %NPCRAND% & IF %NPCRAND% GTR %CritThresh% Type "img\text\criticalhit.txt" & ECHO. & ECHO You took an exceptional amount of damage. & ECHO.
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
IF %NPCRAND% LSS %PLAYERRAND% ECHO You striked the man riding the cow with %PLAYERRAND% points of damage. You killed them both. & SET /A Health=%Health% - %NPCRAND%
IF %NPCRAND% GTR %PLAYERRAND% ECHO The man riding the cow shit all over you with %NPCRAND% points of damage and ran off. & SET /A Health=%Health% - %NPCRAND% & IF %NPCRAND% GTR %CritThresh% Type "img\text\criticalhit.txt" & ECHO. & ECHO You took an exceptional amount of damage. & ECHO.
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
IF %NPCRAND% LSS %PLAYERRAND% ECHO You striked the beaver with %PLAYERRAND% points of damage. You killed the creature. & SET /A Health=%Health% - %NPCRAND%
IF %NPCRAND% GTR %PLAYERRAND% ECHO The beaver striked you with %NPCRAND% points of damage and ran off. & SET /A Health=%Health% - %NPCRAND% & IF %NPCRAND% GTR %CritThresh% Type "img\text\criticalhit.txt" & ECHO. & ECHO You took an exceptional amount of damage. & ECHO. 
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
IF %NPCRAND% LSS %PLAYERRAND% ECHO You striked the Wolf with %PLAYERRAND% points of damage. You killed the creature. & SET /A Health=%Health% - %NPCRAND%
IF %NPCRAND% GTR %PLAYERRAND% ECHO The Wolf striked you with %NPCRAND% points of damage and ran off. & SET /A Health=%Health% - %NPCRAND% & IF %NPCRAND% GTR %CritThresh% Type "img\text\criticalhit.txt" & ECHO. & ECHO You took an exceptional amount of damage. & ECHO. 
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
IF %NPCRAND% LSS %PLAYERRAND% ECHO You striked the alien with %PLAYERRAND% points of damage. You killed the alien. & SET /A Health=%Health% - %NPCRAND%
IF %NPCRAND% GTR %PLAYERRAND% ECHO The alien striked you with %NPCRAND% points of damage and ran off. & SET /A Health=%Health% - %NPCRAND% & IF %NPCRAND% GTR %CritThresh% Type "img\text\criticalhit.txt" & ECHO. & ECHO You took an exceptional amount of damage. & ECHO. 
IF %NPCRAND% == %PLAYERRAND% ECHO You blocked the attack. & PAUSE & GOTO :Zombie
PAUSE
GOTO :Drawbridge

:Water
CLS
SET /A WaterRoll=%RANDOM% %% 4
TYPE "img\items\water.txt"
ECHO.
ECHO While stumbling around in the %BiomeLocation% you managed to find bottled murky water.
IF %WaterRoll%==0 ECHO You drink the water and feel very refreshed. & SET /A Stamina=(%Stamina% + 40) & SET /A Health=(%Health% +10)
IF %WaterRoll%==1 ECHO You drink the water and feel somewhat refreshed. & SET /A Stamina=(%Stamina% + 20) & SET /A Health=(%Health% +5)
IF %WaterRoll%==2 ECHO You drink the water and feel somewhat refreshed. & SET /A Stamina=(%Stamina% + 20) & SET /A Health=(%Health% +5)
IF %WaterRoll%==3 ECHO You drink the water and immediatly feel your stomach hurting. You have contracted temporary dissentary and need to rest. & SET /A Stamina=(%Stamina% - 40) & SET /A Health=(%Health% -10) & PAUSE & GOTO :Rest
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
IF %NPCRAND% LSS %PLAYERRAND% ECHO You striked the alien horde with %PLAYERRAND% points of damage. You killed all the aliens. & SET /A Health=%Health% - %NPCRAND%
IF %NPCRAND% GTR %PLAYERRAND% ECHO The alien horde strikes you with %NPCRAND% points of damage and ran off. & SET /A Health=%Health% - %NPCRAND% & IF %NPCRAND% GTR %CritThresh% Type "img\text\criticalhit.txt" & ECHO. & ECHO You took an exceptional amount of damage. & ECHO.
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
IF %NPCRAND% LSS %PLAYERRAND% ECHO You striked Bulzolgon with %PLAYERRAND% points of damage. You have defeated Bulzolgon and looted his amulet of power & SET /A Health=%Health% - %NPCRAND% & Set WeaponType=BulzolgonsAmulet& Set /A Power=%Power% + 30
IF %NPCRAND% GTR %PLAYERRAND% ECHO Bulzolgon strikes you with %NPCRAND% points of damage and ran off. & ECHO. & SET /A Health=%Health% - %NPCRAND% & IF %NPCRAND% GTR %CritThresh% Type "img\text\criticalhit.txt" & ECHO. & ECHO You took an exceptional amount of damage.
IF %NPCRAND% == %PLAYERRAND% ECHO You blocked the flames with your mighty %WeaponType%. & PAUSE & GOTO :SleepDemon
PAUSE
IF %Health% LEQ 0 GOTO :Death
GOTO :Drawbridge

:Food
CLS
SET /A FoodRoll=%RANDOM% %% 4
TYPE "img\items\food.txt"
ECHO.
ECHO While stumbling around in the %BiomeLocation% you managed to find some food.
IF %FoodRoll%==0 ECHO You eat the food and feel very full. & SET /A Stamina=(%Stamina% + 35) & SET /A Health=(%Health% +30)
IF %FoodRoll%==1 ECHO You eat the food and feel somewhat full. & SET /A Stamina=(%Stamina% + 5) & SET /A Health=(%Health% +10)
IF %FoodRoll%==2 ECHO You eat the food and feel somewhat full. & SET /A Stamina=(%Stamina% + 5) & SET /A Health=(%Health% +10)
IF %FoodRoll%==3 ECHO You eat the food and immediatly feel your stomach hurting. You have contracted temporary food poisoning and need to rest. & SET /A Stamina=(%Stamina% - 40) & SET /A Health=(%Health% -20) & PAUSE & GOTO :Rest
ECHO.
PAUSE
GOTO :Drawbridge

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
If %BiomeLocation%==Forest ECHO You consume the mushrooms and immediatly start hallucinating. You wake up hours later extremely thirsty with a terrible headache. & SET /A Stamina=(%Stamina% - 30) & SET /A Health=((%Health% - 40) + %ConditionaDamage%) & PAUSE & GOTO :Rest
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
ECHO You can continue to play until you eventually die anyways.
PAUSE
GOTO :Drawbridge
ECHO.