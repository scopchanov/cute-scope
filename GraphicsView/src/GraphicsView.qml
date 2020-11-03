import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQml.Models 2.15

Item {
	id: root

	property bool panActive: false
	property var selectionModel
	property alias selectionMode: selectionRectangle.selectionMode

	clip: true

	Flickable {
		id: flickable

		anchors.fill: parent
		contentWidth: scene.width
		contentHeight: scene.height
		boundsBehavior: Flickable.StopAtBounds
		clip: true
		interactive: panActive

		ScrollBar.vertical: ScrollBar { visible: panActive }
		ScrollBar.horizontal: ScrollBar { visible: panActive }

		Rectangle {
			id: bckg

			anchors.fill: scene
			color: "white"

			Image {
				id: grid
				anchors.fill: parent
				horizontalAlignment: Image.AlignLeft
				verticalAlignment: Image.AlignTop
				fillMode: Image.Tile
				sourceSize: Qt.size(20, 20)
				source: "image://icons/grid"
			}

			DropArea {
				anchors.fill: parent

//				onDropped: if (drop.source === sidePanel.toolbox)
//							   statesModel.append({ name: "", x: drop.x - 21,
//													  y: drop.y - 21 })
			}
		}

		Item {
			id: scene

			width: 1291; height: 841

			Repeater {
				id: repeater

				model: backend.model

				StateItem {
					property var itemIndex: repeater.model.index(index, 0)
					property point pos: repeater.model.data(itemIndex,
															Qt.UserRole)

					x: pos.x; y: pos.y;
					labelName: display
					labelIndex: index
					selected: !!selectionModel && selectionModel.hasSelection
							  && selectionModel.selectedIndexes.includes(itemIndex)
					movable: !panActive
				}
			}
		}
	}

	SelectionRectangle {
		id: selectionRectangle

		outlineColor: "#801976D2"
		fillColor: "#401976D2"
		startPoint: Qt.point(mouseArea.startPos.x, mouseArea.startPos.y)
		endPoint: Qt.point(mouseArea.endPos.x, mouseArea.endPos.y)
		visible: mouseArea.selecting
	}

	MouseArea {
		id: mouseArea

		property point startPos
		property point endPos
		property bool selecting: false

		anchors.fill: parent
		cursorShape: panActive ? Qt.OpenHandCursor : Qt.ArrowCursor
		enabled: !panActive

		onPressed: {
			var mouseScenePos = mapToItem(scene, Qt.point(mouse.x, mouse.y));
			var item = scene.childAt(mouseScenePos.x, mouseScenePos.y)

			if (item) {
				mouse.accepted = false

				if (selectionModel)
					selectionModel.select(item.itemIndex,
										  mouse.modifiers & Qt.ShiftModifier
										  ? ItemSelectionModel.Toggle
										  : ItemSelectionModel.ClearAndSelect)
			} else {
				startPos = Qt.point(mouse.x, mouse.y)
			}
		}

		onPositionChanged: {
			endPos = Qt.point(mouse.x, mouse.y)

			if (!selecting)
				selecting = true

			if (!!selectionModel)
				selectionModel.select(selectionRectangle.checkItems(scene),
									  ItemSelectionModel.ClearAndSelect)
		}

		onReleased: {
			if (selecting)
				selecting = false
			else
				selectionModel.clearSelection()
		}
	}
}
