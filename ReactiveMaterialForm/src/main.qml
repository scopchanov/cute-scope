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

	SExpansionPanel {
		id: expansionPanel

		anchors.left: parent.left
		anchors.right: parent.right
		anchors.verticalCenter: parent.verticalCenter
		anchors.margins: 20
		title: qsTr("New Input")

		ColumnLayout {
			spacing: 15
			Form {
				id: form

				Layout.fillWidth: true
				implicitHeight: background.implicitHeight

				background: ColumnLayout {
					width: parent.width
					spacing: 15
				}

				SLineEdit {
					Layout.fillWidth: true
					labelText: qsTr("Name")
					helperText: qsTr("Helper text")
				}

				SComboBox {
					Layout.fillWidth: true
					labelText: qsTr("Type")
					helperText: qsTr("Helper text")

					model: [
						{ value: null, text: "--" },
						{ value: 0, text: qsTr("Make") },
						{ value: 1, text: qsTr("Break") },
					]
				}

				SLineEdit {
					Layout.fillWidth: true
					labelText: qsTr("Description")
					helperText: qsTr("Helper text")
				}
			}

			RowLayout {
				Layout.margins: 10
				spacing: 15

				TextButton {
					text: qsTr("Reset")
				}

				SPushButton {
					text: qsTr("Create")
				}
			}
		}
	}

//	header: TabBar {
//		id: tabBar

//		width: parent.width

//		background: Rectangle {
//			color: "red"
//		}

//		TabButton {
//			text: qsTr("Form")
//			width: implicitWidth

//		}

//		TabButton {
//			text: "Second"
//			width: implicitWidth
//		}

//		TabButton {
//			text: "Third"
//			width: implicitWidth
//		}
//	}

//	SwipeView {
//		id: view

//		currentIndex: tabBar.currentIndex
//		anchors.fill: parent

//		Page {
//			ExampleForm {
//				id: form

//				anchors.fill: parent
//			}
//		}

//		Page {
//			ExamplePanels {
//				width: 400
//				height: parent.height
//				anchors.centerIn: parent
//			}
//		}

//		Page {
//			ExampleSnack {
//				anchors.fill: parent
//			}
//		}

//		Page {
//			ExampleButtonGroup {
//				anchors.centerIn: parent
//			}
//		}
//	}

//	PageIndicator {
//		id: indicator

//		count: view.count
//		currentIndex: view.currentIndex

//		anchors.bottom: view.bottom
//		anchors.horizontalCenter: parent.horizontalCenter
//	}
}
