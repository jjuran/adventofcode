module sieve-of-eratosthenes

export
def with (config)
{
	assert config.key == "max"
	
	let limit = config.value + 1
	
	var n = 0
	
	var composites = x"00" * limit
	
	for i in 2 -> limit do
	{
		if not bool composites[ i ] then
		{
			++n
			
			var j = i^2
			
			while j < limit do
			{
				composites[ j ] = '\xFF'
				
				j += i
			}
		}
	}
	
	def is_prime (x)
	{
		assert x in 0 -> limit
		
		return x >= 2 and not bool composites[ x ]
	}
	
	def new_sequence
	{
		var last = 1
		
		def next
		{
			while ++last < limit and composites[ last ] do
			{
				continue
			}
			
			return if last < limit then {last}
		}
		
		return next
	}
	
	return record( :is_prime, :new_sequence )
}

do
{
	let sieve = with (max: 20)
	
	let primes = [2, 3, 5, 7, 11, 13, 17, 19]
	
	assert 1 .. 20 ver sieve.is_prime == primes
	
	var i = 0
	
	for e in receiver sieve.new_sequence() do
	{
		assert e == primes[ i++ ]
	}
	
	assert i == primes.length
}
