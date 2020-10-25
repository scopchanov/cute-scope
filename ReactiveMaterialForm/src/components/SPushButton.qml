import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "../cdk"

/*
 * Push Button
 */

AbstractButton {
	id: root

	implicitWidth: Math.max(label.implicitWidth + 32, 64)
	implicitHeight: 36
	scale: down ? 0.97 : 1

	onClicked: {
		ripple.x = pressX - 0.5*ripple.width
		ripple.y = pressY - 0.5*ripple.height
		ripple.start()
	}

	Behavior on scale { ScaleAnimator { duration: 25 } }

	Elevation {
		source: container
		distance: down ? 3 : 4
	}

	background: Item {
		id: container

		anchors.fill: parent

		Rectangle {
			id: base

			anchors.fill: parent
			color: palette.button
			layer.enabled: true
			layer.effect: OpacityMask {
				maskSource: Rectangle {
					width: base.width
					height: base.height
					radius: 4
				}
			}

			Behavior on color { ColorAnimation { duration: 150 } }

			Ripple { id: ripple; width: base.width }

			MouseArea {
				anchors.fill: parent
				cursorShape: "PointingHandCursor"
				enabled: false
			}
		}
	}

	ButtonLabel {
		id: label

		anchors.centerIn: parent
		color: palette.buttonText
		text: root.text
	}

	states: [
		State {
			name: "disabled"
			when: !enabled

			PropertyChanges { target: base; color: palette.window }
			PropertyChanges { target: label; color: palette.mid }
		},
		State {
			name: "focused"
			when: activeFocus

			PropertyChanges {
				target: base
				color: Qt.lighter(palette.button, 1.12)
			}
		},
		State {
			name: "hover"
			when: hovered

			PropertyChanges {
				target: base
				color: Qt.lighter(palette.button, 1.04)
			}
		}
	]
}
