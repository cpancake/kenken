var boards = require("./boards");

function applyOp(op, a, b)
{
	switch(op)
	{
		case "+":
			return a + b;
		case "-":
			if(b > a)
				return b - a;
			return a - b;
		case "x":
			return a * b;
		case "/":
				if(b > a)
					return b / a;
			return a / b;
		default:
			throw "Unknown operation: " + op + "!";
	}
}

function checkIfAlreadyAnswered(answers, answer)
{
	return answers.some((a) => {
		for(var i = 0; i < a.length; i++)
		{
			if(a[i] != answer[i])
				return false;
		}

		return true;
	});
}

// returns the possible answers for the specified cage
function findPossibleAnswers(cage, max)
{
	// just brute force for now
	var result = cage[0];
	var op = cage[1];
	var n = cage[2].length;

	function forLoop(p, args, answers)
	{
		for(var i = 1; i < max + 1; i++)
		{
			// go to next level if we're not at the deepest
			if(p < n)
			{
				answers = forLoop(p + 1, args.slice().concat(i), answers);
				continue;
			}

			if(args.length == 0) return;

			// check if rule applies
			var accum = args[0];
			if(args.length > 1)
			{
				for(var j = 1; j < args.length; j++)
				{
					accum = applyOp(op, accum, args[j]);
				}
			}

			// if it works and we haven't found it yet, add it
			if(accum == result && !checkIfAlreadyAnswered(answers, args))
			{
				answers.push(args);
			}
		}

		return answers;
	}

	return forLoop(0, [], []);
}

function checkBoard(solution)
{
	var w, h;
	w = h = Math.sqrt(solution.length);

	// check rows first
	for(var j = 0; j < h; j++)
	{
		var used = [];
		for(var i = 0; i < w; i++)
		{
			if(used.indexOf(solution[j * w + i]) != -1)
				return false;
			used.push(solution[j * w + i]);
		}
	}

	// check columns
	for(var i = 0; i < w; i++)
	{
		var used = [];
		for(var j = 0; j < h; j++)
		{
			if(used.indexOf(solution[i * h + j]) != -1)
				return false;
			used.push(solution[i * h + j]);
		}
	}

	return true;
}

function bruteForce(board)
{
	if(board.width === undefined) throw "no width provided";
	var cageAnswers = board.cages.map((c) => findPossibleAnswers(c, board.width));

	var possibleBoards = [];
	function checkCages(a, p)
	{
		// continue passing the buck
		if(p < board.cages.length)
		{
			for(var i = 0; i < cageAnswers[p].length; i++)
			{
				checkCages(a.concat([cageAnswers[p][i]]), p + 1);
			}

			return;
		}

		// actually check cages
		var testBoard = [];
		for(var i = 0; i < board.cages.length; i++)
		{
			var places = board.cages[i][2];
			for(var j = 0; j < places.length; j++)
			{
				testBoard[places[j] - 1] = a[i][j];
			}
		}

		if(checkBoard(testBoard))
			possibleBoards.push(testBoard);
	}

	checkCages([], 0);
	return possibleBoards;
}

function drawBoard(board)
{
	var w, h;
	w = h = Math.sqrt(board.length);
	for(var j = 0; j < h; j++)
	{
		var line = [];
		for(var i = 0; i < w; i++)
		{
			line.push(board[j * w + i]);
		}
		var prevLine = line.join(" | ");
		console.log("\t" + prevLine);
		if(j < h - 1)
			console.log("\t" + prevLine.replace(/./g, "-"));
	}
}

var n = parseInt(process.argv[2], 10);
console.log("solving " + n);
var solutions = bruteForce(boards[n]);
if(solutions.length > 0)
{
	solutions.forEach((s) => {
		console.log("solution:");
		drawBoard(s);
	});
}
else
{
	console.log("no solution found");
}