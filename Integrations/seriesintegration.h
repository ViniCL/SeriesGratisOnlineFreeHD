#ifndef SERIESINTEGRATION_H
#define SERIESINTEGRATION_H

#include <QtNetwork>
#include <QObject>
#include <QtCore>

#include "Models/seriestubresponse.h"

class SeriesIntegration
{
public:
    SeriesIntegration();

    QList<SerieStubResponse*> searchAllSeries(const QString& searchTerm);
    SerieStubResponse* searchOneSerieById(int id);

private:
     QNetworkAccessManager _manager;

     QJsonDocument getConnection(QUrl url);

};

#endif // SERIESINTEGRATION_H
