import QtQuick 2.15

/*
 * Text Button
 */

Item {
	id: root

	property alias text: label.text

	signal clicked()

	implicitWidth: label.implicitWidth + 16
	implicitHeight: 36
	activeFocusOnTab: true

	Rectangle {
		id: base

		anchors.fill: parent
		color: "transparent"
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
		color: palette.button
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

			PropertyChanges { target: label; color: "#9E9E9E" }
		},
		State {
			name: "disabled"
			when: activeFocus

			PropertyChanges { target: base; opacity: 0.5; color: "#F5F5F5" }
		}
	]

	transitions: Transition {
		to: "disabled"
		reversible: true

		ColorAnimation { duration: 150; easing.type: Easing.InOutQuad }

	}
}
