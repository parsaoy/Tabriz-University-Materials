# By Parsa Yousefi Nejad
# 6th Project: Implementation of AI version Tic Tac Toe with ((MINIMAX Tree + Alpha-Beta Pruning))
# Human = X, AI = O;   AI is Unbeatable, Starter Player is changeble
import pygame
from copy import deepcopy

# _______Constants_______
HUMAN = 1; COMPUTER = 2; EMPTY = 0
Width = Height = 630
Rows = Columns = 3
CellSize = Width // Columns
BackgroundColor = (255, 175, 240); LineColor = (255, 120, 203); CircleColor = (32, 67, 191); CrossColor = (206, 61, 72); 
BackgroundColor = (177, 177, 235); LineColor = (148, 149, 196);   #New Color - UnComment it
WinLineColor = (129, 255, 149)
CircleRadius = CellSize // 4; CellMargin = 60
LineThick = 18; CircleThick = 12; CrossThick = 19
# ***********************

pygame.init()
gameBoard = pygame.display.set_mode((Width, Height))
pygame.display.set_caption('پروژه دوز - دکتر فیضی - پارسا یوسفی نژاد')
gameBoard.fill(BackgroundColor)

class TicTacToeGAME:

    def __init__(self):
        self.board = [[EMPTY, EMPTY, EMPTY], [EMPTY, EMPTY, EMPTY], [EMPTY, EMPTY, EMPTY]]
        self.emptyCells = self.board
        self.player = COMPUTER   #This player Starts first
        self.running = True
        self.DrawBoardLines()
    def StartGame(self):
        while True:
            for event in pygame.event.get():
                if event.type == pygame.QUIT:
                    pygame.quit(); exit()

                if event.type == pygame.KEYDOWN:
                    if event.key == pygame.K_SPACE: self.Reset()
                

                if event.type == pygame.MOUSEBUTTONDOWN:
                    row = event.pos[1] // CellSize
                    col = event.pos[0] // CellSize
                    
                    if self.IsCellEmpty(self.board ,row, col) and self.running:
                        self.TakeNextAction(row, col)
                        
                        self.CheckGameOver()

            if self.player == COMPUTER and self.running:

                pygame.display.update()
                (row,col) = self.FindBestMove_MINIMAX_ABPruning(self.board, False)[0]
                # (row,col) = self.FindBestMove_MINIMAX(self.board, False)[0]
                self.TakeNextAction(row, col)
                self.CheckGameOver()
            
            pygame.display.update()

# ________ MINIMAX Alghorithm With Alph-Beta Pruning _________
    def FindBestMove_MINIMAX_ABPruning(self, board, maximizerTurn, alpha=-1, beta=1):
            
        # terminal states
        winner = self.CheckWin(board)

        if winner == HUMAN: return None, 1 # move, thisScore

        if winner == COMPUTER: return None, -1
        # draw
        elif self.IsBoardFull(board):  return None, 0

        # HUMAN (We) Tries To Maximize its Score
        if maximizerTurn:
            bestMove = None
            emptyCells = self.GetEmptyCells(board)

            for (row, col) in emptyCells:
                trialBoard = deepcopy(board)
                self.MarkSymbolToCell(trialBoard,row, col, HUMAN)
                _, thisScore = self.FindBestMove_MINIMAX_ABPruning(trialBoard, False, alpha, beta)
                # #very fast cut off
                # if thisScore==1:
                #     return (row, col), 1
                #maximizing
                if thisScore > alpha:
                    alpha = thisScore
                    bestMove = (row, col)
                if alpha >= beta:
                    break

            return bestMove, alpha

        # AI (computer) Tries To Minimize Humans Score
        elif not maximizerTurn:
            bestMove = None
            emptyCells = self.GetEmptyCells(board)

            for (row, col) in emptyCells:
                trialBoard = deepcopy(board)
                self.MarkSymbolToCell(trialBoard,row, col, COMPUTER)
                _, thisScore= self.FindBestMove_MINIMAX_ABPruning(trialBoard, True, alpha, beta)
                # #very fast cut off
                # if thisScore==-1:
                #     return (row, col), -1
                # minimizing
                if thisScore < beta:
                    beta = thisScore
                    bestMove = (row, col)
                # beta = min(beta, minScore)
                if alpha >= beta:
                    break

            return  bestMove, beta
