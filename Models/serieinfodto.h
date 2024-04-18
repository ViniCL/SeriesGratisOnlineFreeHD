#ifndef SERIEINFODTO_H
#define SERIEINFODTO_H

#include "seriestubresponse.h"

#include <QString>

class SerieInfoDTO
{
    Q_GADGET
    Q_PROPERTY(QString summary READ summary WRITE setSummary )
    Q_PROPERTY(QStringList genres READ genres WRITE setGenres)

public:
    SerieInfoDTO();

    void fillFromSerieStub(const SerieStubResponse& serieStub);

    QString summary() const;
    void setSummary(const QString& summary);

    QStringList genres() const;
    void setGenres(const QStringList& genres);

private:
    QString _summary;
    QStringList _genres;
};

#endif // SERIEINFODTO_H
