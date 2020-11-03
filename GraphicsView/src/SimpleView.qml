import QtQuick 2.15
import QtQuick.Layouts 1.12
import QtQml.Models 2.15

Item {
	id: root

	property var selectionModel

	Rectangle {
		id: background

		anchors.fill: parent
		color: "#BDBDBD"

		MouseArea {
			anchors.fill: parent

			onPressed: {
				if (!!selectionModel)
					selectionModel.clearSelection()
			}
		}

		ColumnLayout {
			width: parent.width
			spacing: 0

			Repeater {
				id: repeater

				model: backend.model

				SimpleItem {
					property var itemIndex: repeater.model.index(index, 0)

					Layout.fillWidth: true
					Layout.fillHeight: true

					labelText: repeater.model.data(itemIndex)
					selected: !!selectionModel && selectionModel.hasSelection
							  && selectionModel.selectedIndexes.includes(itemIndex)

					onPressed: {
						if (mouse.button & Qt.LeftButton && !!selectionModel)
							selectionModel.select(itemIndex,
												  mouse.modifiers & Qt.ShiftModifier
												  ? ItemSelectionModel.Toggle
												  : ItemSelectionModel.ClearAndSelect)
					}
				}
			}
		}
	}
}
