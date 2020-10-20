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
