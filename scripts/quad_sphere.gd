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

	for direction in CONSTS.DIRECTIONS:
		var face: QuadrilateralFace = QUADRILITERAL_FACE.instantiate()
		face.build(settings, direction)
		self.add_child(face)
