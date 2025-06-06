//
//  Button.swift
//  swift-raylib
//
//  Created by Christophe Bronner on 2021-09-02.
//

public protocol Button {
	/// Wether the button was pressed this frame
	var isPressed: Bool { get }
	
	/// Wether the button was released this frame
	var isReleased: Bool { get }
	
	/// Wether the button is currently being held down
	var isDown: Bool { get }
	
	/// Wether the button is currently uninteracted with
	var isUp: Bool { get }
}

extension Sequence where Element: Button {
	
	/// Wether any of the buttons were pressed this frame
	@inlinable public var isAnyPressed: Bool {
		contains(where: \.isPressed)
	}
	
	/// Wether any of the buttons were released this frame
	@inlinable public var isAnyReleased: Bool {
		contains(where: \.isReleased)
	}
	
	/// Wether any of the buttons are currrently being held down
	@inlinable public var isAnyDown: Bool {
		contains(where: \.isDown)
	}
	
	/// Wether any of the buttons are currrently uninteracted with
	@inlinable public var isAnyUp: Bool {
		contains(where: \.isUp)
	}
	
	/// Wether all the buttons were pressed this frame
	@inlinable public var isAllPressed: Bool {
		allSatisfy(\.isPressed)
	}
	
	/// Wether all the buttons were released this frame
	@inlinable public var isAllReleased: Bool {
		allSatisfy(\.isReleased)
	}
	
	/// Wether all the buttons are currrently being held down
	@inlinable public var isAllDown: Bool {
		allSatisfy(\.isDown)
	}
	
	/// Wether all the buttons are currrently uninteracted with
	@inlinable public var isAllUp: Bool {
		allSatisfy(\.isUp)
	}
	
}
