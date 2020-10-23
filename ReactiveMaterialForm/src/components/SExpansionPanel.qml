import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.12
import "../cdk"

Item {
	id: root

	default property alias content: panel.content
	property alias title: labelTitle.text
	property alias subtitle: labelSubTitle.text

	implicitHeight: base.height

	Elevation { source: base; distance: 2 }

	Rectangle {
		id: base

		width: parent.width
		height: mainLayout.implicitHeight
		radius: 4
		clip: true

		ColumnLayout {
			id: mainLayout

			width: parent.width
			height: implicitHeight
			spacing: 0

			Item {
				id: btnHeader

				Layout.fillWidth: true
				implicitHeight: 44

				RowLayout {
					anchors.fill: parent
					spacing: 0

					Label {
						id: labelTitle

						Layout.fillWidth: true
						Layout.leftMargin: 20
						color: palette.windowText
						font.pointSize: 11
						font.weight: Font.Medium
					}

					Label {
						id: labelSubTitle

						Layout.fillWidth: true
						color: palette.text
						font.pointSize: 11
					}

					ExpandedIndicator {
						id: indicator

						Layout.rightMargin: 15
						expanded: panel.expanded
						source: "../pix/images/icons/16/arrow-down.png"
					}
				}

				MouseArea {
					anchors.fill: parent
					onClicked: panel.toggle()
					cursorShape: Qt.PointingHandCursor
				}
			}

			Collapsible {
				id: panel

				Layout.fillWidth: true
			}
		}
	}
}
