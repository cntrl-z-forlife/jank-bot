import sys # to access the system
import time
import os

#chess basically makes everything easy
import chess
import chess.polyglot
import chess.svg
import chess.pgn
from alphabeta import alphabeta
from quiesce import quiesce
from evaluate_board import evaluate_board
from selectmove import selectmove
book = "/Users/williamarnold/Programming/ChessBot/Books/polyglot-collection/codekiddy.bin"

#define chess board and game
board = chess.Board()
game = chess.pgn.Game()

#debug
print(board)

#ok, now for the interface
print("bienvenue, wilkommen, welcome. This chess program uses simple chess theory and computer science, but i think it might beat you.")
movehistory = []
def current_position():
    print("-------------Update--------------\r")
    print(board)
    boardsvg = (chess.svg.board(board))
    with open('temp.svg', 'w') as outputfile:
     outputfile.write(boardsvg)


    
def control(dpth):
    #Turn Control Booleans
    (Cturn) = 0
    (Pturn) = 1
    print("guess what, you get to be white. How nice. Definitely isn't just a lazy programmer.")
    while (1>0):
        if (Cturn):
            startTime = time.time()
            mov = selectmove(dpth, board, movehistory, book)
            print(time.time() - startTime, " seconds")
            board.push(mov)
            Pturn = 1
            print('The Black Computer chose:', mov)
            current_position()
        if (Pturn):
            Pmove = input("Input ur move, or end or computer(c):")
            try:
                board.push_san(Pmove)
                Cturn = 1
                current_position()
            except:
                if (Pmove == "end"):
                    print(game)
                    quit()
                if (Pmove == "c"):
                    startTime = time.time()
                    mov = selectmove(dpth, board, movehistory, book)
                    print(time.time() - startTime, " seconds")
                    board.push(mov)
                    Cturn = 1
                    print('The White Computer chose:', mov)
                if (Pmove == "comment"):
                    comment = str(input("what should I add to pgn:"))
                    game.comment = (comment)
                else:
                    print("Unintelligible input. Care to try again?")
                    Pturn = 1
                    Cturn = 0
        if board.is_checkmate():
            print("Someone is in CheckMate.")
            if (Pturn):
                print("it's rough, but you lost")
                quit()
            if (Cturn):
                print("ummmmmmm")
            else:
                print("gg gtg")
                quit()
        if board.is_stalemate():
            print("Well, somebody can't move, so you know what that means")
            quit()
        if board.is_insufficient_material():
            print("Insufficient material")
            quit()
            

def main():
    game.headers["Event"] = str(input("What shall the game be called:"))
    dupth = int(input("What depth should this poor thing use(performance suffers greatly, choose number great than 3):"))
    control(dupth)


main()
