#include "LineItem.h"
#include <QPainter>

LineItem::LineItem(QQuickItem *parent) :
	QQuickPaintedItem(parent)
{

}

void LineItem::paint(QPainter *painter)
{
	painter->setPen(Qt::red);
	painter->drawLine(m_startPoint, m_endPoint);
}
