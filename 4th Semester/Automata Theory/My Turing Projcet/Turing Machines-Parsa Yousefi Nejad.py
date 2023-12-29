# Turing Machine Simulator Project; Professor: D. Sheydai; Languages and Automata {Automata theory},
# Coded and Prepared By Parsa Yousefi Nejad

#   In this project I've Implemented 7 Turing Machines for 7 Different Languages
#   1. a^n b^n        2. ww^R             3. a^n b^n c^n
#   4. a^n b^n c^n    5. a^n b^m c^(nm)   6.sumTape      7.complement
from os import system, name
from time import sleep 

def printTape(tape,tapeCurrentHeadPosition,currentState):
    
    print('\n\n'+f'\033[4;48;35mState\033[0m \033[3;43;30mq{currentState}\033[0m: '+'\x1B[35m⏐\033[0m',end='')
    for X in range(0,len(tape)):
        if X == tapeCurrentHeadPosition:
            print(f"\x1B[41;1;35m[{tape[X]}]\033[0m",end='\x1B[35m⏐\033[0m');
        elif tape[X].isupper():
            print(f"\033[4;42;30m{tape[X]}\033[0m",end = '\x1B[35m⏐\033[0m');
        elif X==0 or X == len(tape)-1:
            print(f"\x1B[93m▢\033[0m",end='\x1B[35m⏐\033[0m');
        else:
            print(f"\x1B[44;4;36m{tape[X]}\033[0m",end = '\x1B[35m⏐\033[0m');
    sleep(0.03)
    # clear()   #unComment to view all transitionsw

def aN_bN(tape):
    global tapeCurrentHeadPosition, currentState, acceptFlag, code
    tapeCurrentHeadPosition = 1
    currentState = 0
    code = '[a^n . b^n]'
    a, b, X, Y, B, R, L = 'a', 'b', 'X', 'Y', '▢', 'R', 'L'
    previoustapeHeadPosition = -1
    acceptFlag = False
    while(previoustapeHeadPosition != tapeCurrentHeadPosition):
        previoustapeHeadPosition = tapeCurrentHeadPosition
        printTape(tape,tapeCurrentHeadPosition,currentState)

        if currentState == 0:
            if transfer(a,X,R,1) or transfer(Y,Y,R,4) : pass
        elif currentState == 1:
            if transfer(a,a,R,1) or transfer(b,b,R,1) or transfer(B,B,L,2) or transfer(Y,Y,L,2): pass
        elif currentState == 2:
            if transfer(b,Y,L,3): pass
        elif currentState == 3:
            if transfer(a,a,L,3) or transfer(b,b,L,3) or transfer(X,X,R,0): pass
        else:
            acceptFlag = True
    print('\n')
    return acceptFlag

def w_wR(tape):
    global tapeCurrentHeadPosition, currentState, acceptFlag, code
    tapeCurrentHeadPosition = 1
    currentState = 0

    code = '[w.w^R]'
    a, b, X, Y, B, R, L= 'a', 'b', 'X', 'Y', '▢', 'R', 'L'
    previoustapeHeadPosition = -1
    acceptFlag = False
    while(previoustapeHeadPosition != tapeCurrentHeadPosition):
        previoustapeHeadPosition = tapeCurrentHeadPosition
        printTape(tape,tapeCurrentHeadPosition,currentState)
    
        if currentState == 0:
            if transfer(a,Y,R,2) or transfer(b,X,R,1) or transfer(X,X,R,6) or transfer(Y,Y,R,6) or transfer(B,B,R,7): pass
        elif currentState == 1:
            if transfer(a,a,R,1) or transfer(b,b,R,1) or transfer(Y,Y,L,3) or transfer(X,X,L,3) or transfer(B,B,L,3): pass
        elif currentState == 2:
            if transfer(a,a,R,2) or transfer(b,b,R,2) or transfer(Y,Y,L,3) or transfer(X,X,L,3) or transfer(B,B,L,3): pass
        elif currentState == 3:
            if transfer(a,Y,L,5) or transfer(b,X,L,4): pass
        elif currentState == 4:
            if transfer(a,a,L,4) or transfer(b,b,L,4) or transfer(X,X,R,0) or transfer(Y,Y,R,0): pass
        elif currentState == 5:
            if transfer(a,a,L,5) or transfer(b,b,L,5) or transfer(X,X,R,0) or transfer(Y,Y,R,0): pass
        elif currentState == 6:
            if transfer(X,X,R,6) or transfer(Y,Y,R,6) or transfer(B,B,L,7): pass
        else:
            acceptFlag = True
    print('\n')

