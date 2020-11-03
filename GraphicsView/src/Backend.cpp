#include "Backend.h"
#include <QStandardItemModel>

Backend::Backend(QObject *parent) :
	QObject(parent),
	m_model(new QStandardItemModel(this))
{
	m_model->appendRow(createItem(tr("Foo"), QSize(120, 90), QPointF(100, 140)));
	m_model->appendRow(createItem(tr("Bar"), QSize(80, 70), QPointF(360, 230)));
	m_model->appendRow(createItem(tr("Baz"), QSize(60, 110), QPointF(260, 260)));
}

QStandardItemModel *Backend::model() const
{
	return m_model;
}

QStandardItem *Backend::createItem(const QString &name, const QSize &size,
								   const QPointF &position)
{
	auto *item = new QStandardItem(name);

	item->setSizeHint(size);
	item->setData(position, Qt::UserRole);

	return item;
}
