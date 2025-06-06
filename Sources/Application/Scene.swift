//
//  Scene.swift
//  swift-raylib  
//
//  Created by Christophe Bronner on 2021-12-26.
//

public protocol Scene {
	
	/// Called when the scene is first loaded
	mutating func load()
	
	/// Called when the scene is first shown to the user after being hidden
	mutating func wake()
	
	/// Called every frame to simulate the scene
	mutating func update() -> SceneAction
	
	/// Called before drawing the scene to do any offscreen rendering
	func render()
	
	/// Called every frame to draw the scene
	func draw()
	
	/// Called when the scene is about to be hidden but should stay in memory
	mutating func sleep()
	
	/// Called when the scene is about to exit to cleanup
	mutating func unload()
	
}

public enum SceneAction {
	/// The scene keeps simulating
	case `continue`

	/// A new scene is pushed onto navigation
	case push(Scene)

	/// This scene is dismissed, returning to the last scene or exiting if it was the last one
	case dismiss

	/// This scene is dismissed and replaced with the new one
	case replace(with: Scene)
}

//MARK: - Defaults

public extension Scene {
	mutating func load() { }
	mutating func wake() { }
	func render() { }
	mutating func sleep() { }
	mutating func unload() { }
}
