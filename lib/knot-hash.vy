let N = 256

def densify
{
	return _ map packed per {a ~ b}
}

def knot-hash (input)
{
	let lens = [ *(input map u8), 17, 31, 73, 47, 23 ]
	
	var list = packed (0 -> N map byte)
	
	var pos = 0
	var skip = 0
	
	def rewind
	{
		let mid = -pos mod N
		
		return list[ mid -> N ] list[ 0 -> mid ]
	}
	
	for i in 0 -> 64 do
	{
		for len in lens do
		{
			# reverse
			list = -list[ 0 -> len ] list[ len -> N ]
			
			# advance
			let delta = (len + skip) % N
			
			list = list[ delta -> N ] list[ 0 -> delta ]
			
			pos = (pos + delta) % N
			
			# augment
			++skip
		}
	}
	
	return [rewind() / 16] map densify per packed
}
