import QtQuick 2.15

/*
 * Ripple
 */

Rectangle {
	id: root

	height: width
	radius: 0.5*width
	opacity: 0.25
	transformOrigin: Item.Center
	visible: enabled || animation.running

	onEnabledChanged: if (enabled) { animation.start() }

	NumberAnimation {
		id: animation

		target: root
		property: "scale"
		from: 1; to: 2
		duration: 350
		easing.type: Easing.InOutQuad
	}
}
