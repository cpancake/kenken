defmodule BoardsDef do
	def boards do
		[
			%Board{
				cages: [
					%Cage{result: 6, op: "x", positions: [1,4]},
					%Cage{result: 1, op: "-", positions: [2,3]},
					%Cage{result: 7, op: "+", positions: [5,6,9]},
					%Cage{result: 1, op: "-", positions: [7,8]}
				],
				width: 3
			}
		]
	end
end