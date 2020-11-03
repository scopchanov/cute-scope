#include "PixmapBuilder.h"
#include <QPainter>

PixmapBuilder::PixmapBuilder() :
	QQuickImageProvider(QQuickImageProvider::Pixmap)
{
	m_palette.setColor(QPalette::Window, QColor("#FFFFFF"));
	m_palette.setColor(QPalette::AlternateBase, QColor("#FAFAFA"));
	m_palette.setColor(QPalette::Base, QColor("#F5F5F5"));
	m_palette.setColor(QPalette::Light, QColor("#EEEEEE"));
	m_palette.setColor(QPalette::Midlight, QColor("#E0E0E0"));
	m_palette.setColor(QPalette::Mid, QColor("#BDBDBD"));
	m_palette.setColor(QPalette::Dark, QColor("#9E9E9E"));
	m_palette.setColor(QPalette::Text, QColor("#757575"));
	m_palette.setColor(QPalette::WindowText, QColor("#424242"));
	m_palette.setColor(QPalette::Shadow, QColor("#000000"));
	m_palette.setColor(QPalette::Highlight, QColor("#1976D2"));
}

QPalette PixmapBuilder::palette() const
{
	return m_palette;
}

void PixmapBuilder::setPalette(const QPalette &p)
{
	m_palette = p;
}

QPixmap PixmapBuilder::requestPixmap(const QString &id, QSize *size,
									 const QSize &requestedSize)
{
	int width = 16;
	int height = 16;

	if (size)
		*size = QSize(width, height);

	QPixmap pixmap(requestedSize.width() > 0 ? requestedSize.width() : width,
				   requestedSize.height() > 0 ? requestedSize.height() : height);
	QPainter painter;

	pixmap.fill(Qt::transparent);

	painter.begin(&pixmap);

	QColor color(Qt::red);

	QHash<QString, int> hash;

	hash.insert("grid", PT_Grid);
	hash.insert("hrule", PT_HRule);
	hash.insert("vrule", PT_VRule);

	switch (hash.value(id)) {
		case PT_Grid:
			drawGrid(&painter);
			break;
		case PT_HRule:
			drawHRule(&painter);
			break;
		case PT_VRule:
			drawVRule(&painter);
			break;
	}

	return pixmap;
}

void PixmapBuilder::drawGrid(QPainter *painter)
{
	painter->setPen(QPen(m_palette.light().color()));
	painter->drawLine(0, 10, 19, 10);
	painter->drawLine(10, 0, 10, 19);
	painter->setPen(QPen(m_palette.midlight().color()));
	painter->drawLine(0, 0, 19, 0);
	painter->drawLine(0, 0, 0, 19);
	painter->setPen(QPen(m_palette.mid().color()));
	painter->drawPoint(10, 10);
	painter->setPen(QPen(m_palette.highlight().color()));
	painter->drawPoint(0, 0);
}

void PixmapBuilder::drawHRule(QPainter *painter)
{
	painter->setPen(QPen(m_palette.midlight().color()));
	painter->drawLine(10, 14, 10, 19);
	painter->setPen(QPen(m_palette.dark().color()));
	painter->drawLine(0, 14, 19, 14);
	painter->drawLine(0, 14, 0, 19);
}

void PixmapBuilder::drawVRule(QPainter *painter)
{
	painter->setPen(QPen(m_palette.midlight().color()));
	painter->drawLine(14, 10, 19, 10);
	painter->setPen(QPen(m_palette.dark().color()));
	painter->drawLine(14, 0, 19, 0);
	painter->drawLine(14, 0, 14, 19);
}
