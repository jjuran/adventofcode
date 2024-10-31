module permute

def without (things, x)
{
	return things ver {v != x}
}

def remap (index_arrays, values)
{
	return index_arrays map {v map {values[ v ]}}
}

def prepend (v, things)
{
	return [v, *things]
}

export
def permutations (n)
{
	if n == 0 then
	{
		return [[]]
	}
	
	assert n > 0
	
	let subperms = permutations (n - 1)
	
	return 0 -> n map {*(remap( subperms, without(0 -> n, v) ) map prepend % v)}
}

export
def permute (values)
{
	return remap( permutations values.length, values )
}

assert without( 0 -> 1, 0) == []
assert without( 0 -> 5, 3) == [0, 1, 2, 4]

assert remap( [[]], [] ) == [[]]
assert remap( [[0, 1], [1, 0]], [3, 4] ) == [[3, 4], [4, 3]]

assert [[]] map prepend % 0 == [[0]]

assert prepend( 0, [1, 2] ) == [0, 1, 2]
