import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.12
import "cdk"
import "components"

ColumnLayout {
	Item {
		Layout.fillHeight: true
	}

	Flickable {
		id: flickable

		Layout.fillWidth: true
		Layout.fillHeight: true
		contentWidth: columnLayout.width
		contentHeight: columnLayout.height
		flickableDirection: Flickable.VerticalFlick

		ColumnLayout {
			id: columnLayout

			width: flickable.width

			SExpansionPanel {
				Layout.fillWidth: true

				title: qsTr("Parents")

				TextField {
					Layout.fillWidth: true
					text: "Didi"
				}

				TextField {
					Layout.fillWidth: true
					text: "Gena"
				}

				TextField {
					Layout.fillWidth: true
					text: "Sveta"
				}

				TextField {
					Layout.fillWidth: true
					text: "Val"
				}
			}

			SExpansionPanel {
				Layout.fillWidth: true
				title: qsTr("Family")

				TextField {
					Layout.fillWidth: true
					text: "Misho"
				}

				TextField {
					Layout.fillWidth: true
					text: "Sisi"
				}

				TextField {
					Layout.fillWidth: true
					text: "Pise"
				}
			}

			SExpansionPanel {
				Layout.fillWidth: true
				title: qsTr("Siblings")

				TextField {
					Layout.fillWidth: true
					text: "Cveti"
				}

				TextField {
					Layout.fillWidth: true
					text: "Vidi"
				}

				TextField {
					Layout.fillWidth: true
					text: "Ico"
				}
			}
		}
	}

	Item {
		Layout.fillHeight: true
	}
}
