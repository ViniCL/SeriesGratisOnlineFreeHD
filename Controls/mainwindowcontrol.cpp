#include "mainwindowcontrol.h"

#include "systemsingleton.h"

MainWindowControl::MainWindowControl() :
    _allSeriesList({}),
    _lastIndexRetrieved(0){}

MainWindowControl::~MainWindowControl(){}

QList<SeriesDTO*> MainWindowControl::getListaSeriesCortada(int page)
{
    const int pageSize = 6;
    QList<SeriesDTO*> seriesList;

    int startIndex = pageSize * page;

    qInfo() << "MainWindowControl::getListaSeriesCortada [PAGE]" << page << "[ALL_SERIES_LIST]" << _allSeriesList.size()
            << "[START_INDEX]" << startIndex << "[LAST_INDEX_RETRIEVED]" << _lastIndexRetrieved;


    if(startIndex >= _allSeriesList.size() || startIndex < _lastIndexRetrieved ){
        qInfo() << "MainWindowControl::getListaSeriesCortada Sem retornos";
        return seriesList;
    }

    for(int i = startIndex; i < _allSeriesList.size() && i < (startIndex + pageSize); i++)
    {

        seriesList.append(_allSeriesList[i]);
        _lastIndexRetrieved = i;
    }

    qInfo() << "MainWindowControl::getListaSeriesCortada [SERIES_LIST_SIZE]" << seriesList.size();

    return seriesList;
}

void MainWindowControl::doSearchAllSeries( const QString& dsPesquisa ) {

    qInfo() << "MainWindowControl::doSearchAllSeries [DS_PESQUISA]" << dsPesquisa;

    if(!dsPesquisa.length()){
        _allSeriesList = SystemSingleton::getInstance()->seriesEmAlta();
        qInfo() << "MainWindowControl::doSearchAllSeries [EM_ALTA]" << _allSeriesList.size();;
        return;
    }

    _allSeriesList = _seriesController.searchAllSeries(dsPesquisa);

    qInfo() << "MainWindowControl::doSearchAllSeries [ALL_SERIES_LIST]" << _allSeriesList.size();;


}

SerieInfoDTO MainWindowControl::searchOneSerieById(int id)
{
    qInfo() << "MainWindowControl::searchOneSerieById [ID]" << id;

    SerieInfoDTO* serieInfo;

    serieInfo = _seriesController.searchOneSerieById(id);

    return *serieInfo;
}

void MainWindowControl::resetLastIndexRetrieved()
{
    _lastIndexRetrieved = 0;
}

