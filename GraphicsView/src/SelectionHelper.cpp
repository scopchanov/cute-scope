#include "SelectionHelper.h"
#include <QQmlListReference>
#include <QQuickItem>
#include <QItemSelection>

SelectionHelper::SelectionHelper(QObject *parent) :
	QObject(parent),
	m_selectionMode(SM_Contain)
{

}

SelectionHelper::SelectionMode SelectionHelper::selectionMode() const
{
	return m_selectionMode;
}

void SelectionHelper::setSelectionMode(const SelectionMode &mode)
{
	if (m_selectionMode == mode)
		return;

	m_selectionMode = mode;

	emit selectionModeChanged();
}

QRectF SelectionHelper::rect(const QPointF &fromPoint, const QPointF &toPoint)
{
	qreal x = qMin(fromPoint.x(), toPoint.x());
	qreal y = qMin(fromPoint.y(), toPoint.y());

	return QRectF(x, y, qMax(fromPoint.x(), toPoint.x()) - x,
				  qMax(fromPoint.y(), toPoint.y()) - y);
}

QItemSelection SelectionHelper::evaluate(const QQmlListReference &childItems,
										 const QRectF &selectionRect)
{
	QItemSelection selection;

	for (int n = 0; n < childItems.count(); n++) {
		auto *item = qobject_cast<QQuickItem *>(childItems.at(n));
		QRectF itemRect(item->position(), item->size());

		if (item
			&& ((m_selectionMode == SM_Contain && selectionRect.contains(itemRect))
				|| (m_selectionMode == SM_Touch && selectionRect.intersects(itemRect))))

			selection.append(QItemSelectionRange(item->property("itemIndex")
												 .toModelIndex()));
	}

	return selection;
}
