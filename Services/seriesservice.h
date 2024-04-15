#ifndef SERIESSERVICE_H
#define SERIESSERVICE_H

#include "Integrations/seriesintegration.h"
#include "Models/seriesdto.h"
#include "Models/serieinfodto.h"

class SeriesService
{
public:
    SeriesService();

    QList<SeriesDTO*> searchAllSeries(const QString& searchString);
    QList<SeriesDTO*> searchAllSeries(const QList<int> ids);

    SerieInfoDTO* searchOneSerieById(int id);

private:
    SeriesIntegration _seriesIntegration;
};

#endif // SERIESSERVICE_H
