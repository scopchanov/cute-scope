import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
	id: root

	property alias value: slider.value
	property real snapThreshold: 0.03

	Slider {
		id: slider

		property real __middle: 0.5*(from + to)
		property real __startDeadband: from + snapThreshold
		property real __endDeadband: to - snapThreshold
		property real __midLeftDeadband: __middle - snapThreshold
		property real __midRightDeadband: __middle + snapThreshold

		width: parent.width
		from: 0.5
		to: 1.5
		value: 1.0

		background: Rectangle {
			anchors.centerIn: parent
			width: slider.availableWidth - slider.leftPadding
				   - slider.rightPadding
			height: 2
			radius: 1
			color: "#BDBDBD"

			ScaleDot {
				anchors.left: parent.left
				anchors.leftMargin: -2
				anchors.verticalCenter: parent.verticalCenter
				text: "1:2"
			}

			ScaleDot {
				anchors.centerIn: parent
				text: "1:1"
			}

			ScaleDot {
				anchors.right: parent.right
				anchors.rightMargin: -2
				anchors.verticalCenter: parent.verticalCenter
				text: "2:1"
			}
		}

		handle: Rectangle {
			x: slider.leftPadding + slider.visualPosition*(slider.availableWidth
														   - width)
			anchors.verticalCenter: slider.verticalCenter
			implicitWidth: 16
			implicitHeight: 16
			radius: 8
			border.color: "#9E9E9E"
			color: "white"
			scale: slider.pressed ? 0.95 : 1
			opacity: slider.pressed ? 0.75 : 1

			Behavior on opacity { NumberAnimation { duration: 75 } }
			Behavior on scale { NumberAnimation { duration: 75 } }

			Rectangle {
				anchors.centerIn: parent
				implicitWidth: 6
				implicitHeight: 6
				radius: 3
				color: "#1976D2"
				scale: slider.pressed ? 0.75 : 1

				Behavior on scale { NumberAnimation { duration: 75 } }
			}
		}

		onMoved: {
			if (value < __startDeadband)
				value = from
			if (value > __midLeftDeadband && value < __midRightDeadband)
				value = __middle
			if (value > __endDeadband)
				value = to
		}
	}
}
