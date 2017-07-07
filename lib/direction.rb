module Direction
	def north dir
		dir == 'R' ? 'E' : 'W'
	end

	def south dir
		dir == 'R' ? 'W' : 'E'
	end

	def west dir
		dir == 'R' ? 'N' : 'S'
	end

	def east dir
		dir == 'R' ? 'S' : 'N'
	end
end

