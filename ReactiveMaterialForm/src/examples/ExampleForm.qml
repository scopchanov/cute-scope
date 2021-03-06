/**
MIT License

Copyright (c) 2020 Michael Scopchanov

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

import QtQuick 2.15
import QtQuick.Layouts 1.12
import Scope.ReactiveForms 1.0
import "../components"
import "../cdk"

//		Component.onCompleted: {
//			formPanel.form.init({
//									"property3": qsTr("Initially disabled field"),
//									"property4": true,
//									"property7": qsTr("Initial value")
//								})
//		}

SFormPanel {
	id: root

	SComboBox {
		id: comboField

		Layout.fillWidth: true
		objectName: "prop"

		model: [
			{ value: null, text: "--" },
			{ value: 0, text: qsTr("Make") },
			{ value: 1, text: qsTr("Break") },
		]
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
		shown: property5.value
		labelText: qsTr("Initially hidden text property")
		helperText: qsTr("This property has a default value")
	}

	SLineEdit {
		id: property7

//		Form.form: "1977-10-11"

		Layout.fillWidth: true
		objectName: "property7"
		labelText: qsTr("Text property with a default value")
		helperText: qsTr("This field already contains a text")

//		Component.onCompleted: console.log(Form.form)
	}

	actions: [
		TextButton {
			Layout.fillHeight: true
			text: qsTr("Reset")
//			enabled: !form.pristine
//			onClicked: { console.log(property7.Form.form); form.reset() }
		},
		SPushButton {
			text: qsTr("Submit")
			enabled: form.valid
			onClicked: form.submit()
		}
	]
}
