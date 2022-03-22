#include "datatypes.h"
#include <QColor>
#include <QVariantList>
#include <QVariantMap>
#include <QMetaObject>
#include <QDate>


DataTypes::DataTypes(QObject *parent)
    : QObject{parent}
{

}

void DataTypes::logVariantList(QObject *root)
{
    QColor kermit = Qt::green;
    QVariantList my_list;
    my_list << 3.1415 << 30 << kermit << "guitars";
    QMetaObject::invokeMethod(root,
                              "logArray",
                              Q_ARG(QVariant,
                                    QVariant::fromValue(my_list)));
}

void DataTypes::logVariantMap(QObject *root)
{
    QVariantMap my_map;
    my_map.insert("newLanguage", "C++ X20");
    my_map.insert("StdReleased", QDate(2011,8,12));
    my_map.insert("oldLanguage", "QML");
    my_map.insert("QMLreleased", QDate(2010,9,12));
    QMetaObject::invokeMethod(root,
                              "logMap",
                              Q_ARG(QVariant, QVariant::fromValue(my_map)));

}
