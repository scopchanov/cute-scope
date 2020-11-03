import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.12
import Scope.PaintedItems 1.0

Item {
	id: root

	readonly property alias currentSelectionMode: cmbMode.currentValue
	readonly property alias panEnabled: btnPan.checked

	implicitHeight: toolBar.implicitHeight

	ToolBar {
		id: toolBar

		anchors.fill: parent

		RowLayout {
			anchors.fill: parent

			Label {
				Layout.leftMargin: 10
				text: qsTr("Selection mode:")
				font.pointSize: 10
			}

			ComboBox {
				id: cmbMode

				textRole: "text"
				valueRole: "value"
				model: [
					{ value: SelectionHelper.SM_Contain, text: qsTr("Contain") },
					{ value: SelectionHelper.SM_Touch, text: qsTr("Touch") }
				]
			}

			ToolButton {
				id: btnPan

				checkable: true
				text: "Pan"
			}

			Item {
				Layout.fillWidth: true
			}
		}
	}
}
