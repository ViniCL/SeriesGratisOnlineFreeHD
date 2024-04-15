#include "serieinfodto.h"

SerieInfoDTO::SerieInfoDTO() :
    _dsName(""),
    _image(QUrl()),
    _rating(0.0),
    _summary(""),
    _genres(QStringList())
{}

void SerieInfoDTO::fillFromSerieStub(const SerieStubResponse& serieStub) {
    setName(serieStub.name());
    setImage(serieStub.imageUrl());
    setRating(serieStub.ratingAverage());
    setSummary(serieStub.summary());
    setGenres(serieStub.genres());
}

QString SerieInfoDTO::name() const {
    return _dsName;
}

void SerieInfoDTO::setName(const QString& name) {
    _dsName = name;
}

QUrl SerieInfoDTO::image() const {
    return _image;
}

void SerieInfoDTO::setImage(const QUrl& image) {
    _image = image;
}

double SerieInfoDTO::rating() const {
    return _rating;
}

void SerieInfoDTO::setRating(double rating) {
    _rating = rating;
}

QString SerieInfoDTO::summary() const {
    return _summary;
}

void SerieInfoDTO::setSummary(const QString& summary) {
    _summary = summary;
}

QStringList SerieInfoDTO::genres() const {
    return _genres;
}

void SerieInfoDTO::setGenres(const QStringList& genres) {
    _genres = genres;
}
