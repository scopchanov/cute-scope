#ifndef SELECTIONHELPER_H
#define SELECTIONHELPER_H

#include <QObject>
#include <QItemSelection>
#include <QRectF>
#include <qqml.h>

class QQuickItem;
class QItemSelection;

class SelectionHelper : public QObject
{
	Q_OBJECT
	Q_PROPERTY(SelectionMode selectionMode READ selectionMode
			   WRITE setSelectionMode NOTIFY selectionModeChanged)
	QML_ELEMENT
public:
	enum SelectionMode {
		SM_Contain = 0,
		SM_Touch
	};
	Q_ENUMS(SelectionMode)

	explicit SelectionHelper(QObject *parent = nullptr);

	SelectionMode selectionMode() const;
	void setSelectionMode(const SelectionMode &mode);

	Q_INVOKABLE QRectF rect(const QPointF &fromPoint, const QPointF &toPoint);
	Q_INVOKABLE QItemSelection evaluate(const QQmlListReference &childItems,
								   const QRectF &selectionRect);

private:
	SelectionMode m_selectionMode;

signals:
	void selectionModeChanged();
};

#endif // SELECTIONHELPER_H
