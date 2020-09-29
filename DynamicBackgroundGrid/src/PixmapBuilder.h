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

#ifndef PIXMAPBUILDER_H
#define PIXMAPBUILDER_H

#include <QQuickImageProvider>

class PixmapBuilder : public QQuickImageProvider
{
public:
	enum PixmapType : int {
		PT_Dotted = 0,
		PT_Crossed,
		PT_Boxed,
		PT_Fancy
	};

	explicit PixmapBuilder();

	QPixmap requestPixmap(const QString &id, QSize *size,
						  const QSize &requestedSize) override;

private:
	void drawDottedGrid(QPainter *painter, const QColor &color);
	void drawCrossedGrid(QPainter *painter, const QColor &color, int width);
	void drawBoxedGrid(QPainter *painter, const QColor &color, int width);
	void drawFancyGrid(QPainter *painter, const QColor &color, int width);
};

#endif // PIXMAPBUILDER_H
