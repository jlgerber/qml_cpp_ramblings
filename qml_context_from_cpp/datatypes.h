#ifndef DATATYPES_H
#define DATATYPES_H

#include <QObject>

class DataTypes : public QObject
{
    Q_OBJECT
explicit DataTypes(const DataTypes& rhs) = delete;
DataTypes& operator=(const DataTypes& rhs) = delete;

public:
    explicit DataTypes(QObject *parent = nullptr);
    void logVariantList(QObject* root);
    void logVariantMap(QObject* root);

signals:


};

#endif // DATATYPES_H
