#include "seriesintegration.h"

SeriesIntegration::SeriesIntegration() {}

QList<SerieStubResponse*> SeriesIntegration::searchAllSeries(const QString& searchTerm) {
    QList<SerieStubResponse*> seriesList;

    QUrl APIUrl("https://api.tvmaze.com/search/shows?q=" + searchTerm);

    QJsonDocument jsonDocument = getConnection(APIUrl);

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

    return seriesList;
}

SerieStubResponse* SeriesIntegration::searchOneSerieById(int id) {
    SerieStubResponse* serieResponse = nullptr;

    QUrl APIUrl(QString("https://api.tvmaze.com/shows/%1").arg(id));

    QJsonDocument jsonDocument = getConnection(APIUrl);

    if (!jsonDocument.isNull()) {
        QJsonObject showObject = jsonDocument.object();
        serieResponse = new SerieStubResponse();
        serieResponse->parseJson(showObject);
    }

    return serieResponse;
}

QJsonDocument SeriesIntegration::getConnection(QUrl url)
{
    QNetworkRequest request(url);
    QJsonDocument jsonDocument;

    QNetworkReply* reply = _manager.get(request);

    QEventLoop loop;
    QObject::connect(reply, &QNetworkReply::finished, &loop, &QEventLoop::quit);
    loop.exec();

    if (reply->error() != QNetworkReply::NoError) {
        qDebug() << "Erro : " << reply->errorString();
        return jsonDocument;
    }

    QByteArray response = reply->readAll();
    jsonDocument = QJsonDocument::fromJson(response);

    delete reply;

    return jsonDocument;
}
