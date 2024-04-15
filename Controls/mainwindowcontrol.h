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

    Q_INVOKABLE QVariant doSearchAllSeries( const QString& dsPesquisa );
    Q_INVOKABLE SerieInfoDTO searchOneSerieById(int id);

private:
    SeriesController _seriesController;
};

#endif // MAINWINDOWCONTROL_H
