#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "message.h"
#include <QDebug>


void TestInvoke(QObject * rootObject) {
    QVariant return_value;
    QVariant msg = "Thisis a c++ parameter";
    QMetaObject::invokeMethod(rootObject,
                              "javaScriptFunction",
                              Q_RETURN_ARG(QVariant, return_value),
                              Q_ARG(QVariant, msg)
                              );
    qDebug() << "QML returned " << return_value;


}
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/qml_context_from_cpp/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    Message my_msg;
    auto root_context = engine.rootContext();
    root_context->setContextProperty("messageClass", &my_msg);

    engine.load(url);

    // calling qml from cpp
    auto root_object = engine.rootObjects().first();
    TestInvoke(root_object);
    return app.exec();
}
