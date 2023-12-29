#Coded By Parsa Yousefi Nejad

from os import system, name

blueSea = '\x1b[1;33;34m'
whitebold = '\x1b[1;30;47m'
purplebold = '\x1b[1;30;45m'
bluebold = '\x1b[1;33;44m'
bluehint = '\x1b[3;4;46m'
darkred = '\x1b[1;31;40m'
brown = '\x1b[4;35;43m'
redBoat = '\x1b[1;34;41m'
greenGrass = '\x1b[1;32;42m'
white = '\x1b[7;35;46m'
gray = '\033[2m'
warning = '\033[91m'
resetyellow = '\x1b[7;33;66m'
endColor = '\x1b[0m'
stagecolor= '\x1b[1;7;3m' 

def Show(Record):
    listOfChars = ["POLICE","THIEF","FATHER","MOTHER","DAUGHTER_1","DAUGHTER_2","SON_1","SON_2",]
    shore = (greenGrass+"⥯"+endColor) * 10
    plainText = gray+"❖"+endColor+" {} "+brown+"|"+endColor+blueSea + \
        "~~~~~~~~~~~~~~~~"+endColor+brown+"|" + \
        endColor+" {} "+(gray+"❖"+endColor)

    print((gray+"✵"+endColor) * 44)
    print(plainText.format(shore, shore))

    for i in range(0, 8):
        characterName = listOfChars[i] + \
            (greenGrass+"⥯"+endColor) * (10 - len(listOfChars[i]))
        if Record[i] == 0:
            print(plainText.format(white+characterName+endColor, shore))
        else:
            print(plainText.format(shore, white+characterName+endColor))
        if i == 3:
            if Record[8] == 1:
                print(gray+"❖"+endColor, shore, brown+"|"+endColor, blueSea+"~~~~~~~~~~~"+endColor,
                      redBoat+"⛵️"+endColor, brown+"|"+endColor, shore, gray+"❖"+endColor)
            else:
                print(gray+"❖"+endColor, shore, brown+"|"+endColor, redBoat+"⛵️"+endColor,
                      blueSea+"~~~~~~~~~~~"+endColor, brown+"|"+endColor, shore, gray+"❖"+endColor)

    print(plainText.format(shore, shore))
    print((gray+"✵"+endColor) * 44)

def clear():

    if name == 'nt':
        system('cls')
    else:
        system('clear')
Record = [1] * 9
# ////////////////////////////////////////٫
while True:
    clear()
    print('\n', whitebold+'Enter State(0-1) of Characters in order of:'+endColor+'\n'+bluebold +
          '1:POLICE  2:THIEF  3:FATHER  4:MOTHER  5:DAUGHER_1  6:DAUGHER_2  7:SON_1  8:SON_2  9:BOAT_Direction'+endColor+'\n\n'+darkred+'Enter \'exit\' to quit.'+endColor+'\n\n')
    i = -1
    while True:
        i += 1
        if i in range(0, 9):
            print(purplebold+(str(i+1))+endColor, end=': ')
            userInput = input()
            if userInput == 'exit':
                exit()
            elif userInput == '0' or userInput == '1':
                Record[i] = int(userInput)
            else:
                print(warning+'Invalid Input, Try Again(0-1):'+endColor)
                i -= 1
        else:
            break
    clear()
    print('\n\n',bluehint +'1:POLICE  2:THIEF  3:FATHER  4:MOTHER  5:DAUGHER_1  6:DAUGHER_2  7:SON_1  8:SON_2  9:BOAT_Direction'+endColor)
    print("State =",stagecolor+str(Record)+endColor,'\n')
    Show(Record)
    input('\n'+resetyellow+'Press Return Key to Continue'+endColor)