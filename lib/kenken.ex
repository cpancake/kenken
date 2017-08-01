defmodule KenKen do
	def init do
		{board_num, _} = Integer.parse hd(System.argv)
		return_first = length(System.argv) > 1 and String.equivalent?(Enum.at(System.argv, 1), "first")
		IO.puts "solving board #{board_num}"

		board = Enum.at(BoardsDef.boards, board_num)
		IO.inspect Solver.solve(board, return_first)
	end
end
