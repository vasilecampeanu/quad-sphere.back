@tool
extends Node3D
class_name QuadSphere

@export var settings: QuadSphereSettings

const CONSTS = preload("./core/constants.gd")
const QUADRILITERAL_FACE = preload("../scenes/quadrilateral_face.tscn")

func _ready():
	self.generate()

func generate():
	self.settings.init(self)

	for child in get_children():
		child.queue_free()

	for direction in CONSTS.DIRECTIONS:
		var face: QuadrilateralFace = QUADRILITERAL_FACE.instantiate()
		face.build(settings, direction)
		self.add_child(face)

		# Create a bounding box
		# var bbox = MeshInstance3D.new()
		# var cube_mesh = BoxMesh.new()
		
		# Set the cube mesh size to match the face's bounding box
		# var aabb = face.get_aabb()
		# cube_mesh.size = aabb.size

		# bbox.mesh = cube_mesh
		# bbox.transform.origin = aabb.position + aabb.size / 2.0

		# Add bounding box as a child of the face
		# face.add_child(bbox)
