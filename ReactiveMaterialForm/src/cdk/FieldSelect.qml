import QtQuick 2.15
import QtQuick.Controls 2.15

/*
 * Field Select
 */

ComboBox {
	id: root

	textRole: "text"
	valueRole: "value"

	delegate: ItemDelegate {
		width: root.width

		contentItem: Text {
			text: modelData.text
			color: palette.windowText
			font: root.font
			elide: Text.ElideRight
			verticalAlignment: Text.AlignVCenter
		}

		highlighted: root.highlightedIndex === index
	}

	indicator: Item {
		visible: false
	}

	contentItem: Label {
		leftPadding: 0
		rightPadding: root.indicator.width + root.spacing
		font.weight: Font.Medium
		text: root.displayText
		color: palette.windowText
		verticalAlignment: Text.AlignVCenter
		elide: Text.ElideRight

		background: Rectangle { color: "transparent" }
	}

	background: Rectangle { color: "transparent" }

	popup: Popup {
		y: root.y//.height + 5
		width: root.width
		padding: 1

		contentItem: ListView {
			id: listView

			clip: true
			implicitHeight: contentHeight
			model: root.popup.visible ? root.delegateModel : null
			currentIndex: root.highlightedIndex

			ScrollIndicator.vertical: ScrollIndicator { }
		}

		background: Item {
			Elevation {
				source: asd
				distance: 8
			}

			Rectangle {
				id: asd
				anchors.fill: parent
				radius: 4
			}
		}

		onClosed: {
			root.focus = false
		}
	}

	onCurrentValueChanged: console.log(currentValue)
}
