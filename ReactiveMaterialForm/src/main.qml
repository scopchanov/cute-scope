import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.12

ApplicationWindow {
	width: 640
	height: 480
	visible: true
	title: qsTr("Material Filled Text Fields")
	color: "white"

	FontLoader { id: regular; source: "qrc:/bin/fonts/roboto/Roboto-Regular.ttf" }
	FontLoader { id: medium; source: "qrc:/bin/fonts/roboto/Roboto-Medium.ttf" }
	FontLoader { id: bold; source: "qrc:/bin/fonts/roboto/Roboto-Bold.ttf" }

	Pane {
		anchors.fill: parent
		focusPolicy: Qt.ClickFocus
	}

	Form {
		id: form

		anchors.fill: parent

		ColumnLayout {
			anchors.top: parent.top
			anchors.left: parent.left
			anchors.right: parent.right
			anchors.margins: 20
			spacing: 15

			FilledTextField {
				id: editName

				Layout.fillWidth: true
				labelText: qsTr("Property 1")
				helperText: qsTr("Type \"reveal\" to enable Property 2")
				isRequired: true
			}

			FilledTextField {
				Layout.fillWidth: true
				labelText: qsTr("Property 2")
				enabled: editName.text === "reveal"
				text: "Initially disabled field"
				helperText: qsTr("You may edit this field once it is enabled")
			}

			FilledTextField {
				Layout.fillWidth: true
				labelText: qsTr("Property 3")
				text: "Initial value"
				helperText: qsTr("This field already contains a text")
			}

			RowLayout {
				TextButton {
					text: "Clear form"
//					enabled: form.dirty
					onClicked: form.reset()
				}

				ContainedButton {
					text: "Add Input"
//					enabled: form.valid
					onClicked: form.submit()
				}
			}
		}
	}
}
