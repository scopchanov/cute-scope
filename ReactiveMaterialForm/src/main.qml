import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.12
import Scope.ReactiveForms 1.0

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

	ColumnLayout {
		anchors.top: parent.top
		anchors.left: parent.left
		anchors.right: parent.right
		anchors.margins: 20
		spacing: 15

		Form {
			id: form
			value: {
				"type": qsTr("Initially disabled field"),
				"description": qsTr("Initial value")
			}

			Layout.fillWidth: true

			FilledTextField {
				id: editName

				objectName: "name"
				labelText: qsTr("Property 1")
				helperText: qsTr("Type \"reveal\" to enable Property 2")
				isRequired: true
			}

			FilledTextField {
				id: editType

				objectName: "type"
				labelText: qsTr("Property 2")
				enabled: editName.value === "reveal"
				helperText: qsTr("You may edit this field once it is enabled")
			}

			FilledTextField {
				id: editDescription

				objectName: "description"
				labelText: qsTr("Label")
				helperText: qsTr("This field already contains a text")
			}
		}

		RowLayout {
			TextButton {
				text: "Clear form"
				enabled: !form.pristine
				onClicked: form.reset()
			}

			ContainedButton {
				text: "Add Input"
				enabled: form.valid
				onClicked: form.submit()
			}
		}
	}
}
