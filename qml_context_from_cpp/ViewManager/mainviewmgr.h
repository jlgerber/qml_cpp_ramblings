#ifndef MAINVIEWMGR_H
#define MAINVIEWMGR_H

#include <QObject>
#include <QString>

class MainViewMgr : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString appName READ appName CONSTANT)
public:
    explicit MainViewMgr(QObject *parent = nullptr);
    QString appName() const {return m_appName;}

private:
    QString m_appName;
    explicit MainViewMgr(const MainViewMgr& rhs) = delete;
    MainViewMgr& operator=(const MainViewMgr& rhs) = delete;
signals:

};

#endif // MAINVIEWMGR_H
