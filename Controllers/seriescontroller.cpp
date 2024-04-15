#include "seriescontroller.h"

SeriesController::SeriesController() {}

QList<SeriesDTO*> SeriesController::searchAllSeries(const QString &searchString)
{
   return _seriesDelegate.searchAllSeries(searchString);
}

QList<SeriesDTO*> SeriesController::searchAllSeries(const QList<int> ids)
{
    return _seriesDelegate.searchAllSeries(ids);
}

SerieInfoDTO *SeriesController::searchOneSerieById(int id)
{
    return _seriesDelegate.searchOneSerieById(id);
}

