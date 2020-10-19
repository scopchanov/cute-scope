#ifndef FORM_H
#define FORM_H

#include <QQuickItem>
#include <QJsonObject>

//	valid: This property returns true if the element’s contents are valid and false otherwise.
//	invalid: This property returns true if the element’s contents are invalid and false otherwise.

//	pristine: This property returns true if the element’s contents have not been changed.

//	dirty: This property returns true if the element’s contents have been changed.
//	untouched: This property returns true if the user has not visited the element.
//	touched: This property returns true if the user has visited the element.

// @property {boolean} $untouched True if control has not lost focus yet.
// @property {boolean} $touched True if control has lost focus.
// @property {boolean} $pristine True if user has not interacted with the control yet.
// @property {boolean} $dirty True if user has already interacted with the control.

// The form content is valid
// The form content is not valid
// No fields have been modified yet
// One or more have been modified
// The form is submitted

class FormPrivate;

class Form : public QQuickItem
{
	Q_OBJECT
	Q_PROPERTY(bool valid READ valid NOTIFY validChanged)
	Q_PROPERTY(bool pristine READ pristine NOTIFY pristineChanged)
	Q_PROPERTY(bool submitted READ submitted NOTIFY submittedChanged)
	Q_PROPERTY(QJsonObject value READ value WRITE setValue NOTIFY valueChanged)
	Q_PROPERTY(qreal spacing READ spacing WRITE setSpacing NOTIFY spacingChanged)
	QML_ELEMENT
public:
	explicit Form(QQuickItem *parent = nullptr);

	bool valid() const;
	bool pristine() const;
	bool submitted() const;
	QJsonObject value() const;
	void setValue(const QJsonObject &json);

	qreal spacing() const;
	void setSpacing(qreal d);

public slots:
	void init(const QJsonObject &json);
	void reset();
	void submit();

protected:
	void mousePressEvent(QMouseEvent *event) override;
	void itemChange(ItemChange change, const ItemChangeData &value) override;

private:
	FormPrivate *m_ptr;

private slots:
	void checkPristine();
	void checkValid();
	void onImplicitWidthChanged();
	void onImplicitHeightChanged();

signals:
	void validChanged();
	void pristineChanged();
	void submittedChanged();
	void valueChanged();
	void spacingChanged();
};

#endif // FORM_H
