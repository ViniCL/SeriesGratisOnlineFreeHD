#ifndef SERIEINFODTO_H
#define SERIEINFODTO_H

#include "seriestubresponse.h"

#include <QString>
#include <QUrl>
#include <QList>

class SerieInfoDTO
{
    Q_GADGET
    Q_PROPERTY(QString name READ name WRITE setName )
    Q_PROPERTY(QUrl image READ image WRITE setImage)
    Q_PROPERTY(double rating READ rating WRITE setRating )
    Q_PROPERTY(QString summary READ summary WRITE setSummary )
    Q_PROPERTY(QStringList genres READ genres WRITE setGenres)

public:
    SerieInfoDTO();

    void fillFromSerieStub(const SerieStubResponse& serieStub);

    QString name() const;
    void setName(const QString& name);

    QUrl image() const;
    void setImage(const QUrl& image);

    double rating() const;
    void setRating(double rating);

    QString summary() const;
    void setSummary(const QString& summary);

    QStringList genres() const;
    void setGenres(const QStringList& genres);


private:
    double _rating;
    QUrl _image;
    QString _dsName;
    QString _summary;
    QStringList _genres;
};

#endif // SERIEINFODTO_H
