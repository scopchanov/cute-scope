import QtQuick 2.15
import QtQuick.Controls 2.15
import "../cdk"

Item {
	id: root

	property alias message: label.text
	signal expired

	implicitWidth: 344
	implicitHeight: 48

	Elevation {
		source: base
		distance: 6
	}

	Rectangle {
		id: base

		anchors.fill: parent
		color: "#313131"
		radius: 4

		Label {
			id: label

			color: palette.window
			scale: 0.87
			transformOrigin: Item.Left
			antialiasing: true
			anchors.left: parent.left
			anchors.leftMargin: 16
			anchors.verticalCenter: parent.verticalCenter
		}
	}

	Timer {
		interval: 3000
		running: true

		onTriggered: expired()
	}
}
