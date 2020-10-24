import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.12
import "examples"
import "components"
import "cdk"
import Scope.ReactiveForms 1.0
import QtGraphicalEffects 1.13

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

	header: TabBar {
		id: tabBar

		width: parent.width

		background: Rectangle {
			color: "red"
		}

		TabButton {
			text: qsTr("Form")
			width: implicitWidth

		}

		TabButton {
			text: "Second"
			width: implicitWidth
		}

		TabButton {
			text: "Third"
			width: implicitWidth
		}
	}

	SwipeView {
		id: view

		currentIndex: tabBar.currentIndex
		anchors.fill: parent

		Page {
			ExampleForm {
				id: form

				anchors.fill: parent
			}
		}

		Page {
			ExamplePanels {
				width: 400
				height: parent.height
				anchors.centerIn: parent
			}
		}

		Page {
			ExampleSnack {
				anchors.fill: parent
			}
		}

		Page {
			ExampleButtonGroup {
				anchors.centerIn: parent
			}
		}
	}

	PageIndicator {
		id: indicator

		count: view.count
		currentIndex: view.currentIndex

		anchors.bottom: view.bottom
		anchors.horizontalCenter: parent.horizontalCenter
	}
}
