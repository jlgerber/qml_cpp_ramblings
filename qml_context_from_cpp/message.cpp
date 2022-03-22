#include "message.h"
#include <QDebug>

Message::Message(QObject *parent)
    : QObject{parent},
      m_counter(0),
      m_status(Status::Initial),
      m_message("startup Message")
{

}

void Message::doMessageChange()
{
    setMessage("Hello Property World %1");
}

void Message::setMessage(QString value) {
    m_message = value.arg(++m_counter);
    m_status = m_counter < 4 ? Status::Initial : Status::Increasing;
    qDebug() << "status: " << m_status;
    emit messageChanged();
}

int Message::sendMessageFromCpp(const QString value) {
    qDebug() << "This is C++ Speaking. I heard QML say:" << value << " Oh and my status is "<< m_status;
    return m_counter;

}
