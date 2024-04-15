#include "mainwindowcontrol.h"

#include "systemsingleton.h"

MainWindowControl::MainWindowControl(){}

MainWindowControl::~MainWindowControl(){}

QVariant MainWindowControl::doSearchAllSeries( const QString& dsPesquisa ) {

    qInfo() << "MainWindowControl::doSearchAllSeries [DS_PESQUISA]" << dsPesquisa;

    if(!dsPesquisa.length()){
        return QVariant::fromValue(SystemSingleton::getInstance()->seriesEmAlta());
    }

    QList<SeriesDTO*> seriesList = {};

    seriesList = _seriesController.searchAllSeries(dsPesquisa);

    return QVariant::fromValue( seriesList );
}

SerieInfoDTO MainWindowControl::searchOneSerieById(int id)
{
    qInfo() << "MainWindowControl::searchOneSerieById [ID]" << id;

    SerieInfoDTO* serieInfo;

    serieInfo = _seriesController.searchOneSerieById(id);

    return *serieInfo;
}

