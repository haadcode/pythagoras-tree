# Pythagoras Tree

Render a [Pythagoras Tree (fractal)](https://en.wikipedia.org/wiki/Pythagoras_tree_(fractal)) in Ruby.

## Requirements

- Ruby 2.x
- glfw3

## Install

Install gems:
```
bundle install
```

Install `glfw3`:
```
brew install glfw3
```

If you see an error saying something like `libglfw3.dylib not found`, you can manually link the lib to `/us/local/lib`:
```
ln -s /usr/local/Cellar/glfw/3.2.1/lib/libglfw.dylib /usr/local/lib/libglfw3.dylib
```

## Run

```
ruby pythagoras_tree.rb
```

Keys:
```
Q - zoom in
A - zoom out
UP - move camera up
DOWN - move camera down
LEFT - move camera left
RIGHT - move camera right
```

## Code

Uses https://github.com/jellymann/mittsu which is based on https://threejs.org.

three.js API docs at https://threejs.org/docs/#Reference.

## Things to try

- What happens if not all lines are drawn?
- How to change the direction of the tree?
- How to make the tree asymmetric?
- How to change the color of the tree?
- How to change the color of individual lines?
- How to use cubes instead of lines (squares)?
- How to use triangles instead of lines (squares)?
- How to make the tree grow in depth (z-axis)?
- How to make the tree and endless fractal?

## Resources

- https://en.wikipedia.org/wiki/Pythagoras_tree_(fractal)
- http://andrew-hoyer.com/experiments/fractals/
- https://rosettacode.org/wiki/Pythagoras_tree
- http://ecademy.agnesscott.edu/~lriddle/ifs/pythagorean/pythTree.htm
- http://mathworld.wolfram.com/PythagorasTree.html
