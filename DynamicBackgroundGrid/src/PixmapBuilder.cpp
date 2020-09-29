/**
MIT License

Copyright (c) 2020 Michael Scopchanov

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

#include "PixmapBuilder.h"
#include <QPainter>
#include <QDebug>

PixmapBuilder::PixmapBuilder() :
	QQuickImageProvider(QQuickImageProvider::Pixmap)
{
}

QPixmap PixmapBuilder::requestPixmap(const QString &id, QSize *size,
									 const QSize &requestedSize)
{
	int width = 16;
	int height = 16;

	if (size)
		*size = QSize(width, height);

	const QStringList &img(id.split('_'));
	const QColor &color(fromHslStringF(img.last()));
	QPixmap pixmap(requestedSize.width() > 0 ? requestedSize.width() : width,
				   requestedSize.height() > 0 ? requestedSize.height() : height);
	QPainter painter;
	QHash<QString, int> hash;
	int pixmapWidth = pixmap.width() - 1;

	pixmap.fill(Qt::transparent);

	painter.begin(&pixmap);

	hash.insert("dotted", PT_Dotted);
	hash.insert("crossed", PT_Crossed);
	hash.insert("boxed", PT_Boxed);
	hash.insert("fancy", PT_Fancy);

	switch (hash.value(img.first().toLower())) {
	case PT_Dotted:
		drawDottedGrid(&painter, color);
		break;
	case PT_Crossed:
		drawCrossedGrid(&painter, color, pixmapWidth);
		break;
	case PT_Boxed:
		drawBoxedGrid(&painter, color, pixmapWidth);
		break;
	case PT_Fancy:
		drawFancyGrid(&painter, color, pixmapWidth);
		break;
	}

	return pixmap;
}

QColor PixmapBuilder::fromHslStringF(const QString &str)
{
	const QStringList &components(str.split(','));

	return QColor::fromHslF(components.at(0).toDouble(),
							components.at(1).toDouble(),
							components.at(2).toDouble());
}

void PixmapBuilder::drawDottedGrid(QPainter *painter, const QColor &color)
{
	painter->setPen(color.darker(160));
	painter->drawPoint(0, 0);
}

void PixmapBuilder::drawCrossedGrid(QPainter *painter, const QColor &color,
									int width)
{
	painter->setPen(color);
	painter->drawLine(0, 0, 0.25*width, 0);
	painter->drawLine(0, 0, 0, 0.25*width);
	painter->drawLine(0, 0.75*width + 2, 0, width);
	painter->drawLine(0.75*width + 2, 0, width, 0);
}

void PixmapBuilder::drawBoxedGrid(QPainter *painter, const QColor &color,
								int width)
{
	painter->setPen(color);
	painter->drawLine(0, 0, width, 0);
	painter->drawLine(0, 0, 0, width);
}

void PixmapBuilder::drawFancyGrid(QPainter *painter, const QColor &color,
								  int width)
{
	int halfWidth = 0.5*width + 0.5;

	painter->setPen(color.lighter(106));
	painter->drawLine(0, halfWidth, width, halfWidth);
	painter->drawLine(halfWidth, 0, halfWidth, width);
	painter->setPen(color);
	painter->drawLine(0, 0, width, 0);
	painter->drawLine(0, 0, 0, width);
	painter->setPen(color.darker(118));
	painter->drawPoint(halfWidth, halfWidth);
	painter->setPen(color.darker(160));
	painter->drawPoint(0, 0);
}
