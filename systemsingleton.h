#ifndef SYSTEMSINGLETON_H
#define SYSTEMSINGLETON_H

#include <QObject>

#include "Models/seriesdto.h"

class SystemSingleton : public QObject
{
    Q_OBJECT
public:
    static SystemSingleton* getInstance();

    enum seriesEmAltaIdEnum : int {
        TheOffice = 526,
        BreakingBad = 169,
        TheBigBangTheory = 66,
        TheWalkingDead = 73,
        StrangerThings = 2993,
        Loki = 41007,
        GameOfThrones = 82,
        TheLastOfUs = 46562,
        HouseOfDragons = 44778,
        TheBoys = 15299
    };

    QList<SeriesDTO*> seriesEmAlta() const;

private:
    explicit SystemSingleton(QObject *parent = nullptr);
    void setSeriesEmAlta(const QList<SeriesDTO*> &seriesEmAlta);

    static SystemSingleton* instance;
    QList<SeriesDTO*> _seriesEmAlta;
};

#endif // SYSTEMSINGLETON_H
