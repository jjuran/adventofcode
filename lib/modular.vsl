module modular

export
def power (base, exponent, m)
{
	var result = 1
	
	while exponent > 0 do
	{
		if exponent % 2 then
		{
			result = result * base mod m
		}
		
		base = base * base mod m
		
		exponent /:= 2
	}
	
	return result
}

export
def alignment (base, m, M)
{
	var increment = -base
	
	while increment mod m != 0 do
	{
		increment += M
	}
	
	return base + increment
}
