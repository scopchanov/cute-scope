#ifndef FORMELEMENT_H
#define FORMELEMENT_H

#include <QQuickItem>
#include <QJsonValue>

class FormElementPrivate;

class FormElement : public QQuickItem
{
	Q_OBJECT
	Q_PROPERTY(bool valid READ valid WRITE setValid NOTIFY validChanged)
	Q_PROPERTY(bool pristine READ pristine NOTIFY pristineChanged)
	Q_PROPERTY(bool touched READ touched WRITE setTouched NOTIFY touchedChanged)
	Q_PROPERTY(QJsonValue value READ value WRITE setValue NOTIFY valueChanged)
	QML_ELEMENT
public:
	explicit FormElement(QQuickItem *parent = nullptr);

	bool valid() const;
	void setValid(bool b);
	bool pristine() const;
	bool touched() const;
	void setTouched(bool b);
	QJsonValue value() const;
	void setValue(const QJsonValue &val);

public slots:
	void init(const QJsonValue &val);
	void accept();
	void reject();
	void reset();
	void clear();

protected:
	void focusInEvent(QFocusEvent *event) override;
	void focusOutEvent(QFocusEvent *event) override;

private:
	FormElementPrivate *m_ptr;

signals:
	void validChanged();
	void invalidChanged();
	void pristineChanged();
	void touchedChanged();
	void valueChanged();
};

#endif // FORMELEMENT_H
