#include "seriestubresponse.h"

#include <QJsonArray>

SerieStubResponse::SerieStubResponse(const QJsonObject& json) {
    parseJson(json);
}

int SerieStubResponse::id() const {
    return _id;
}

void SerieStubResponse::setId(int id) {
    _id = id;
}

QString SerieStubResponse::name() const {
    return _name;
}

void SerieStubResponse::setName(const QString& name) {
    _name = name;
}

QString SerieStubResponse::type() const {
    return _type;
}

void SerieStubResponse::setType(const QString& type) {
    _type = type;
}

QString SerieStubResponse::language() const {
    return _language;
}

void SerieStubResponse::setLanguage(const QString& language) {
    _language = language;
}

QString SerieStubResponse::status() const {
    return _status;
}

void SerieStubResponse::setStatus(const QString& status) {
    _status = status;
}

QString SerieStubResponse::premiered() const {
    return _premiered;
}

void SerieStubResponse::setPremiered(const QString& premiered) {
    _premiered = premiered;
}

QString SerieStubResponse::ended() const {
    return _ended;
}

void SerieStubResponse::setEnded(const QString& ended) {
    _ended = ended;
}

QString SerieStubResponse::officialSite() const {
    return _officialSite;
}

void SerieStubResponse::setOfficialSite(const QString& officialSite) {
    _officialSite = officialSite;
}

QString SerieStubResponse::summary() const {
    return _summary;
}

void SerieStubResponse::setSummary(const QString& summary) {
    _summary = summary;
}

double SerieStubResponse::ratingAverage() const {
    return _ratingAverage;
}

void SerieStubResponse::setRatingAverage(double ratingAverage) {
    _ratingAverage = ratingAverage;
}

int SerieStubResponse::runtime() const {
    return _runtime;
}

void SerieStubResponse::setRuntime(int runtime) {
    _runtime = runtime;
}

QUrl SerieStubResponse::imageUrl() const {
    return _imageUrl;
}

void SerieStubResponse::setImageUrl(const QUrl& imageUrl) {
    _imageUrl = imageUrl;
}

QUrl SerieStubResponse::imagePortraitUrl() const
{
    return _imagePortraitUrl;
}

void SerieStubResponse::setImagePortraitUrl(const QUrl &imagePortraitUrl)
{
    _imagePortraitUrl = imagePortraitUrl;
}

QList<QString> SerieStubResponse::genres() const
{
    return _genres;
}

void SerieStubResponse::setGenres(const QList<QString> &genres)
{
    _genres = genres;
}

void SerieStubResponse::parseJson(const QJsonObject& json) {
    setId(json["id"].toInt());
    setName(json["name"].toString());
    setType(json["type"].toString());
    setLanguage(json["language"].toString());
    setStatus(json["status"].toString());
    setPremiered(json["premiered"].toString());
    setEnded(json["ended"].toString());
    setOfficialSite(json["officialSite"].toString());
    setSummary(json["summary"].toString());
    setRatingAverage(json["rating"].toObject()["average"].toDouble());
    setRuntime(json["runtime"].toInt());
    setImageUrl(QUrl(json["image"].toObject()["original"].toString()));
    setImagePortraitUrl(QUrl(json["image"].toObject()["medium"].toString()));

    QJsonArray genresArray = json["genres"].toArray();
    QList<QString> genresList;
    for (const QJsonValue &value : genresArray) {
        genresList.append(value.toString());
    }
    setGenres(genresList);

}
