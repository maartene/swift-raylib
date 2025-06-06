//
//  WireRenderer2D.swift
//  swift-raylib
//
//  Created by Christophe Bronner on 2021-09-04.
//

import raylib

extension WireRenderer2D {
	
	//MARK: - Triangle
	
	@inlinable public static func triangle(_ p1: Vector2, _ p2: Vector2, _ p3: Vector2, color: Color = Renderer.color) {
		DrawTriangleLines(p1.rawValue, p2.rawValue, p3.rawValue, color.rawValue)
	}

	@inlinable public static func triangle(a x1: Float, _ y1: Float, b x2: Float, _ y2: Float, c x3: Float, _ y3: Float, color: Color = Renderer.color) {
		triangle(Vector2(x1, y1), Vector2(x2, y2), Vector2(x3, y3))
	}
	
	//MARK: - Rectangle
	
	@inlinable public static func rectangle(at x: Int, _ y: Int, size width: Int, _ height: Int, color: Color = Renderer.color) {
		DrawRectangleLines(x.toInt32, y.toInt32, width.toInt32, height.toInt32, color.rawValue)
	}
	
	@inlinable public static func rectangle(_ rect: Rectangle, color: Color = Renderer.color) {
		DrawRectangleLines(rect.x.toInt32, rect.y.toInt32, rect.width.toInt32, rect.height.toInt32, color.rawValue)
	}
	
	@inlinable public static func rectangle(at x: Int, _ y: Int, size width: Int, _ height: Int, thickness: Int, color: Color = Renderer.color) {
		DrawRectangleLinesEx(.init(x: x.toFloat, y: y.toFloat, width: width.toFloat, height: height.toFloat), thickness.toFloat, color.rawValue)
	}
	
	@inlinable public static func rectangle(_ rect: Rectangle, thickness: Float, color: Color = Renderer.color) {
		DrawRectangleLinesEx(rect.rawValue, thickness, color.rawValue)
	}
	
	//MARK: - Rounded Rectangle
	
	@inlinable public static func roundedRectangle(_ shape: RoundedRectangle, thickness: Float, color: Color = Renderer.color) {
		DrawRectangleRoundedLinesEx(shape.frame.rawValue, shape.cornerRadius, shape.segments.toInt32, thickness, color.rawValue)
	}
	
	//MARK: - Circle
	
	@inlinable public static func circle(at x: Int, _ y: Int, radius: Float, color: Color = Renderer.color) {
		DrawCircleLines(x.toInt32, y.toInt32, radius, color.rawValue)
	}
	
	@inlinable public static func circle(at position: Vector2, radius: Float, color: Color = Renderer.color) {
		DrawCircleLines(position.x.toInt32, position.y.toInt32, radius, color.rawValue)
	}
	
	//MARK: - Sector
	
	@inlinable public static func sector(at x: Int, _ y: Int, radius: Float, from start: Angle, to end: Angle, segments: Int = 0, color: Color = Renderer.color) {
		DrawCircleSectorLines(Vector2(x.toFloat, y.toFloat).rawValue, radius, start.degrees, end.degrees, segments.toInt32, color.rawValue)
	}
	
	@inlinable public static func sector(at position: Vector2, radius: Float, from start: Angle, to end: Angle, segments: Int = 0, color: Color = Renderer.color) {
		DrawCircleSectorLines(position.rawValue, radius, start.degrees, end.degrees, segments.toInt32, color.rawValue)
	}
	
	//MARK: - Ellipse
	
	@inlinable public static func ellipse(at x: Int, _ y: Int, radius radiusH: Float, _ radiusV: Float, color: Color = Renderer.color) {
		DrawEllipseLines(x.toInt32, y.toInt32, radiusH, radiusV, color.rawValue)
	}
	
	@inlinable public static func ellipse(at position: Vector2, radius: Vector2, color: Color = Renderer.color) {
		DrawEllipseLines(position.x.toInt32, position.y.toInt32, radius.x, radius.y, color.rawValue)
	}
	
	//MARK: - Ring
	
	@inlinable public static func ring(at x: Int, _ y: Int, inner innerRadius: Float, outer outerRadius: Float, segments: Int = 0, from start: Angle, to end: Angle, color: Color = Renderer.color) {
		DrawRingLines(Vector2(x.toFloat, y.toFloat).rawValue, innerRadius, outerRadius, start.degrees, end.degrees, segments.toInt32, color.rawValue)
	}
	
	@inlinable public static func ring(at position: Vector2, inner innerRadius: Float, outer outerRadius: Float, segments: Int = 0, from start: Angle, to end: Angle, color: Color = Renderer.color) {
		DrawRingLines(position.rawValue, innerRadius, outerRadius, start.degrees, end.degrees, segments.toInt32, color.rawValue)
	}
	
	//MARK: - Polygon
	
	@inlinable public static func polygon(at x: Int, _ y: Int, sides: Int, radius: Float, rotation: Angle = .zero, color: Color = Renderer.color) {
		DrawPolyLines(Vector2(x.toFloat, y.toFloat).rawValue, sides.toInt32, radius, rotation.degrees, color.rawValue)
	}
	
	@inlinable public static func polygon(at position: Vector2, sides: Int, radius: Float, rotation: Angle = .zero, color: Color = Renderer.color) {
		DrawPolyLines(position.rawValue, sides.toInt32, radius, rotation.degrees, color.rawValue)
	}
	
	@inlinable public static func polygon(at x: Int, _ y: Int, sides: Int, radius: Float, rotation: Angle = .zero, thickness: Float = Renderer.thickness, color: Color = Renderer.color) {
		DrawPolyLinesEx(Vector2(x.toFloat, y.toFloat).rawValue, sides.toInt32, radius, rotation.degrees, thickness, color.rawValue)
	}

	@inlinable public static func polygon(at position: Vector2, sides: Int, radius: Float, rotation: Angle = .zero, thickness: Float = Renderer.thickness, color: Color = Renderer.color) {
		DrawPolyLinesEx(position.rawValue, sides.toInt32, radius, rotation.degrees, thickness, color.rawValue)
	}
	
}
