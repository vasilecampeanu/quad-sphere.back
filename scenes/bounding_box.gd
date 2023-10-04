@tool
extends MeshInstance3D

func _ready():
	var quadrilateral_face = get_parent()
	var cube_mesh = BoxMesh.new()
	var aabb = quadrilateral_face.get_aabb()
	cube_mesh.size = aabb.size
	self.mesh = cube_mesh
	self.transform.origin = aabb.position + aabb.size / 2.0
