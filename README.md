# jank-bot

This uses code from a chess-engine tutorial to make a chess-engine with minimax evaluation with alpha-beta pruning. 
See https://andreasstckl.medium.com/writing-a-chess-program-in-one-day-30daff4610ec




My improvements include:
-Engine Depth Control(though not quite as useful as it sounds due to python execution speed)
-Cython module building: I tried to make the program faster with cython
-Output to svg file openable in web browser: I can't describe how much I dislike the idea of needing Jupyter to have a nice looking chess game
-Better interface: This was definitely needed, though it's still uci commands, the board makes things easier

Planned improvements:
-Changeable opening book support: Currently, opening book needs to be specified in build of selectmove module, can't be changed from game to game
-Syzegy end-game book support: This would be awesome, and the more this bot doesn't use its evaluation function, the better
-Interface bug fixes 

Maybe(probably not) planned features
-UCI support: python-chess has plenty of UCI features, perhaps adding the ability to connect to a board and play against an engine would be nice

-Multi-threading: Currently, I can't figure out how to divide the calculations of the pieces among threads; this is mostly because i can't divide the legal moves by piece-type; perhaps i can divide the moves up by point in the legal_moves list, but thats for another time

Please read GPLv3 if ya want to use this code

Feel free to make suggestions, i doubt anyone else will care about this project. I will listen to everything.


Building:

Please use this program in a venv, just for your own sake https://python.land/virtual-environments/virtualenv

Install(via pip3) chess, cython

then, build all the modules with the commands python3 setup*module*.py build_ext --inplace
