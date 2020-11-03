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
import Scope.Validators 1.0
import "../components"

/*
 * Example Panels
 */

SExpansionPanel {
	id: root

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
				objectName: "name"
				isRequired: true
				Layout.fillWidth: true
				labelText: qsTr("Name")
				helperText: qsTr("The input's name, e.g. \"1B1\"")
				validators: [
					ValidatorRequired {}
				]
			}

			SComboBox {
				objectName: "type"
				Layout.fillWidth: true
				labelText: qsTr("Type")
				helperText: qsTr("The input's type, e.g. \"Make\"")

				model: [
					{ value: null, text: "--" },
					{ value: 0, text: qsTr("Make") },
					{ value: 1, text: qsTr("Break") },
				]
			}

			SLineEdit {
				objectName: "description"
				Layout.fillWidth: true
				labelText: qsTr("Description")
				helperText: qsTr("The input's description, e.g. \"Separator is BACK\"")
			}
		}

		RowLayout {
			Layout.margins: 10
			spacing: 15

			SFlatButton {
				id: btnReset

				text: qsTr("Reset")
				enabled: !form.pristine

				onClicked: form.reset()
			}

			SPushButton {
				id: btnSubmit

				text: qsTr("Create")
				enabled: form.valid

				onClicked: form.submit()
			}
		}
	}
}
