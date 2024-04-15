#ifndef SERIESCONTROLLER_H
#define SERIESCONTROLLER_H

#include "Delegates/seriesdelegate.h"

class SeriesController
{
public:
    SeriesController();

    QList<SeriesDTO*> searchAllSeries(const QString& searchString);
    QList<SeriesDTO*> searchAllSeries(const QList<int> ids);

    SerieInfoDTO* searchOneSerieById(int id);

private:
    SeriesDelegate _seriesDelegate;
};

#endif // SERIESCONTROLLER_H
