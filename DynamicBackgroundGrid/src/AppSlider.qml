import QtQuick 2.15
import QtQuick.Controls 2.15

Slider {
	id: slider

	background: Rectangle {
		anchors.centerIn: parent
		width: slider.availableWidth - slider.leftPadding
			   - slider.rightPadding
		height: 2
		radius: 1
		color: "#BDBDBD"
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
}
