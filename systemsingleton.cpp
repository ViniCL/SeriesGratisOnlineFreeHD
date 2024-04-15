#include "systemsingleton.h"

#include "Controllers/seriescontroller.h"

SystemSingleton* SystemSingleton::instance = nullptr;

SystemSingleton::SystemSingleton(QObject *parent) :
    QObject(parent),
    _seriesEmAlta({})
{

    QList<int> seriesIds = {
        seriesEmAltaIdEnum::TheOffice,
        seriesEmAltaIdEnum::BreakingBad,
        seriesEmAltaIdEnum::TheBigBangTheory,
        seriesEmAltaIdEnum::TheWalkingDead,
        seriesEmAltaIdEnum::StrangerThings,
        seriesEmAltaIdEnum::Loki,
        seriesEmAltaIdEnum::GameOfThrones,
        seriesEmAltaIdEnum::TheLastOfUs,
        seriesEmAltaIdEnum::HouseOfDragons,
        seriesEmAltaIdEnum::TheBoys
    };

    setSeriesEmAlta(SeriesController().searchAllSeries(seriesIds));
}

QList<SeriesDTO*> SystemSingleton::seriesEmAlta() const
{
    QList<SeriesDTO*> copySeriesEmAlta;

    for (SeriesDTO* serie : _seriesEmAlta)
    {
        SeriesDTO* copiedSerie = new SeriesDTO(*serie);
        copySeriesEmAlta.append(copiedSerie);
    }

    return copySeriesEmAlta;

}

void SystemSingleton::setSeriesEmAlta(const QList<SeriesDTO*> &seriesEmAlta)
{
    _seriesEmAlta = seriesEmAlta;
}

SystemSingleton* SystemSingleton::getInstance()
{
    if (!instance) {
        instance = new SystemSingleton();
    }
    return instance;
}
