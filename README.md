# kenken solver

It solves [KenKen puzzles](https://en.wikipedia.org/wiki/KenKen). That's all it does. If it does anything else, you should let me know.

Puzzles are input via boards.js as a list of cages. The top left square is 1, the one to the right of it is 2, etc. So a cage in a 3x3 KenKen board that forms an L shape to the left would be 1,4,7,8. 

To solve a puzzle, run `KenKen` with the index of the puzzle you want solved:
`mix run -e KenKen.init 0`

If you don't want it to return every possible solution, add `first` to the end:
`mix run -E KenKen.init 0 first`

## how it works

First, it generates the possible answers for every cage (for example, for a two space cage of 1- in a 3x3 grid, it'd generate [2,1], [1,2], [3,2], [2,3]). Then, it brute forces all the combinations of cages. This isn't the best way to solve it, but it solves a 4x4 grid in less than a second, while the best possible case for a 4x4 grid in a true brute force would be about fifty days.

## todo

* find a better way to input puzzles