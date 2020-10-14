#ifndef FORM_H
#define FORM_H

#include <QQuickItem>

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

class Form : public QQuickItem
{
	Q_OBJECT
	// The form content is valid
	Q_PROPERTY(type valid READ valid NOTIFY validChanged)
	// The form content is not valid
	Q_PROPERTY(type invalid READ invalid NOTIFY invalidChanged)
	// No fields have been modified yet
	Q_PROPERTY(type pristine READ pristine NOTIFY pristineChanged)
	// One or more have been modified
	Q_PROPERTY(type dirty READ dirty NOTIFY dirtyChanged)
	// The form is submitted
	Q_PROPERTY(type submitted READ submitted NOTIFY submittedChanged)
	QML_ELEMENT
public:
	explicit Form(QQuickItem *parent = nullptr);

	bool valid() const;
	bool invalid() const;
	bool pristine() const;
	bool dirty() const;
	bool submitted() const;

private:
	bool m_valid;
	bool m_invalid;
	bool m_pristine;
	bool m_dirty;
	bool m_submitted;

signals:
	void validChanged();
	void invalidChanged();
	void pristineChanged();
	void dirtyChanged();
	void submittedChanged();
};

#endif // FORM_H
