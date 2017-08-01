defmodule Solver do
	# fills a board array with the given solution
	def fill_board(size, cages, solution) when is_integer(size) do
		fill_board(Array.new(size * size), cages, solution)
	end

	def fill_board(board, cages, solution) when length(cages) == 0 do
		board
	end

	def fill_board(board, cages, solution) do
		fill_board(board, cages, solution, hd(cages).positions, hd(solution))
	end

	def fill_board(board, cages, solution, places, sp) when length(places) == 0 do
		fill_board(board, tl(cages), tl(solution))
	end

	def fill_board(board, cages, solution, places, sp) do
		fill_board(Array.set(board, hd(places) - 1, hd(sp)), cages, solution, tl(places), tl(sp))
	end

	def check_cages(_rf, _size, _cos, _cages, _prev, solutions, a) when length(a) == 0 do
		solutions
	end

	def check_cages(rf, size, cos, cages, prev, solutions, a) do
		new_solutions = check_cages(
			rf, 
			size,
			cos,
			tl(cages), 
			[hd(a)|prev], 
			solutions)

		if length(new_solutions) > 0 and rf do
			new_solutions
		else
			check_cages(
				rf,
				size,
				cos,
				cages,
				prev,
				new_solutions,
				tl(a))
		end
	end

	def check_cages(rf, size, cos, cages, prev, solutions) when length(cages) == 0 do
		board = fill_board(size, cos, Enum.reverse(prev))
		if Board.check_board(board, size) do
			[board|solutions]
		else
			solutions
		end
	end

	def check_cages(rf, size, cos, cages, prev, solutions) do
		check_cages(rf, size, cos, cages, prev, solutions, hd(cages))
	end

	@doc """
	Solves the given board. Returns list of solutions
	"""
	def solve(board, return_first) do
		cages = 
			board.cages |>
			Enum.map(fn c -> Cage.find_possible_answers(c, board.width) end)

		check_cages(return_first, board.width, board.cages, cages, [], []) |>
		Enum.map(fn s -> Array.to_list(s) end)
	end
end