import QtQuick 2.15

/*
 * Activation Indicator
 */

Rectangle {
	id: root

	property bool activated

	width: 0
	height: 2

	states: State {
		name: "activated"
		when: activated

		PropertyChanges {
			target: root
			width: implicitWidth
		}
	}

	transitions: Transition {
		to: "activated"

		NumberAnimation {
			properties: "width"
			duration: 150
			easing.type: Easing.InOutQuad
		}
	}
}
