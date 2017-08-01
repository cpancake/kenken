defmodule Ops do
	def apply(op, a, b) when op == "+" do
		a + b
	end

	def apply(op, a, b) when op == "-" and a > b do
		a - b
	end

	def apply(op, a, b) when op == "-" do
		b - a
	end

	def apply(op, a, b) when op == "x" do
		a * b
	end

	def apply(op, a, b) when op == "/" and a > b do
		a / b
	end

	def apply(op, a, b) when op == "/" do
		b / a
	end

	def apply(_op, _a, _b) do
		raise "Unknown op."
	end
end