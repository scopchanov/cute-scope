import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.12
import "../components"

Item {
	id: root

	ColumnLayout {
		anchors.centerIn: parent
		spacing: 15

		SLineEdit {
			id: lineEdit

			labelText: qsTr("Message")
			helperText: qsTr("Enter the snack message here")
//			value: qsTr("Hello world!")
		}

		SPushButton {
			text: qsTr("Open snack")

			onClicked: {
				if (loader.active) {
					loader.active = false
				}

				loader.active = true
			}
		}
	}

	Loader {
	   id: loader

	   anchors.horizontalCenter: parent.horizontalCenter
	   anchors.bottom: parent.bottom
	   anchors.bottomMargin: 25

	   source: "../components/SSnackBar.qml"
	   active: false

	   onLoaded: item.message = lineEdit.value
	}

//	Binding {
//		target: loader.item
//		property: "message"
//		value: lineEdit.value
//	}

	Connections {
		target: loader.item

		function onExpired() {
			loader.active = false
		}
	}
}
