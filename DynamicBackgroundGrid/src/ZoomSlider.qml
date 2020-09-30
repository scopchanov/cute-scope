import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
	id: root

	property alias value: slider.value
	property real snapThreshold: 0.03

	AppSlider {
		id: slider

		property real __middle: 0.5*(from + to)
		property real __startDeadband: from + snapThreshold
		property real __endDeadband: to - snapThreshold
		property real __midLeftDeadband: __middle - snapThreshold
		property real __midRightDeadband: __middle + snapThreshold

		width: parent.width
		from: 0.5; to: 1.5; value: 1.0

		Item {
			anchors.centerIn: parent
			width: parent.background.width

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
