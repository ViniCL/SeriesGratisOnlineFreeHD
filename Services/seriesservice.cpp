#include "seriesservice.h"

SeriesService::SeriesService() {}

QList<SeriesDTO*> SeriesService::searchAllSeries(const QString& searchString) {
    QList<SeriesDTO*> seriesList;

    QList<SerieStubResponse*> seriesStubList = _seriesIntegration.searchAllSeries(searchString);

    for (SerieStubResponse* serieStub : seriesStubList) {
        SeriesDTO* seriesDTO = new SeriesDTO();
        seriesDTO->fillFromSerieStub(*serieStub);
        seriesList.append(seriesDTO);
    }

    qDeleteAll(seriesStubList);

    return seriesList;
}

QList<SeriesDTO*> SeriesService::searchAllSeries(const QList<int> idList) {
    QList<SeriesDTO*> seriesList;

    for (int id : idList) {
        SeriesDTO* seriesDTO = new SeriesDTO();
        seriesDTO->fillFromSerieStub(*_seriesIntegration.searchOneSerieById(id));
        seriesList.append(seriesDTO);
    }

    return seriesList;
}

SerieInfoDTO* SeriesService::searchOneSerieById(int id) {
    SerieInfoDTO* serieInfo = nullptr;

    SerieStubResponse* serieStub = _seriesIntegration.searchOneSerieById(id);

    if (serieStub != nullptr) {
        serieInfo = new SerieInfoDTO();
        serieInfo->fillFromSerieStub(*serieStub);
    }

    delete serieStub;

    return serieInfo;
}
