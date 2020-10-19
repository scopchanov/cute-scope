import QtQuick 2.15
import QtQuick.Layouts 1.12
import "components"

SFormPanel {
	id: formPanel

//		Component.onCompleted: {
//			formPanel.form.init({
//									"property3": qsTr("Initially disabled field"),
//									"property4": true,
//									"property7": qsTr("Initial value")
//								})
//		}

	SComboBox {
		id: comboField

		Layout.fillWidth: true
		objectName: "prop"
	}

	SLineEdit {
		id: property1

		Layout.fillWidth: true
		objectName: "property1"
		labelText: qsTr("Required text property")
		helperText: qsTr("You have to enter a text in this field")
		isRequired: true
	}

	SLineEdit {
		id: property2

		Layout.fillWidth: true
		objectName: "property2"
		labelText: qsTr("Optional text property")
		helperText: qsTr("Type \"enable\" to enable the next field")
	}

	SLineEdit {
		id: property3

		Layout.fillWidth: true
		objectName: "property3"
		labelText: qsTr("Initially disabled text property")
		enabled: property2.value === "enable"
		helperText: qsTr("You may edit this field once it is enabled")
	}

	SCheckBox {
		id: property4

		objectName: "property4"
		label: "Checkable property"
	}

	SCheckBox {
		id: property5

		objectName: "property5"
		label: "Reveal hidden text field"
	}

	SLineEdit {
		id: property6

		Layout.fillWidth: true
		objectName: "property6"
		visible: property5.value
		labelText: qsTr("Initially hidden text property")
		helperText: qsTr("This property has a default value")
	}

	SLineEdit {
		id: property7

		Layout.fillWidth: true
		objectName: "property7"
		labelText: qsTr("Text property with a default value")
		helperText: qsTr("This field already contains a text")
	}

	actions: RowLayout {
		width: children.implicitWidth
		height: children.implicitHeight

		TextButton {
			Layout.fillHeight: true
			text: qsTr("Reset")
			enabled: !formPanel.form.pristine
			onClicked: formPanel.form.reset()
		}

		SPushButton {
			text: qsTr("Submit")
			enabled: formPanel.form.valid
			onClicked: formPanel.form.submit()
		}
	}
}
