#include "message.h"


Message::Message(QObject *parent)
    : QObject{parent},
      m_counter(0),
      m_message("startup Message")
{

}

void Message::doMessageChange()
{
    setMessage("Hello Property World %1");
}

void Message::setMessage(QString value) {
    m_message = value.arg(++m_counter);
    emit messageChanged();
}
