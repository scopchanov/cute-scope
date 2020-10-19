import QtQuick 2.15
import QtQuick.Controls 2.15
import "cdk"

ApplicationWindow {
	width: 480; height: 640
	visible: true
	title: qsTr("Reactive Form")
	minimumWidth: card.implicitWidth
	minimumHeight: 100

	FontLoader { id: regular; source: "qrc:/bin/fonts/roboto/Roboto-Regular.ttf" }
	FontLoader { id: medium; source: "qrc:/bin/fonts/roboto/Roboto-Medium.ttf" }
	FontLoader { id: bold; source: "qrc:/bin/fonts/roboto/Roboto-Bold.ttf" }

	Elevation {
		source: card
		distance: 2
	}

	Rectangle {
		id: card

		width: 320; height: 480
		anchors.centerIn: parent
		radius: 6

		ExampleForm {
			anchors.fill: parent
		}
	}
}
