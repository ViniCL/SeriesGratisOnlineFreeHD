#ifndef SERIESDELEGATE_H
#define SERIESDELEGATE_H

#include "Services/seriesservice.h"

class SeriesDelegate
{
public:
    SeriesDelegate();

    QList<SeriesDTO*> searchAllSeries(const QString& searchString);
    QList<SeriesDTO*> searchAllSeries(const QList<int> ids);

    SerieInfoDTO* searchOneSerieById(int id);

private:
    SeriesService _seriesService;
};

#endif // SERIESDELEGATE_H
