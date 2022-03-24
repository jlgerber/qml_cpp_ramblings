#include "mainviewmgr.h"
#include <iostream>
using std::cout;
using std::endl;


MainViewMgr::MainViewMgr(QObject *parent)
    : QObject{parent}
{
    appName("Radar Target Simulator");
    powerOn(false);
    // this is just for debugging purposes. Proving that the AUTO_PROPERTY works
    // as advertised.
    connect(this, &MainViewMgr::powerOnChanged,
            &MainViewMgr::debugPowerOn);
}

void MainViewMgr::debugPowerOn(bool value) {
    cout << "In debugPowerOn with value"<< value << endl;

}
