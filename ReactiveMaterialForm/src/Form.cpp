#include "Form.h"

Form::Form(QQuickItem *parent) :
	QQuickItem(parent),
	m_valid(false),
	m_invalid(false),
	m_pristine(true),
	m_dirty(false),
	m_submitted(false)
{

}

bool Form::valid() const
{
	return m_valid;
}

bool Form::invalid() const
{
	return m_invalid;
}

bool Form::pristine() const
{
	return m_pristine;
}

bool Form::dirty() const
{
	return m_dirty;
}

bool Form::submitted() const
{
	return m_submitted;
}
