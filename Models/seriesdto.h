#ifndef SERIESDTO_H
#define SERIESDTO_H

#include "seriestubresponse.h"

class SeriesDTO
{
public:
    SeriesDTO();

    void fillFromSerieStub(const SerieStubResponse& serieStub);

    int id() const;
    void setId(int id);

    QString dsName() const;
    void setDsName(const QString& name);

    QUrl image() const;
    void setImage(const QUrl& image);

    double rating() const;
    void setRating(double rating);


private:
    int _id;
    double _rating;
    QString _dsName;
    QUrl _image;
};

#endif // SERIESDTO_H
