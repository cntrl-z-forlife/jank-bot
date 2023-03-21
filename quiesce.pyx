import chess
import chess.polyglot
import chess.svg
import chess.pgn
from chess import *
from evaluate_board import evaluate_board
def quiesce( alpha, beta, board):
    stand_pat = evaluate_board(board)
    if( stand_pat >= beta ):
        return beta
    if( alpha < stand_pat ):
        alpha = stand_pat

    for move in board.legal_moves:
        if board.is_capture(move):
            board.push(move)        
            score = -quiesce( -beta, -alpha, board )
            board.pop()

            if( score >= beta ):
                return beta
            if( score > alpha ):
                alpha = score  
    return alpha
