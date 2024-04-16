#include "seriesdto.h"

SeriesDTO::SeriesDTO() :
    _id(0),
    _rating(0.0),
    _dsName(""),
    _image(QUrl()){}

void SeriesDTO::fillFromSerieStub(const SerieStubResponse& serieStub) {
    setId(serieStub.id());
    setDsName(serieStub.name());
    setImage(serieStub.imagePortraitUrl());
    setRating(serieStub.ratingAverage());
}

QString SeriesDTO::dsName() const {
    return _dsName;
}

void SeriesDTO::setDsName(const QString& name) {
    _dsName = name;
}

QUrl SeriesDTO::image() const {
    return _image;
}

void SeriesDTO::setImage(const QUrl& image) {
    _image = image;
}

double SeriesDTO::rating() const {
    return _rating;
}

void SeriesDTO::setRating(double rating) {
    _rating = rating;
}

int SeriesDTO::id() const
{
    return _id;
}

void SeriesDTO::setId(int id)
{
    _id = id;
}
