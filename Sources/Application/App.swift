//
//  App.swift
//  swift-raylib
//
//  Created by Christophe Bronner on 2021-12-27.
//

//#if canImport(Foundation)
//import Foundation
//#endif

// TODO: Find a way to plug an async load() method
// TODO: Find a way to make scenes use an async load() method
// TODO: Turn filesystem loads into async methods

public protocol App {
	
	init() throws
	
	var initial: Scene { get }
	
	mutating func load() throws
	mutating func unload() throws
}

extension App {
	
	//MARK: - Defaults

	@inlinable public mutating func load() { }
	@inlinable public mutating func unload() { }
	
	//MARK: - @main

	@usableFromInline static func tryMain() throws {
//#if canImport(Foundation)
//		let url = Bundle.main.bundleURL
//		let path: String
//		if #available(macOS 13.0, *) {
//			path = url.path(percentEncoded: false)
//		} else {
//			path = url.path
//		}
//		FileManager.default.changeCurrentDirectoryPath(path)
//#endif
		var app = try Self.init()
		
		if !Window.isReady {
			Window.create(title: String(describing: Self.self))
		}
		
		var navigation = [app.initial]
		var scene: Scene {
			get { navigation[navigation.count - 1] }
			set { navigation[navigation.count - 1] = newValue }
		}
		
		try app.load()
		
		var action = SceneAction.push(scene)
		while Application.isRunning {
			guard !navigation.isEmpty else { break }
			
			switch action {
			case .push, .replace: scene.load()
			case .dismiss: scene.wake()
			case .continue: break
			}
			
			action = scene.update()
			scene.render()
			
			Renderer.frame {
				Renderer.clear(to: Renderer.background)
				scene.draw()
			}
			
			switch action {
			case let .push(next):
				scene.sleep()
				navigation.append(next)
				
			case let .replace(with: next):
				scene.unload()
				navigation.append(next)
				
			case .dismiss:
				scene.unload()
				navigation.removeLast()
				
			case .continue:
				break
			}
		}
		
		try app.unload()
	}

	@inlinable public static func main() {
		do {
			try tryMain()
		} catch {
			print("ERROR: \(error)")
		}
		Application.quit()
	}
	
}
