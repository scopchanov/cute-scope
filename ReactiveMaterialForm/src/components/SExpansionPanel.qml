import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.12
import "../cdk"

Item {
	id: root

	default property alias content: panel.content
	property alias title: labelTitle.text

	implicitHeight: base.height

	Elevation { source: base }

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

			RowLayout {
				id: titleLayout

				Label {
					id: labelTitle

					Layout.leftMargin: 10
					color: palette.windowText
				}

				Item {
					Layout.fillWidth: true
				}

				ToolButton {
					icon.source: "../pix/images/icons/16/arrow-down.png"
					onClicked: panel.toggle()
				}
			}

			Collapsible {
				id: panel

				Layout.fillWidth: true
			}
		}
	}
}
