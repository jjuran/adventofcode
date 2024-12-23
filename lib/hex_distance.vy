def hex_distance (dexter, pale, sinister)
{
	if pale < 0 then
	{
		pale     = -pale
		dexter   = -dexter
		sinister = -sinister
	}
	
	if dexter < 0 and sinister < 0 then
	{
		let min = Math.min (-dexter, pale, -sinister)
		
		sinister += min
		dexter   += min
		pale     += min
		
		return Math.sum (pale, -dexter, -sinister)
	}
	else if sinister < 0 then
	{
		# Rotate to center on dexter
		
		sinister = -sinister
		
		var tmp <- pale <- dexter <- sinister <- tmp
	}
	else if dexter < 0 then
	{
		# Rotate to center on sinister
		
		dexter = -dexter
		
		var tmp <- pale <- sinister <- dexter <- tmp
	}
	
	let min = Math.min (dexter, sinister)
	
	sinister -= min
	dexter   -= min
	pale     += min
	
	return Math.sum (pale, dexter, sinister)
}
