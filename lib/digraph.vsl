module digraph

export
def transposed (graph)
{
	var transpose = str^[]
	
	for node in graph do
	{
		let src = node.key
		
		for dst in node.value do
		{
			if dst in transpose then
			{
				transpose[ dst ] <-- src
			}
			else
			{
				transpose[ dst ] = [src]
			}
		}
	}
	
	return transpose
}

export
def closure (graph, node)
{
	let T = typeof node
	
	var result = []
	
	var working_set = [ node ]
	
	while working_set do
	{
		var new_set = T^[]
		
		for c in working_set do
		{
			if not c in result then
			{
				result <-- c
				
				if c in graph then
				{
					for s in graph[ c ] do
					{
						new_set[ s ] = null
					}
				}
			}
		}
		
		working_set = new_set.keys
	}
	
	return result
}
