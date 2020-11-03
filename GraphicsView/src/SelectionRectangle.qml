import QtQuick 2.15
import Scope.PaintedItems 1.0

Item {
	id: root

	property point startPoint
	property point endPoint

	property alias selectionMode: helper.selectionMode
	property alias outlineColor: box.border.color
	property alias fillColor: box.color
	property rect rectangle: helper.rect(startPoint, endPoint)

	function checkItems(scene) {
		return helper.evaluate(scene.children, parent.mapToItem(scene, rectangle))
	}

	x: rectangle.x; y: rectangle.y
	width: rectangle.width
	height: rectangle.height

	Rectangle {
		id: box

		anchors.fill: parent
		border.width: 1

		SelectionHelper {
			id: helper
		}
	}
}
