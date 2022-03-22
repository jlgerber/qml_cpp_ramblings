#ifndef MESSAGE_H
#define MESSAGE_H

#include <QObject>
#include <QString>

class Message : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString message READ message WRITE setMessage NOTIFY messageChanged)
    Q_ENUMS(Status)
    Q_PROPERTY(Status status READ status CONSTANT)
public:
    explicit Message(QObject *parent = nullptr);
    QString message() const { return m_message;}
    enum Status {Initial, Increasing};
    Status status() const {return m_status;}

public slots:
    void doMessageChange();
    void setMessage(QString value);
    Q_INVOKABLE int sendMessageFromCpp(const QString value);
signals:
    void messageChanged();
private:
    int m_counter;
    QString m_message;
    Status m_status;
};

#endif // MESSAGE_H
