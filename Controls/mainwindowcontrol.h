#ifndef MAINWINDOWCONTROL_H
#define MAINWINDOWCONTROL_H

#include <QObject>

#include "Controllers/seriescontroller.h"

class MainWindowControl : public QObject
{
    Q_OBJECT
public:
    MainWindowControl();
    ~MainWindowControl();

    Q_INVOKABLE  QList<SeriesDTO*> getListaSeriesCortada(int page);
    Q_INVOKABLE void doSearchAllSeries( const QString& dsPesquisa );
    Q_INVOKABLE SerieInfoDTO searchOneSerieById(int id);
    Q_INVOKABLE void resetLastIndexRetrieved();

private:
    QList<SeriesDTO*> _allSeriesList;
    SeriesController _seriesController;
    int _lastIndexRetrieved;

};

#endif // MAINWINDOWCONTROL_H
