module lcm

def merge_maps
{
	var result = int^[]
	
	for map in _ do
	{
		for m in map do
		{
			let k = m.key
			
			if not k in result  or  m.value > result[ k ] then
			{
				result[ k ] = m.value
			}
		}
	}
	
	return result
}

def factorization (new_sequence, product)
{
	let sequence = new_sequence()
	
	var result = []
	
	var i = 0
	
	while product > 1 do
	{
		let factor = sequence()
		
		var n = 0
		
		while product % factor == 0 do
		{
			product /= factor
		
			++n
		}
		
		if n then
		{
			result <-- factor => n
		}
	}
	
	return result
}

def lcm_with_sequence (new_sequence, inputs)
{
	let prime_factorization = factorization % new_sequence
	
	let pf = merge_maps( inputs map prime_factorization )
	
	let factors = pf map { v.key ^ v.value }
	
	return Math.product *factors
}

export
def with (prime_number_sequencing)
{
	def lcm (inputs)
	{
		let max = Iter.max inputs
		
		let new_sequence = (prime_number_sequencing.with :max).new_sequence
		
		return lcm_with_sequence( new_sequence, inputs )
	}
	
	return lcm
}
