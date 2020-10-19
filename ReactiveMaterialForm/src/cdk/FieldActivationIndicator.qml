import QtQuick 2.15

/*
 * Field Activation Indicator
 */

Rectangle {
	id: root

	property bool activated

	width: 0; height: 2
	implicitWidth: parent.width

	states: State {
		name: "activated"
		when: activated

		PropertyChanges { target: root; width: implicitWidth }
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
