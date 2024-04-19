#include "registertype.h"

#include <QQmlApplicationEngine>

#include "Controls/mainwindowcontrol.h"
#include "Models/seriesabstractmodel.h"
#include "Models/serieinfodto.h"

void RegisterType::registerQml()
{

    qmlRegisterType<MainWindowControl>("MainWindowControl",1,0,"MainWindowControl");
    qmlRegisterType<SeriesAbstractModel>("SeriesAbstractModel",1,0,"SeriesAbstractModel");
    qmlRegisterType<SerieInfoDTO>("SerieInfoDTO", 1, 0, "serieInfoDTO");

}

