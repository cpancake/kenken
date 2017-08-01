defmodule KenKen do
	def draw_board_lines(lines) when length(lines) == 0 do
		nil
	end

	def draw_board_lines(lines) do
		l = "#{Enum.join(hd(lines), " | ")}"
		IO.puts "\t#{l}"
		if length(lines) > 1 do
			IO.puts "\t#{String.duplicate("-", String.length(l))}"
		end

		draw_board_lines(tl(lines))
	end 

	def draw_board(size, board) do
		IO.puts "solution:"
		draw_board_lines(Enum.chunk_every(board, size))
	end

	def init do
		{board_num, _} = Integer.parse hd(System.argv)
		return_first = length(System.argv) > 1 and String.equivalent?(Enum.at(System.argv, 1), "first")
		IO.puts "solving board #{board_num}"

		board = Enum.at(BoardsDef.boards, board_num)
		solution = Solver.solve(board, return_first)
		if length(solution) == 0 do
			IO.puts "no solutions found"
		else
			Enum.each(solution, fn s -> draw_board(board.width, s) end)
		end
	end
end
