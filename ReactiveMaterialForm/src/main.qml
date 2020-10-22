import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.12
import "cdk"
import "components"

ApplicationWindow {
	width: 480; height: 480
	visible: true
	title: qsTr("Reactive Form")
//	minimumWidth: form.implicitWidth
	minimumHeight: 100

	FontLoader { id: regular; source: "qrc:/bin/fonts/roboto/Roboto-Regular.ttf" }
	FontLoader { id: medium; source: "qrc:/bin/fonts/roboto/Roboto-Medium.ttf" }
	FontLoader { id: bold; source: "qrc:/bin/fonts/roboto/Roboto-Bold.ttf" }

//	ExampleForm {
//		id: form

//		anchors.fill: parent
//	}

	Elevation {
		source: kkk
		distance: 2
	}

	Rectangle {
		id: kkk
		anchors.centerIn: parent
		width: 300
		height: a.implicitHeight + 20
		clip: true
		radius: 6
		anchors.margins: 10

		ColumnLayout {
			id: a

			width: parent.width - 20
			anchors.centerIn: parent


			Button {
				id: button

				text: panel.expanded ? qsTr("close") : qsTr("open")
				onClicked: panel.expanded ? panel.expanded = false : panel.expanded = true
			}

			ExpansionPanel {
				id: panel

				Layout.fillWidth: true
				asd: k.implicitHeight

				ColumnLayout {
					id: k
					objectName: "asd"

					anchors.fill: parent

					TextField {
						Layout.fillWidth: true
						text: "hello"
					}

					TextField {
						Layout.fillWidth: true
						text: "Foo"
					}

					TextField {
						Layout.fillWidth: true
						text: "moo"
					}
				}

				onExpandedChanged: console.log(panel.data.toString())
			}
		}
	}
}
