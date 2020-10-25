import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.15
import "../cdk"

Item {
	id: root

	default property alias content: panel.content
	property alias title: labelTitle.text
	property alias subtitle: labelSubTitle.text

	implicitHeight: base.height

	Elevation { source: container; distance: 2 }

	Item {
		id: container

		width: parent.width
		height: base.height

		Rectangle {
			id: base

			width: parent.width
			height: mainLayout.implicitHeight
			layer.enabled: true
			layer.effect: OpacityMask {
				maskSource: Rectangle {
					width: base.width
					height: base.height
					radius: 4
				}
			}

			ColumnLayout {
				id: mainLayout

				width: parent.width
				height: implicitHeight
				spacing: 0

				Rectangle {
					id: btnHeader

					Layout.fillWidth: true
					implicitHeight: 48
					color: mouseArea.hovered
						   ? mouseArea.containsPress
							 ? palette.midlight : palette.light : "transparent"

					RowLayout {
						anchors.fill: parent
						spacing: 0

						Label {
							id: labelTitle

							Layout.fillWidth: true
							Layout.leftMargin: 20
							color: palette.windowText
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
						id: mouseArea

						property bool hovered: false

						anchors.fill: parent
						onClicked: panel.toggle()
						cursorShape: Qt.PointingHandCursor
						hoverEnabled: true
						onEntered: hovered = true
						onExited: hovered = false
					}
				}

				Collapsible {
					id: panel

					Layout.fillWidth: true
				}
			}
		}
	}
}
