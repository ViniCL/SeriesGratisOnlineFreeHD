#ifndef SERIESABSTRACTMODEL_H
#define SERIESABSTRACTMODEL_H

#include <QAbstractListModel>
#include <QList>

#include "seriesdto.h"

class SeriesAbstractModel : public QAbstractListModel {
    Q_OBJECT
    Q_PROPERTY(QList<SeriesDTO*> series READ series WRITE setSeries NOTIFY seriesChanged)
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

signals:
    void seriesChanged();

private:
    QList<SeriesDTO*> _series;
};

#endif // SERIESABSTRACTMODEL_H
