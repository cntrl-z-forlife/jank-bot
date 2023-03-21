import chess
import chess.polyglot
import chess.svg
import chess.pgn
from chess import *


from alphabeta import alphabeta


def selectmove(depth, board, movehistory, book):
    if (board.fullmove_number <= 7):
        try:
            print("debug start")
            move = chess.polyglot.MemoryMappedReader(book).choice(board)
            movestr = str(move)
            length = len(movestr)
            Str1 = movestr[length-7:]
            ucimove = Str1[:4]
            print(ucimove)
            themove = chess.Move.from_uci(ucimove)
            print("depth=book")
            if themove in board.legal_moves:
                movehistory.append(themove)
                return themove

        except:
            bestMove = chess.Move.null()
            bestValue = -99999
            alpha = -100000
            beta = 100000
            for move in board.legal_moves:
                board.push(move)
                boardValue = -alphabeta((-beta), (-alpha), (depth-1), (board))
                if boardValue > bestValue:
                    bestValue = boardValue;
                    bestMove = move
                if( boardValue > alpha ):
                    alpha = boardValue
                board.pop()
            movehistory.append(bestMove)
            print("depth =", depth-1)
            return bestMove
    if (board.fullmove_number >= 8):#midgame has too many pieces, gotta make computer dumber for usability
        bestMove = chess.Move.null()
        bestValue = -99999
        alpha = -100000
        beta = 100000
        for move in board.legal_moves:
            board.push(move)
            boardValue = -alphabeta((-beta), (-alpha), (depth-2), (board))
            if boardValue > bestValue:
                bestValue = boardValue;
                bestMove = move
            if( boardValue > alpha ):
                alpha = boardValue
            board.pop()
        movehistory.append(bestMove)
        print("depth=", depth-2)
        return bestMove
    if (board.fullmove_number >= 13 and board.legal_moves.count() < 40):#endgame accuracy with less pieces on board
        bestMove = chess.Move.null()
        bestValue = -99999
        alpha = -100000
        beta = 100000
        for move in board.legal_moves:
            board.push(move)
            boardValue = -alphabeta((-beta), (-alpha), (depth+1), (board))
            if boardValue > bestValue:
                bestValue = boardValue;
                bestMove = move
            if( boardValue > alpha ):
                alpha = boardValue
            board.pop()
        movehistory.append(bestMove)
        print("depth =",depth+1)
        return bestMove
