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

			AbstractButton {
				id: btnHeader

				Layout.fillWidth: true
				implicitHeight: 44

				onClicked: panel.toggle()

				RowLayout {
					anchors.fill: parent
					spacing: 0

					Label {
						id: labelTitle

						Layout.fillWidth: true
						Layout.leftMargin: 10
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

					Image {
						id: indicator
						Layout.rightMargin: 10

						source: "../pix/images/icons/16/arrow-down.png"

						states: State {
							name: "up"
							when: panel.expanded

							PropertyChanges {
								target: indicator
								rotation: 180
							}
						}

						transitions: [
							Transition {
								to: "up"

								RotationAnimation {
									duration: 250
									direction: RotationAnimation.Clockwise
									easing.type: Easing.InOutQuad
								}
							},
							Transition {
								from: "up"

								RotationAnimation {
									duration: 250
									direction: RotationAnimation.Counterclockwise
									easing.type: Easing.InOutQuad
								}
							}
						]
					}
				}
			}

			Collapsible {
				id: panel

				Layout.fillWidth: true
			}
		}
	}
}
