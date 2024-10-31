module intcode

def less   (a, b) {a < b}
def equals (a, b) {a == b}

let opcodes = [ 0, Math.sum, Math.product, 3, 4, 5, 6, less, equals ]

export
def machine (core)
{
	var in_dev = { return null }
	var output = ()
	var memory = core
	var halted = false
	
	var RB = 0  # Relative Base register
	var PC = 0
	
	def peek (addr)
	{
		return memory[ addr ]
	}
	
	def poke (addr, value)
	{
		memory[ addr ] = value
	}
	
	def connect-input (device)
	{
		in_dev = device
	}
	
	def read (mode, addr)
	{
		if mode == 1 then
		{
			return addr  # immediate mode
		}
		
		# load from memory
		
		if mode == 2 then
		{
			addr += RB
		}
		
		if addr >= memory.length then
		{
			return 0
		}
		
		return memory[ addr ]
	}
	
	def store (mode, addr, value)
	{
		if mode == 2 then
		{
			addr += RB
		}
		
		if addr >= memory.length then
		{
			let n = Math.max( addr + 1 - memory.length, memory.length )
			
			memory <-- (0 (*) n)
		}
		
		memory[ addr ] = value
	}
	
	def step
	{
		let opcode = memory[ PC++ ]
		
		let op = opcode % 100
		
		var modes = opcode div 100
		
		if op == 99 then
		{
			halted = true
			return false
		}
		
		let i = memory[ PC++ ]
		
		if op == 3 then
		{
			let input = in_dev()
			
			if input isa () then
			{
				PC -= 2
				output = null
				return false
			}
			
			store( modes % 10, i, input )
			return true
		}
		
		let a = read( modes % 10, i )
		
		if op == 4 then
		{
			output = a
			return false
		}
		
		if op == 9 then
		{
			RB += a
			return true
		}
		
		modes = modes div 10
		
		let j = memory[ PC++ ]
		let b = read( modes % 10, j )
		
		if op == 5 then
		{
			if a then
			{
				PC = b
			}
			
			return true
		}
		
		if op == 6 then
		{
			if not bool a then
			{
				PC = b
			}
			
			return true
		}
		
		modes = modes div 10
		
		let k = memory[ PC++ ]
		
		let c = int opcodes[ op ]( a, b )
		
		store( modes % 10, k, c )
		
		return true
	}
	
	def run (input: ...)
	{
		if input then
		{
			connect-input input
		}
		
		while step() do
		{
			continue
		}
		
		return if not halted then {output}
	}
	
	def suspend
	{
		return record( :memory, :RB, :PC )
	}
	
	def resume (state)
	{
		memory = state.memory
		
		RB = state.RB
		PC = state.PC
	}
	
	return record( :peek, :poke, :connect-input, :run, :suspend, :resume )
}
