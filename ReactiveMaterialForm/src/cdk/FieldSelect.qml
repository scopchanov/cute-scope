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

		contentItem: Label {
			text: modelData.text
			color: root.currentIndex === index ? palette.windowText : palette.text
			font.weight: root.currentIndex === index ? Font.Medium : Font.Normal
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
		y: root.y
		width: root.width
		padding: 0

		contentItem: ListView {
			id: listView

			implicitHeight: contentHeight
			model: root.popup.visible ? root.delegateModel : null
			currentIndex: root.highlightedIndex
			clip: true

			ScrollIndicator.vertical: ScrollIndicator {  }
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

//	onCurrentValueChanged: console.log(currentValue)
}
