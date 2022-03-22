#include <QGuiApplication>
#include <QQmlApplicationEngine>
//#include <QQmlContext>
#include <startup.h>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    Startup my_startup;
    return app.exec();
}
