import QtQuick 2.15
import QtGraphicalEffects 1.15

/*
 * Field Icon
 */

MouseArea {
	id: root

	readonly property bool down: pressed && containsMouse
	property alias iconSource: icon.source

	implicitWidth: icon.sourceSize.width
	implicitHeight: icon.sourceSize.height

	cursorShape: Qt.PointingHandCursor
	hoverEnabled: true

	Image {
		id: icon

		anchors.centerIn: parent

		scale: down ? 0.9 : 1
		opacity: down ? 0.9 : 1

		Behavior on scale {
			NumberAnimation {
				duration: 100
				easing.type: Easing.InOutQuad
			}
		}
	}
}
