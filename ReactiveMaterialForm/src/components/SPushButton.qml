import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "../cdk"

/*
 * Push Button
 */

Item {
	id: root

	property alias text: label.text

	signal clicked()

	implicitWidth: Math.max(label.implicitWidth + 32, 64)
	implicitHeight: 36
	activeFocusOnTab: true
	scale: mouseArea.containsPress ? 0.97 : 1

	Behavior on scale {
		NumberAnimation {
			duration: 25
		}
	}

	Elevation {
		source: container
		distance: mouseArea.containsPress ? 3 : 4
	}

	Item {
		id: container

		anchors.fill: parent

		Rectangle {
			id: base

			color: mouseArea.hovered ? Qt.lighter(palette.button, 1.04) : palette.button
			anchors.fill: parent
			layer.enabled: true
			layer.effect: OpacityMask {
				maskSource: Rectangle {
					width: base.width
					height: base.height
					radius: 4
				}
			}

			Ripple {
				id: ripple

				width: base.width
				enabled: mouseArea.pressed
			}

			ButtonLabel {
				id: label

				anchors.centerIn: parent
				color: palette.buttonText
			}

			MouseArea {
				id: mouseArea

				property bool hovered: false

				anchors.fill: parent
				cursorShape: "PointingHandCursor"
				hoverEnabled: true

				onPressed: {
					ripple.x = mouse.x - 0.5*ripple.width
					ripple.y = mouse.y - 0.5*ripple.height
				}

				onClicked: root.clicked()
				onEntered: hovered = true
				onExited: hovered = false
			}
		}
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
}
