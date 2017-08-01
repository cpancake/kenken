defmodule Cage do
	defstruct result: 0, op: "+", positions: []

	# check if the given answer satifies this cage
	def check_cage_answer(cage, answer, n) when length(answer) == 0 do
		n == cage.result
	end

	def check_cage_answer(cage, answer, n) do
		check_cage_answer(
			cage, 
			tl(answer), 
			Ops.apply(cage.op, n, hd(answer)))
	end

	def check_cage_answer(cage, answer) do
		check_cage_answer(cage, tl(answer), hd(answer))
	end

	def permute(n, max, i, prev, permutations) 
		when i > max do
		permutations
	end

	def permute(n, max, i, prev, permutations) when length(prev) == n - 1 do
		permute(n, max, i + 1, prev, [[i|prev]|permutations])
	end

	def permute(n, max, i, prev, permutations) do
		permute(n, max, i + 1, prev, permute(n, max, 1, [i|prev], permutations))
	end

	# find all permutations of length n from 1 to max
	def permute(n, max) do
		permute(n, max, 1, [], [])
	end

	@doc """
	Returns all possible answers to the given `Cage` struct.
	`max` should be equal to the width of the board that contains `cage`.
	Returns a list of all possible solutions.
	"""
	def find_possible_answers(cage, max) do
		permute(length(cage.positions), max) |>
		Enum.filter(fn p -> check_cage_answer(cage, p) end)
	end
end