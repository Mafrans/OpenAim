function Composable(node, props)
	return function (children)
		return {node, props, children}
	end
end

function Box(props)
	return Composable(ComposableBox, props)
end

function PhysicsBox(props)
	return Composable(ComposablePhysicsBox, props)
end

function Sphere(props)
	return Composable(ComposableSphere, props)
end

function PhysicsSphere(props)
	return Composable(ComposablePhysicsSphere, props)
end