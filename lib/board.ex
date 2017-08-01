defmodule Board do
	defstruct cages: [], width: 0

	# finished checking all columns
	def check_column(_solution, size, _i, j, _used) when j >= size do
		true
	end

	# finished column
	def check_column(solution, size, i, j, _used) when i >= size do
		check_column(solution, size, 0, j + 1, [])
	end

	def check_column(solution, size, i, j, used) do
		if Enum.member?(used, solution[i * size + j]) do
			IO.puts "col failed: #{j},#{i}"
			false
		else
			check_column(solution, size, i + 1, j, [solution[i * size + j] | used])
		end
	end

	# finished checking all rows
	def check_row(_solution, size, i, _j, _used) when i >= size do
		true
	end

	# finished row
	def check_row(solution, size, i, j, _used) when j >= size do
		check_row(solution, size, i + 1, 0, [])
	end

	def check_row(solution, size, i, j, used) do
		if Enum.member?(used, solution[i * size + j]) do
			IO.puts "row failed: #{j},#{i}"
			false
		else
			check_row(solution, size, i, j + 1, [solution[i * size + j] | used])
		end
	end

	@doc """
	Checks to see if the given board is valid.
	This doesn't check cages, it only checks rows and columns.
	`solution` NEEDS TO BE AN ARRAY, NOT A LIST!

	Returns true or false.
	"""
	def check_board(solution, size) do
		Board.check_column(solution, size, 0, 0, []) and Board.check_row(solution, size, 0, 0, [])
	end 
end