# ************************************************************   
# _______________ Pure MINIMAX Alghorithm ____________________
    def FindBestMove_MINIMAX(self, board, maximizerTurn):
        
        # terminal states
        winner = self.CheckWin(board)

        if winner == HUMAN: return None, 1      # move, thisScore
        if winner == COMPUTER: return None, -1
        # draw
        elif self.IsBoardFull(board):  return None, 0

        # HUMAN (We) Tries To Maximize its Score
        if maximizerTurn:
            maxScore = -1
            bestMove = None
            emptyCells = self.GetEmptyCells(board)

            for (row, col) in emptyCells:
                trialBoard = deepcopy(board)
                self.MarkSymbolToCell(trialBoard,row, col, HUMAN)
                _, thisScore = self.FindBestMove_MINIMAX(trialBoard, False)
                #maximizing
                if thisScore >= maxScore:
                    maxScore = thisScore
                    bestMove = (row, col)

            return bestMove, maxScore
        
        # AI (computer) Tries To Minimize Humans Score
        elif not maximizerTurn:
            minScore = 1
            bestMove = None
            emptyCells = self.GetEmptyCells(board)

            for (row, col) in emptyCells:
                trialBoard = deepcopy(board)
                self.MarkSymbolToCell(trialBoard,row, col, COMPUTER)
                _, thisScore= self.FindBestMove_MINIMAX(trialBoard, True)
                # minimizing
                if thisScore <= minScore:
                    minScore = thisScore
                    bestMove = (row, col)

            return  bestMove, minScore
# #***********************************************************

    def MarkSymbolToCell(self,board, row, col, player):
        board[row][col] = player
    def GetEmptyCells(self,board):
        emptyCells = []
        for row in range(Rows):
            for col in range(Columns):
                if self.IsCellEmpty(board,row, col):
                    emptyCells.append( (row, col) )
        return emptyCells
    def CheckWin(self,board, gameFinished=False):

        # Column Win Check
        for col in range(Columns):
            if board[0][col] == board[1][col] == board[2][col] != EMPTY:
                player = board[0][col]
                if gameFinished: self.DrawWinLine('vertical', col)

                return player

        # Horizontal Win Check
        for row in range(Rows):
            if board[row][0] == board[row][1] == board[row][2] != EMPTY:
                player = board[row][0]
                if gameFinished: self.DrawWinLine('horizontal', row)
                return player

        #  Ascending Cross Win Check
        if board[0][0] == board[1][1] == board[2][2] != EMPTY:
            player = board[1][1]
            if gameFinished: self.DrawWinLine('ascending')
            return player

        # Descending Cross Win Check
        if board[2][0] == board[1][1] == board[0][2] != EMPTY:
            player = board[1][1]
            if gameFinished: self.DrawWinLine('descending')
            return player

        # No Won has won yet
        return 0

