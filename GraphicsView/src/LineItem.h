#ifndef LINEITEM_H
#define LINEITEM_H

#include <QQuickPaintedItem>

class LineItem : public QQuickPaintedItem
{
	Q_OBJECT
	QML_ELEMENT
public:
	explicit LineItem(QQuickItem *parent = nullptr);

	void paint(QPainter *painter) override;

private:
	QPointF m_startPoint;
	QPointF m_endPoint;
};

#endif // LINEITEM_H
