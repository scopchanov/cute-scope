import QtQuick 2.15
//import QtQuick.Controls 2.15
import QtQuick.Layouts 1.12
import "../cdk"

/*
 * SCard
 */

Item {
	id: root

	property alias title: txtTitle.text
	default property alias content: contentItem.children
	property alias actions: actionRow.children

	Elevation {
		source: card
	}

	Rectangle {
		id: card

		anchors.fill: parent
		radius: 6

		ColumnLayout {
			anchors.fill: parent

			Text {
				id: txtTitle
//				Layout.fillWidth: true
				font { family: "Roboto"; pointSize: 15; weight: Font.Medium }
				lineHeight: 32
				padding: 20
				color: palette.windowText
//				visible: text !== ""
				text: title
				z: -1
			}

			Item {
				id: contentItem

				Layout.fillWidth: true
				Layout.fillHeight: true
			}

			RowLayout {
				id: actionRow
			}
		}
	}
}
