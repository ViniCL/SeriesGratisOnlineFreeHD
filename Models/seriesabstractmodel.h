#ifndef SERIESABSTRACTMODEL_H
#define SERIESABSTRACTMODEL_H

#include <QAbstractListModel>
#include <QList>

#include "seriesdto.h"

class SeriesAbstractModel : public QAbstractListModel {
    Q_OBJECT
    Q_PROPERTY(QList<SeriesDTO*> series READ series WRITE setSeries NOTIFY seriesChanged)
    Q_PROPERTY(QList<SeriesDTO*> newSeriesSearched READ newSeriesSearched WRITE setNewSeriesSearched NOTIFY newSeriesSearchedChanged FINAL)

public:
    explicit SeriesAbstractModel(QObject *parent = nullptr);
    ~SeriesAbstractModel() override;

    enum Role {
        idSerie,
        dsNome,
        imagem,
        nota
    };

    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    QHash<int, QByteArray> roleNames() const override;

    QList<SeriesDTO*> series() const;
    void setSeries(const QList<SeriesDTO*> &series);

    Q_INVOKABLE void resetCurrentPage();
    Q_INVOKABLE int getCurrentPage();

    QList<SeriesDTO *> newSeriesSearched() const;
    void setNewSeriesSearched(const QList<SeriesDTO *> &newNewSeriesSearched);

signals:
    void seriesChanged();
    void retrieveNewSeries(int page);
    void newSeriesSearchedChanged();

protected:
    bool canFetchMore(const QModelIndex& parent) const override;
    void fetchMore(const QModelIndex& parent) override;

private:
    int _currentPage;
    QList<SeriesDTO*> _series;
    QList<SeriesDTO*> _newSeriesSearched;

};

#endif // SERIESABSTRACTMODEL_H
