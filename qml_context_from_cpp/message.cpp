#include "message.h"


Message::Message(QObject *parent)
    : QObject{parent},
      m_counter(0),
      m_message("hello New World %1")
{

}

void Message::doMessageChange()
{
    //cout << " We are in C++. Yes" << endl;
    emit messageChanged(m_message.arg(++m_counter));
}
