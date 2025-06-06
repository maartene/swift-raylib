//
//  Edges.swift
//  swift-raylib
//
//  Created by Christophe Bronner on 2021-12-27.
//

public struct EdgeInsets<Scalar> {
	public var top: Scalar
	public var right: Scalar
	public var bottom: Scalar
	public var left: Scalar
	
	@inlinable public init(left: Scalar, top: Scalar, right: Scalar, bottom: Scalar) {
		self.left = left
		self.top = top
		self.right = right
		self.bottom = bottom
	}
	
	@inlinable public init(horizontal: Scalar, vertical: Scalar) {
		self.init(left: horizontal, top: vertical, right: horizontal, bottom: vertical)
	}
	
	@inlinable public init(_ value: Scalar) {
		self.init(left: value, top: value, right: value, bottom: value)
	}
	
}

extension EdgeInsets: ExpressibleByIntegerLiteral where Scalar: ExpressibleByIntegerLiteral, Scalar.IntegerLiteralType == Scalar {
	
	public init(integerLiteral value: Scalar) {
		self.init(value)
	}
	
}
