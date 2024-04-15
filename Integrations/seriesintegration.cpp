#include "seriesintegration.h"

SeriesIntegration::SeriesIntegration() {}

QList<SerieStubResponse*> SeriesIntegration::searchAllSeries(const QString& searchTerm) {
    QList<SerieStubResponse*> seriesList;

    QUrl APIUrl("https://api.tvmaze.com/search/shows?q=" + searchTerm);

    QNetworkRequest request(APIUrl);

    QNetworkReply* reply = _manager.get(request);

    QEventLoop loop;
    QObject::connect(reply, &QNetworkReply::finished, &loop, &QEventLoop::quit);
    loop.exec();

    if (reply->error() == QNetworkReply::NoError) {
        QByteArray response = reply->readAll();
        QJsonDocument jsonDocument = QJsonDocument::fromJson(response);

        if (!jsonDocument.isNull()) {
            QJsonArray jsonArray = jsonDocument.array();
            for (const QJsonValue &value : jsonArray) {
                QJsonObject jsonObj = value.toObject();
                QJsonObject showObject = jsonObj["show"].toObject();
                SerieStubResponse *serieResponse = new SerieStubResponse();
                serieResponse->parseJson(showObject);
                seriesList.append(serieResponse);
            }
        }
    } else {
        qDebug() << "Erro : " << reply->errorString();
    }

    reply->deleteLater();

    return seriesList;
}

SerieStubResponse* SeriesIntegration::searchOneSerieById(int id) {
    SerieStubResponse* serieResponse = nullptr;

    QString urlString = QString("https://api.tvmaze.com/shows/%1").arg(id);

    QUrl APIUrl(urlString);
    QNetworkRequest request(APIUrl);

    QNetworkReply* reply = _manager.get(request);

    QEventLoop loop;
    QObject::connect(reply, &QNetworkReply::finished, &loop, &QEventLoop::quit);
    loop.exec();

    if (reply->error() == QNetworkReply::NoError) {
        QByteArray response = reply->readAll();
        QJsonDocument jsonDocument = QJsonDocument::fromJson(response);

        if (!jsonDocument.isNull()) {
            QJsonObject showObject = jsonDocument.object();
            serieResponse = new SerieStubResponse();
            serieResponse->parseJson(showObject);
        }
    } else {
        qDebug() << "Erro : " << reply->errorString();
    }

    reply->deleteLater();

    return serieResponse;
}
