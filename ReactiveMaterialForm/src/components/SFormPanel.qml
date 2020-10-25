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
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.12
import Scope.ReactiveForms 1.0

/*
 * Form Panel
 */

Flickable {
	id: root

	default property alias formElements: form.formElements
	property alias actions: actionRow.children
	property alias pristine: form.pristine
	property alias valid: form.valid
	property alias value: form.value

	contentWidth: pane.width
	contentHeight: pane.height
	flickableDirection: Flickable.VerticalFlick
	clip: true

	ScrollBar.vertical: ScrollBar {}

	Pane {
		id: pane

		width: root.width
		contentWidth: columnLayout.implicitWidth
		contentHeight: columnLayout.implicitHeight
		padding: 20
		focusPolicy: Qt.ClickFocus
		background: Rectangle { color: palette.base }

		ColumnLayout {
			id: columnLayout

			anchors.fill: parent
			spacing: 20

			Form {
				id: form

				Layout.fillWidth: true
				implicitHeight: background.implicitHeight

				background: ColumnLayout {
					width: parent.width
					spacing: 15
				}
			}

			RowLayout {
				id: actionRow
			}
		}
	}
}
