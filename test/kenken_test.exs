defmodule KenKenTest do
	use ExUnit.Case
	doctest KenKen

	test "that a 3x3 board produces a valid solution" do
		solution = Solver.solve(hd(BoardsDef.boards), true)
		assert length(hd(solution) -- [3, 1, 2, 2, 3, 1, 1, 2, 3]) == 0
	end

	test "that a 5x5 board produces a valid solution" do
		solution = Solver.solve(Enum.at(BoardsDef.boards, 4), true)
		assert length(
			hd(solution) -- 
			[1, 4, 5, 2, 3, 2, 3, 1, 5, 4, 4, 2, 3, 1, 5, 3, 5, 2, 4, 1, 5, 1, 4, 3, 2]) == 0
	end

	test "that a valid solution passes check" do
		assert Board.check_board(Array.from_list([
			1,7,3,8,9,5,6,2,4,
			2,6,9,7,3,8,5,4,1,
			8,1,4,6,5,9,2,7,3,
			5,4,8,3,2,7,1,6,9,
			9,3,2,4,7,1,8,5,6,
			6,9,5,2,1,3,4,8,7,
			4,5,7,1,8,6,9,3,2,
			7,8,6,9,4,2,3,1,5,
			3,2,1,5,6,4,7,9,8]), 9)
	end

	test "that an invalid solution doesn't pass check" do
		assert not Board.check_board(Array.from_list([
			1,7,3,8,9,5,6,2,4,
			2,6,9,7,3,8,5,4,1,
			8,1,4,6,5,9,2,7,3,
			5,4,8,3,5,7,1,6,9,
			9,3,2,4,7,1,8,5,6,
			6,9,5,2,1,3,4,8,7,
			4,5,7,1,8,6,9,3,2,
			7,8,6,9,4,2,3,1,5,
			3,2,1,5,6,4,7,9,8]), 9)
	end
end
