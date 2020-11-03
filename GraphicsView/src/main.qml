import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.12
import QtQml.Models 2.15

ApplicationWindow {
	id: root

	width: 800
	height: 600
	visible: true
	title: qsTr("Drag and Drop")

	FontLoader { id: regular; source: "qrc:/bin/fonts/roboto/Roboto-Regular.ttf" }
	FontLoader { id: medium; source: "qrc:/bin/fonts/roboto/Roboto-Medium.ttf" }
	FontLoader { id: bold; source: "qrc:/bin/fonts/roboto/Roboto-Bold.ttf" }

	header: AppToolBar {
		id: toolBar
	}

	SplitView {
		anchors.fill: parent

		handle: Rectangle {
			implicitWidth: 4
			implicitHeight: 4
			color: SplitHandle.pressed ? "#81e889"
				: (SplitHandle.hovered ? Qt.lighter("#c2f4c6", 1.1) : "#c2f4c6")
		}

		GraphicsView {
			id: graphicsView

			panActive: toolBar.panEnabled
			selectionMode: toolBar.currentSelectionMode
			selectionModel: ism

			SplitView.fillWidth: true
		}

		ListView {
			id: listView

			model: backend.model

//			selectionModel: ism

			SplitView.preferredWidth: 250

			highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
			focus: true


			delegate: Label {
//				id: name
				width: ListView.view.width
				text: display
			}

			move: Transition {
				NumberAnimation { properties: "x,y"; duration: 1000 }
			}
		}

//		SimpleView {
//			id: simpleView

//			selectionModel: ism

//			SplitView.preferredWidth: 250
//		}
	}

	ItemSelectionModel {
		id: ism

		model: backend.model
	}
}