def aN_bN_cN(tape):
    global tapeCurrentHeadPosition, currentState, acceptFlag, code
    tapeCurrentHeadPosition = 1
    currentState = 0
    code = '[a^n . b^n . c^n]'
    a, b, c, X, Y, Z, B, R, L= 'a', 'b', 'c', 'X', 'Y', 'Z', '▢', 'R', 'L'
    previoustapeHeadPosition = -1
    acceptFlag = False
    while(previoustapeHeadPosition != tapeCurrentHeadPosition):
        previoustapeHeadPosition = tapeCurrentHeadPosition
        printTape(tape,tapeCurrentHeadPosition,currentState)   

        if currentState == 0:
            if transfer(a,X,R,1) or transfer(Y,Y,R,4): pass
        elif currentState == 1:
            if transfer(a,a,R,1) or transfer(Y,Y,R,1) or transfer(b,Y,R,2): pass
        elif currentState == 2:
            if transfer(b,b,R,2) or transfer(Z,Z,R,2) or transfer(c,Z,L,3): pass
        elif currentState ==3:
            if transfer(a,a,L,3) or transfer(Y,Y,L,3) or transfer(b,b,L,3) or transfer(Z,Z,L,3) or transfer(X,X,R,0): pass
        elif currentState == 4:
            if transfer(Y,Y,R,4) or transfer(Z,Z,R,4) or transfer(B,B,L,5): pass
        else:
            acceptFlag = True
    print('\n')

def aN_bM_cNM(tape):
    global tapeCurrentHeadPosition, acceptFlag, currentState, code
    tapeCurrentHeadPosition = 1
    currentState = 0
    code = '[a^n . b^m . c^(nm)]'
    a, b, c, X, Y, Z, B, R, L= 'a', 'b', 'c', 'X', 'Y', 'Z', '▢', 'R', 'L'
    previoustapeHeadPosition = -1
    acceptFlag = False
    while(previoustapeHeadPosition != tapeCurrentHeadPosition):
        previoustapeHeadPosition = tapeCurrentHeadPosition
        printTape(tape,tapeCurrentHeadPosition,currentState)    

        if currentState == 0:
            if transfer(b,b,R,5) or transfer(a,X,R,1): pass
        elif currentState == 1:
            if transfer(a,a,R,1) or transfer(b,Y,R,2) or transfer(Z,Z,L,4): pass
        elif currentState == 2:
            if transfer(Z,Z,R,2) or transfer(b,b,R,2) or transfer(c,Z,L,3): pass
        elif currentState == 3:
            if transfer(Z,Z,L,3) or transfer(b,b,L,3) or transfer(Y,Y,R,1): pass
        elif currentState == 4:
            if transfer(a,a,L,4) or transfer(Y,b,L,4) or transfer(X,X,R,0): pass
        elif currentState == 5:
            if transfer(Z,Z,R,5) or transfer(b,b,R,5) or transfer(B,B,L,6): pass
        else:
            acceptFlag = True
    print('\n')

def ww(tape):
    global tapeCurrentHeadPosition, currentState, acceptFlag, code
    tapeCurrentHeadPosition = 1
    currentState = 0
    a, b, c, X, Y, Z, B, R, L= 'a', 'b', 'c', 'X', 'Y', 'Z', '▢', 'R', 'L'
    previoustapeHeadPosition = -1
    acceptFlag = False
    code = '[w.w]'
    while(previoustapeHeadPosition != tapeCurrentHeadPosition):
        previoustapeHeadPosition = tapeCurrentHeadPosition
        printTape(tape,tapeCurrentHeadPosition,currentState)    

        if currentState == 0:
            if transfer(a,X,R,1) or transfer(b,Y,R,1) or transfer(Y,Y,L,4) or transfer(X,X,L,4): pass
        elif currentState == 1:
            if transfer(a,a,R,1) or transfer(b,b,R,1) or transfer(Y,Y,L,2) or transfer(X,X,L,2) or transfer(B,B,L,2): pass
        elif currentState == 2:
            if transfer(a,X,L,3) or transfer(b,Y,L,3): pass
        elif currentState == 3:
            if transfer(a,a,L,3) or transfer(b,b,L,3) or transfer(Y,Y,R,0) or transfer(X,X,R,0): pass
        elif currentState == 4:
            if transfer(X,a,L,4) or transfer(Y,b,L,4) or transfer(B,B,R,5): pass
        elif currentState == 5:
            if transfer(a,X,R,6) or transfer(b,Y,R,7) or transfer(B,B,L,9): pass
        elif currentState == 6:
            if transfer(a,a,R,6) or transfer(b,b,R,6) or transfer(B,B,R,6) or transfer(X,B,L,8): pass
        elif currentState == 7:
            if transfer(a,a,R,7) or transfer(b,b,R,7) or transfer(B,B,R,7) or transfer(Y,B,L,8): pass
        elif currentState == 8:
            if transfer(a,a,L,8) or transfer(b,b,L,8) or transfer(B,B,L,8) or transfer(X,X,R,5) or transfer(Y,Y,R,5): pass
        else:
            acceptFlag = True
    print('\n')

