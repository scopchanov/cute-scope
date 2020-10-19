import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.12
import Scope.ReactiveForms 1.0

/*
 * SFormPanel
 */

Flickable {
	id: root

	default property alias content: form.children
	property alias form: form
	property alias actions: actionRow.children

	contentWidth: pane.width
	contentHeight: pane.height
	flickableDirection: Flickable.VerticalFlick
	clip: true

	ScrollBar.vertical: ScrollBar {}

	Pane {
		id: pane

		width: root.width
		contentWidth: children.implicitWidth
		contentHeight: children.implicitHeight
		padding: 20
		focusPolicy: Qt.ClickFocus
		background: Rectangle { color: "transparent" }

		ColumnLayout {
			id: columnLayout

			anchors.fill: parent
			spacing: 20

			Form {
				id: form

				Layout.fillWidth: true
				spacing: 15
			}


			Item {
				id: actionRow

				Layout.fillWidth: true
				implicitHeight: childrenRect.height
			}
		}
	}
}
