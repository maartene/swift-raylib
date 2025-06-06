//
//  TextRenderer2D.swift
//  swift-raylib
//
//  Created by Christophe Bronner on 2021-09-01.
//

import raylib

public extension Renderer2D {
	
	//MARK: - FPS

	@inlinable static func fps(at x: Int, _ y: Int) {
		DrawFPS(x.toInt32, y.toInt32)
	}

	//MARK: - Text

	@inlinable static func text(_ value: String, at x: Int, _ y: Int, size: Float = Renderer.pointSize, color: Color = Renderer.textColor) {
		DrawText(value, x.toInt32, y.toInt32, size.toInt32, color.rawValue)
	}
	
	@inlinable static func text(_ value: String, at x: Int, _ y: Int, size: Float = Renderer.pointSize, alignment: TextAlignment = Renderer.textAlignment, color: Color = Renderer.textColor) {
		DrawText(value, (x + alignment.offset(of: value, at: size)).toInt32, y.toInt32, size.toInt32, color.rawValue)
	}
	
	@inlinable static func text(center value: String, offset x: Int = 0, _ y: Int = 0, size: Float = Renderer.pointSize, color: Color = Renderer.textColor) {
		text(value, at: (Window.width - Text.measure(value, size: size)) / 2 + x, (Window.height - size.toInt) / 2 + y, size: size, color: color)
	}

	@inlinable static func text(using font: Font, _ value: String, at x: Float, _ y: Float, spacing: Float, size: Float = Renderer.pointSize, color: Color = Renderer.textColor) {
		DrawTextEx(font.rawValue, value, Vector2(x, y).rawValue, size, spacing, color.rawValue)
	}

}
