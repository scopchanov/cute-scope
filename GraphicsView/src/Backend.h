#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>

class QStandardItemModel;
class QStandardItem;

class Backend : public QObject
{
	Q_OBJECT
	Q_PROPERTY(QStandardItemModel *model READ model NOTIFY modelChanged)
public:
	explicit Backend(QObject *parent = nullptr);

	QStandardItemModel *model() const;

private:
	QStandardItem *createItem(const QString &name, const QSize &size,
							  const QPointF &position);

	QStandardItemModel *m_model;

signals:
	void modelChanged();
};

#endif // BACKEND_H
