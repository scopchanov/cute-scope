import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.12

/*
 * Collapsible
 */

Pane {
	id: root

	default property alias content: contentLayout.children
	property bool expanded: false

	function toggle() {
		expanded = !expanded
	}

	height: implicitHeight
	implicitHeight: 0
	visible: false
	opacity: 0.0
	padding: 10

	background: Rectangle {
		color: "transparent"
	}

	ColumnLayout {
		id: contentLayout

		width: parent.width
		height: implicitHeight
	}

	states: State {
		name: "expanded"
		when: expanded

		PropertyChanges { target: root; visible: true }
	}

	transitions: [
		Transition {
			to: "expanded"

			ParallelAnimation {
				NumberAnimation {
					target: root
					property: "implicitHeight"
					to: contentLayout.implicitHeight + 2*root.verticalPadding
					duration: 250
					easing.type: Easing.InOutQuad
				}

				NumberAnimation {
					target: root
					property: "opacity"
					to: 1.0
					duration: 250
					easing.type: Easing.InOutQuad
				}
			}
		},
		Transition {
			from: "expanded"

			SequentialAnimation {
				PropertyAction {
					target: root; property: "visible"; value: true
				}

				ParallelAnimation {
					NumberAnimation {
						target: root
						property: "implicitHeight"
						to: 0.0
						duration: 250
						easing.type: Easing.InOutQuad
					}

					NumberAnimation {
						target: root
						property: "opacity"
						to: 0.0
						duration: 250
						easing.type: Easing.InOutQuad
					}
				}

				PropertyAction {
					target: root; property: "visible"; value: false
				}
			}
		}
	]
}
