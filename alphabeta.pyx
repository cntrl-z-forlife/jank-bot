from chess import *
from quiesce import quiesce

#now, alpha-beta pruning for efficiency
def alphabeta( alpha, beta, depthleft, board):
    bestscore = -9999
    if( depthleft == 0 ):
        return quiesce( alpha, beta, board)
    for move in board.legal_moves:
        board.push(move)   
        score = -alphabeta( -beta, -alpha, depthleft - 1, board)
        board.pop()
        if( score >= beta ):
            return score
        if( score > bestscore ):
            bestscore = score
        if( score > alpha ):
            alpha = score   
    return bestscore
