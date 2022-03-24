#ifndef MAINVIEWMGR_H
#define MAINVIEWMGR_H

#include <QObject>
#include <QString>
#include "PropertyHelper.h"

class MainViewMgr : public QObject
{
    Q_OBJECT
    READONLY_PROPERTY(QString, appName)
    AUTO_PROPERTY(bool, powerOn)
public:
    explicit MainViewMgr(QObject *parent = nullptr);
    //QString appName() const {return m_appName;}

private:
    QString m_appName;
    explicit MainViewMgr(const MainViewMgr& rhs) = delete;
    MainViewMgr& operator=(const MainViewMgr& rhs) = delete;
private slots:
    void debugPowerOn(bool value);
signals:

};

#endif // MAINVIEWMGR_H
