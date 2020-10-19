import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "../cdk"

/*
 * SPushButton
 */

Item {
	id: root

	property alias text: label.text

	signal clicked()

	implicitWidth: label.implicitWidth + 32
	implicitHeight: 36
	activeFocusOnTab: true

	Rectangle {
		id: base

		anchors.fill: parent
		color: palette.button
		radius: 4
		clip: true

		Ripple {
			id: ripple

			width: root.width
			enabled: mouseArea.pressed
		}
	}

	ButtonLabel {
		id: label

		anchors.centerIn: parent
		color: palette.buttonText
	}

	MouseArea {
		id: mouseArea

		anchors.fill: parent
		cursorShape: "PointingHandCursor"

		onPressed: {
			ripple.x = mouse.x - 0.5*ripple.width
			ripple.y = mouse.y - 0.5*ripple.height
		}

		onClicked: root.clicked()
	}

	states: [
		State {
			name: "disabled"
			when: !enabled

			PropertyChanges { target: base; color: "#E0E0E0" }
			PropertyChanges { target: label; color: "#9E9E9E" }
		}
	]

	transitions: Transition {
		to: "disabled"
		reversible: true

		ColorAnimation { duration: 150; easing.type: Easing.InOutQuad }

	}
//	0px 3px 1px -2px rgba(0, 0, 0, 0.2), 0px 2px 2px 0px rgba(0, 0, 0, 0.14), 0px 1px 5px 0px rgba(0,0,0,.12)
}
