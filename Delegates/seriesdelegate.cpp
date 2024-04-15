#include "seriesdelegate.h"

SeriesDelegate::SeriesDelegate() {}

QList<SeriesDTO*> SeriesDelegate::searchAllSeries(const QString &searchString)
{
    return _seriesService.searchAllSeries(searchString);
}

QList<SeriesDTO*> SeriesDelegate::searchAllSeries(const QList<int> ids)
{
    return _seriesService.searchAllSeries(ids);
}

SerieInfoDTO *SeriesDelegate::searchOneSerieById(int id)
{
    return _seriesService.searchOneSerieById(id);
}

