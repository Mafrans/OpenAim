stage = nil
player = nil

function init()
	-- Set the stage
	stage = scene.add(
		Box({size={ 10, 0.1, 10}}) {              		    	   -- Floor
			Box({position={-5, 0.75, 0 }, size={0.1, 1.5, 10  }}), -- Left wall
			Box({position={ 0, 3,   -5 }, size={10 , 6,   0.1 }}), -- Back wall
			Box({position={ 5, 0.75, 0 }, size={0.1, 1.5, 10  }}), -- Right wall
		}
	)
	
	-- Spawn the player at (0, 0, 0)
	player = spawnplayer()
	player.canmove(false)
	player.gravity(0)
	
	-- spawn first targets
	nexttarget()
	nexttarget()
	nexttarget()
	nexttarget()
	nexttarget()
	nexttarget()
end

function step(dt)
end

function nexttarget()
	spawntarget({
		type=Sphere, 
		position={math.random() * 8 - 4, math.random() * 4 + 1, -4.8}, 
		size={0.2, 0.2, 0.2}, 
		health=1, 
		ondeath=nexttarget
	})
end