def sumTape(tape):
    global tapeCurrentHeadPosition, currentState, acceptFlag, code
    tapeCurrentHeadPosition = 1
    currentState = 0
    code = '[SumTape]'
    a, b, B, R, L= '0','1','▢', 'R', 'L'
    previoustapeHeadPosition = -1
    acceptFlag = False
    while(previoustapeHeadPosition != tapeCurrentHeadPosition):
        previoustapeHeadPosition = tapeCurrentHeadPosition
        printTape(tape,tapeCurrentHeadPosition,currentState)   

        if currentState == 0:
            if transfer(b,b,R,0) or transfer(a,b,R,1): pass
        elif currentState == 1:
            if transfer(b,b,R,1) or transfer(B,B,L,2): pass
        elif currentState == 2:
            if transfer(b,a,L,3): pass
        elif currentState == 3:
            if transfer(b,b,L,3) or transfer(B,B,R,4): pass
        else:
            acceptFlag = True
    print('\n')

def complement(tape):
    global tapeCurrentHeadPosition, currentState, acceptFlag, code
    tapeCurrentHeadPosition = 1
    currentState = 0
    code = '[Complement]'
    a, b, B, R, L= '0','1','▢', 'R', 'L'
    previoustapeHeadPosition = -1
    acceptFlag = False
    while(previoustapeHeadPosition != tapeCurrentHeadPosition):
        previoustapeHeadPosition = tapeCurrentHeadPosition
        printTape(tape,tapeCurrentHeadPosition,currentState)   

        if currentState == 0:
            if transfer(a,b,R,1) or transfer(b,a,R,1): pass
        elif currentState == 1:
            if transfer(a,b,R,1) or transfer(b,a,R,1) or transfer(B,B,L,2): pass
        elif currentState == 2:
            if transfer(a,a,L,2) or transfer(b,b,L,2) or transfer(B,B,R,3): pass
        else:
            acceptFlag = True
    print('\n')

def transfer(currentTapeCharacter, substituteCharacter, tapeDirection, newState):
    global tapeCurrentHeadPosition,currentState
    if tape[tapeCurrentHeadPosition] == currentTapeCharacter:   #transfer is not defined for some characters #deterministic
        tape[tapeCurrentHeadPosition] = substituteCharacter
        currentState = newState
        tapeCurrentHeadPosition = 1+tapeCurrentHeadPosition if tapeDirection == 'R' else tapeCurrentHeadPosition-1
        return True
    return False

def clear():
    if name == 'nt':
        system('cls')
    else:
        system('clear')


clear()

tape = list(input('\033[1;44;35mEnter your String:\033[0m '))
tape.insert(0,'▢')
tape.append('▢')

"""****Test Languages (Just run one)****"""
# aN_bN(tape)

w_wR(tape)

# aN_bN_cN(tape)

# ww(tape)

# sumTape(tape)

# complement(tape)

# aN_bM_cNM(tape)
""" *********************************** """

print("\033[1;42;34mTuring Machine (\033[0m"+ f"\x1b[7;35;46m{code}\x1b[0m"+"\033[1;42;34m) ACCEPTED the String.\033[0m") if acceptFlag else print("\033[4;41;35mFailed-> String REJECTED by Turing Machine(\033[0m"+ f"\x1b[7;35;46m{code}\x1b[0m"+"\033[4;41;35m).\033[0m")

""" Parsa Yousefi Nejad """