import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.12
import "examples"
import "components"

ApplicationWindow {
	id: window

	width: 480; height: 480
	visible: true
	title: qsTr("Reactive Form")
	//	minimumWidth: form.implicitWidth
	//	minimumHeight: 100

	FontLoader { id: regular; source: "qrc:/bin/fonts/roboto/Roboto-Regular.ttf" }
	FontLoader { id: medium; source: "qrc:/bin/fonts/roboto/Roboto-Medium.ttf" }
	FontLoader { id: bold; source: "qrc:/bin/fonts/roboto/Roboto-Bold.ttf" }

//	ExampleForm {
//		id: form

//		anchors.fill: parent
//	}

//	ExamplePanels {
//		width: 400
//		height: parent.height
//		anchors.centerIn: parent
//	}

	ExampleSnack {
		anchors.fill: parent
	}
}
