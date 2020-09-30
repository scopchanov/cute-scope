import QtQuick 2.15
import QtQuick.Controls 2.15

ToolTip {
	id: root

	contentItem: Label {
		id: label

		text: root.text
		color: "#424242"
	}

	background: Rectangle {
		border.color: "#9E9E9E"
		opacity: 0.75
		radius: 2

		Behavior on visible {
			NumberAnimation {
				properties: "opacity"
				duration: 75
			}
		}
	}
}
