import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.12

ApplicationWindow {
	width: 480; height: 640
	visible: true
	title: qsTr("Reactive Form")
	minimumWidth: card.implicitWidth
	minimumHeight: 100

	FontLoader { id: regular; source: "qrc:/bin/fonts/roboto/Roboto-Regular.ttf" }
	FontLoader { id: medium; source: "qrc:/bin/fonts/roboto/Roboto-Medium.ttf" }
	FontLoader { id: bold; source: "qrc:/bin/fonts/roboto/Roboto-Bold.ttf" }

	DropShadow {
		anchors.fill: card
		horizontalOffset: 0
		verticalOffset: 2
		radius: 1.0
		spread: 0.4
		samples: 25
		color: Qt.rgba(0, 0, 0, 0.2)
		source: card
	}

	DropShadow {
		anchors.fill: card
		horizontalOffset: 0
		verticalOffset: 1
		radius: 1.0
		spread: 0.5
		samples: 25
		color: Qt.rgba(0, 0, 0, 0.14)
		source: card
	}

	DropShadow {
		anchors.fill: card
		horizontalOffset: 0
		verticalOffset: 1
		radius: 3.0
		spread: 0.5
		samples: 25
		color: Qt.rgba(0, 0, 0, 0.12)
		source: card
	}

//	0px 2px 1px -1px , 0px 1px 1px 0px , 0px 1px 3px 0px

	Rectangle {
		id: card

		width: 320
		height: 480
		anchors.centerIn: parent
		radius: 6

		ExampleForm {
			anchors.fill: parent
		}
	}
}
