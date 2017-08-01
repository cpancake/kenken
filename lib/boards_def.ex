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
			},
			%Board{
				cages: [
					%Cage{ result: 6, op: "x", positions: [1,4,7]},
					%Cage{ result: 9, op: "x", positions: [2,3,5]},
					%Cage{ result: 5, op: "+", positions: [6,8,9]}
				],
				width: 3
			},
			%Board{
				cages: [
					%Cage{ result: 2, op: "/", positions: [1,5]},
					%Cage{ result: 1, op: "-", positions: [2,3]},
					%Cage{ result: 24, op: "x", positions: [4,7,8]},
					%Cage{ result: 5, op: "+", positions: [6,10]},
					%Cage{ result: 24, op: "x", positions: [9,13,14]},
					%Cage{ result: 2, op: "/", positions: [11,15]},
					%Cage{ result: 2, op: "-", positions: [12,16]}
				],
				width: 4
			},
			%Board{
				cages: [
					%Cage{ result: 2, op: "/", positions: [1,10]},
					%Cage{ result: 1, op: "-", positions: [2,11]},
					%Cage{ result: 3, op: "/", positions: [3,12]},
					%Cage{ result: 56, op: "x", positions: [4,13]},
					%Cage{ result: 4, op: "-", positions: [5,6]},
					%Cage{ result: 11, op: "+", positions: [7,16]},
					%Cage{ result: 2, op: "/", positions: [8,9]},
					%Cage{ result: 2, op: "-", positions: [14,23]},
					%Cage{ result: 72, op: "x", positions: [15,24]},
					%Cage{ result: 17, op: "+", positions: [17,26,35]},
					%Cage{ result: 3, op: "/", positions: [18,27]},
					%Cage{ result: 7, op: "-", positions: [19,20]},
					%Cage{ result: 24, op: "x", positions: [21,22]},
					%Cage{ result: 2, op: "/", positions: [25,34]},
					%Cage{ result: 14, op: "+", positions: [28,37]},
					%Cage{ result: 12, op: "x", positions: [29,38]},
					%Cage{ result: 11, op: "+", positions: [30,31]},
					%Cage{ result: 9, op: "+", positions: [32,33]},
					%Cage{ result: 54, op: "x", positions: [36,45]},
					%Cage{ result: 90, op: "x", positions: [39,47,48]},
					%Cage{ result: 11, op: "+", positions: [40,41]},
					%Cage{ result: 3, op: "/", positions: [42,51]},
					%Cage{ result: 320, op: "x", positions: [43,44,53]},
					%Cage{ result: 15, op: "+", positions: [46,55,56]},
					%Cage{ result: 16, op: "x", positions: [49,50,59]},
					%Cage{ result: 5, op: "-", positions: [52,61]},
					%Cage{ result: 9, op: "+", positions: [54,63]},
					%Cage{ result: 7, op: "x", positions: [57,58]},
					%Cage{ result: 3, op: "/", positions: [60,69]},
					%Cage{ result: 45, op: "x", positions: [62,70,71,72]},
					%Cage{ result: 4, op: "-", positions: [64,73]},
					%Cage{ result: 2, op: "-", positions: [65,66]},
					%Cage{ result: 13, op: "+", positions: [67,68]},
					%Cage{ result: 2, op: "/", positions: [74,75]},
					%Cage{ result: 1, op: "-", positions: [76,77]},
					%Cage{ result: 3, op: "-", positions: [78,79]},
					%Cage{ result: 1, op: "-", positions: [80,81]}
				],
				width: 9
			},
			%Board{
				cages: [
					%Cage{ result: 10, op: "+", positions: [1,2,3]},
					%Cage{ result: 3, op: "-", positions: [4,9]},
					%Cage{ result: 1, op: "-", positions: [5,10]},
					%Cage{ result: 2, op: "/", positions: [6,11]},
					%Cage{ result: 6, op: "x", positions: [7,12]},
					%Cage{ result: 2, op: "-", positions: [8,13]},
					%Cage{ result: 5, op: "+", positions: [14,19]},
					%Cage{ result: 6, op: "+", positions: [15,20]},
					%Cage{ result: 2, op: "-", positions: [16,17]},
					%Cage{ result: 2, op: "/", positions: [18,23]},
					%Cage{ result: 5, op: "x", positions: [21,22]},
					%Cage{ result: 6, op: "x", positions: [24,25]}
				],
				width: 5
			}
		]
	end
end