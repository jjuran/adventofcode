export
def status (output)
{
	var displayed = ""
	
	def display (text)
	{
		if text != displayed then
		{
			let back = "\b" * displayed.length
			let clear = "\x1b[K"
			
			output back clear text
			
			displayed = text
		}
	}
	
	return display
}
