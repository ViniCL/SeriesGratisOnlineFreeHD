#include "serieinfodto.h"

SerieInfoDTO::SerieInfoDTO() :
    _summary(""),
    _genres(QStringList())
{}

void SerieInfoDTO::fillFromSerieStub(const SerieStubResponse& serieStub) {
    setSummary(serieStub.summary());
    setGenres(serieStub.genres());
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
