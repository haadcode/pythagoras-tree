require 'mittsu'

# Constants
CAMERA_MOVE_SPEED = 1
SCREEN_WIDTH = 800
SCREEN_HEIGHT = 600
ASPECT = SCREEN_WIDTH.to_f / SCREEN_HEIGHT.to_f

# Based on https://rosettacode.org/wiki/Pythagoras_tree
def createTree(scene, x1, y1, x2, y2, depth, iterations)
  color = Mittsu::Color.new(1, 1, 1) # white
  # Color based on the depth (iteration)
  # c = 1 - depth / (DEPTH_LIMIT * 1.5).to_f
  # color = Mittsu::Color.new(c, c, c)
  material = Mittsu::LineBasicMaterial.new(color: color)

  if depth < iterations
    dx = x2 - x1
    dy = y1 - y2

    x3 = x2 - dy
    y3 = y2 - dx  
    x4 = x1 - dy
    y4 = y1 - dx
    x5 = x4 + 0.5 * (dx - dy)
    y5 = y4 - 0.5 * (dx + dy)

    geometry = Mittsu::Geometry.new()
    geometry.vertices << Mittsu::Vector3.new(x1, y1, 0.0)
    geometry.vertices << Mittsu::Vector3.new(x2, y2, 0.0)
    geometry.vertices << Mittsu::Vector3.new(x3, y3, 0.0)
    geometry.vertices << Mittsu::Vector3.new(x4, y4, 0.0)
    geometry.vertices << Mittsu::Vector3.new(x1, y1, 0.0)

    line = Mittsu::Line.new(geometry, material)
    scene.add(line)

    createTree scene, x4, y4, x5, y5, depth + 1, iterations
    createTree scene, x5, y5, x3, y3, depth + 1, iterations
  end
end

# Setup our scene
renderer = Mittsu::OpenGLRenderer.new width: SCREEN_WIDTH, height: SCREEN_HEIGHT, title: 'Pythagoras Tree'
scene = Mittsu::Scene.new

# Create a camera
camera = Mittsu::PerspectiveCamera.new(45.0, ASPECT, 1, 1000)
camera.position.z = 100
camera.look_at Mittsu::Vector3.new(0.0, 0.0, 0.0)

# Create the tree
createTree scene, 0, 0, -10, 0, 0, 7

# Main loop
renderer.window.run do
  # Handle input
  camera.position.z += CAMERA_MOVE_SPEED if renderer.window.key_down?(GLFW_KEY_A)
  camera.position.z -= CAMERA_MOVE_SPEED if renderer.window.key_down?(GLFW_KEY_Q)
  camera.position.x += CAMERA_MOVE_SPEED if renderer.window.key_down?(GLFW_KEY_RIGHT)
  camera.position.x -= CAMERA_MOVE_SPEED if renderer.window.key_down?(GLFW_KEY_LEFT)
  camera.position.y += CAMERA_MOVE_SPEED if renderer.window.key_down?(GLFW_KEY_UP)
  camera.position.y -= CAMERA_MOVE_SPEED if renderer.window.key_down?(GLFW_KEY_DOWN)

  # Render the scene
  renderer.render(scene, camera)
end
