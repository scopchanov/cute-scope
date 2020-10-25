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
			text: qsTr("Show snack")

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