# _________Drawing Functions_________
    def DrawBoardLines(self):
        # Background
        gameBoard.fill(BackgroundColor)
        # vertical Lines
        pygame.draw.line(gameBoard, LineColor, (CellSize, 0), (CellSize, Height), LineThick)
        pygame.draw.line(gameBoard, LineColor, (Width - CellSize, 0), (Width - CellSize, Height), LineThick)

        # horizontal Lines
        pygame.draw.line(gameBoard, LineColor, (0, CellSize), (Width, CellSize), LineThick)
        pygame.draw.line(gameBoard, LineColor, (0, Height - CellSize), (Width, Height - CellSize), LineThick)

        # Borders:
        # left side
        pygame.draw.line(gameBoard, LineColor, (4, 0), (4, Height), LineThick)
        # right side
        pygame.draw.line(gameBoard, LineColor, (Width-6, 0), (Width-6, Height), LineThick)
        # bottom Line
        pygame.draw.line(gameBoard, LineColor, (0, Height-6), (Width, Height-6), LineThick)
        # top Line
        pygame.draw.line(gameBoard, LineColor, (0, 5), (Width, 5), LineThick)
    def DrawSymbol(self, row, col):
        if self.player == HUMAN:
            # drawing a cross symbol
            # desc line
            startDescendingPoint = (col * CellSize + CellMargin, row * CellSize + CellMargin)
            finishDescendingPoint = (col * CellSize + CellSize - CellMargin, row * CellSize + CellSize - CellMargin)
            pygame.draw.line(gameBoard, CrossColor, startDescendingPoint, finishDescendingPoint, CrossThick)
            # asc line
            startAscendingPoint = (col * CellSize + CellMargin, row * CellSize + CellSize - CellMargin)
            finishAscendingPoint = (col * CellSize + CellSize - CellMargin, row * CellSize + CellMargin)
            pygame.draw.line(gameBoard, CrossColor, startAscendingPoint, finishAscendingPoint, CrossThick)
        
        elif self.player == COMPUTER:
            # drawing a circle symbol
            centerCoordinate = (col * CellSize + CellSize // 2, row * CellSize + CellSize // 2)
            pygame.draw.circle(gameBoard, CircleColor, centerCoordinate, CircleRadius, CircleThick)
    def DrawWinLine(self, winDirection, cellIndex=0):

        if winDirection == 'vertical':
            startCoordinate = (cellIndex * CellSize + CellSize // 2, 20)
            finishCoordinate = (cellIndex * CellSize + CellSize // 2, Height - 20)
            pygame.draw.line(gameBoard, WinLineColor, startCoordinate, finishCoordinate, LineThick)

        elif winDirection == 'horizontal':
            startCoordinate = (20, cellIndex * CellSize + CellSize // 2)
            finishCoordinate = (Width - 20, cellIndex * CellSize + CellSize // 2)
            pygame.draw.line(gameBoard, WinLineColor, startCoordinate, finishCoordinate, LineThick)
        
        elif winDirection == 'ascending':
            startCoordinate = (20, 20)
            finishCoordinate = (Width - 20, Height - 20)
            pygame.draw.line(gameBoard, WinLineColor, startCoordinate, finishCoordinate, CrossThick)

        elif winDirection == 'descending':
            startCoordinate = (20, Height - 20)
            finishCoordinate = (Width - 20, 20)
            pygame.draw.line(gameBoard, WinLineColor, startCoordinate, finishCoordinate, CrossThick)
    def DrawEqual(self):
        s = pygame.Surface((1000,750), pygame.SRCALPHA)
        s.fill((255,255,255,128)) 
        gameBoard.blit(s, (0,0))
        ft_font = pygame.freetype.SysFont('Times New Roman', 150)
        ft_font.render_to(gameBoard, (Width//4, Height//2.5), 'Draw', (29, 161, 9))
        pygame.display.update()
#***********************************
    def TakeNextAction(self, row, col):

        self.MarkSymbolToCell(self.board,row, col, self.player)
        self.DrawSymbol(row, col)
        #changes player turn
        self.player = HUMAN if self.player==COMPUTER else COMPUTER
    def IsCellEmpty(self,board, row, col):
        return board[row][col] == EMPTY
    def IsBoardFull(self,board):
        return not any(EMPTY in cell for cell in board)
    def CheckGameOver(self):
        if self.CheckWin(self.board,gameFinished=True) != 0 or self.IsBoardFull(self.board):
            self.running = False
            if not self.CheckWin(self.board):
                self.DrawEqual()
    def Reset(self):
        self.__init__()

myGame = TicTacToeGAME()
myGame.StartGame()
#Parsa Yousefi Nejad