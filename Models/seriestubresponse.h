#ifndef SERIESTUBRESPONSE_H
#define SERIESTUBRESPONSE_H

#include <QJsonObject>
#include <QString>
#include <QUrl>

class SerieStubResponse {
public:
    SerieStubResponse(const QJsonObject& json = QJsonObject());

    void parseJson(const QJsonObject& json);

    int id() const;
    void setId(int id);

    QString name() const;
    void setName(const QString& name);

    QString type() const;
    void setType(const QString& type);

    QString language() const;
    void setLanguage(const QString& language);

    QString status() const;
    void setStatus(const QString& status);

    QString premiered() const;
    void setPremiered(const QString& premiered);

    QString ended() const;
    void setEnded(const QString& ended);

    QString officialSite() const;
    void setOfficialSite(const QString& officialSite);

    QString summary() const;
    void setSummary(const QString& summary);

    double ratingAverage() const;
    void setRatingAverage(double ratingAverage);

    int runtime() const;
    void setRuntime(int runtime);

    QUrl imageUrl() const;
    void setImageUrl(const QUrl& imageUrl);

    QUrl imagePortraitUrl() const;
    void setImagePortraitUrl(const QUrl& imagePortraitUrl);

    QList<QString> genres() const;
    void setGenres(const QList<QString> &newGenres);

private:
    int _id;
    QString _name;
    QString _type;
    QString _language;
    QString _status;
    QString _premiered;
    QString _ended;
    QString _officialSite;
    QString _summary;
    double _ratingAverage;
    int _runtime;
    QUrl _imageUrl;
    QUrl _imagePortraitUrl;
    QList<QString> _genres;

};

#endif // SERIESTUBRESPONSE_H
