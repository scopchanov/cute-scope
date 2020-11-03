#ifndef PIXMAPBUILDER_H
#define PIXMAPBUILDER_H

#include <QQuickImageProvider>
#include <QPalette>

class PixmapBuilder : public QQuickImageProvider
{
public:
	enum PixmapType : int {
		PT_Grid = 0,
		PT_HRule,
		PT_VRule
	};

	explicit PixmapBuilder();

	QPalette palette() const;
	void setPalette(const QPalette &p);

	QPixmap requestPixmap(const QString &id, QSize *size, const QSize &requestedSize) override;

private:
	void drawGrid(QPainter *painter);
	void drawHRule(QPainter *painter);
	void drawVRule(QPainter *painter);

	QPalette m_palette;
};

#endif // PIXMAPBUILDER_H
