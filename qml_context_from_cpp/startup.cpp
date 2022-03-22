#include "startup.h"
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "ViewManager/mainviewmgr.h"


Startup::Startup(QObject *parent)
    : QObject{parent},
      m_engine(*new QQmlApplicationEngine()),
      m_mainViewMgr(*new MainViewMgr())
{
    auto root_context = m_engine.rootContext();
    root_context->setContextProperty("MainViewMgr", &m_mainViewMgr);

    const QUrl url(u"qrc:/qml_context_from_cpp/main.qml"_qs);
    m_engine.load(url);

}
