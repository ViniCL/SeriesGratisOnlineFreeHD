#include "seriesabstractmodel.h"

SeriesAbstractModel::SeriesAbstractModel(QObject *parent) : QAbstractListModel(parent) {}

SeriesAbstractModel::~SeriesAbstractModel() {
    qDeleteAll(_series);
}

int SeriesAbstractModel::rowCount(const QModelIndex &parent) const {
    if (parent.isValid() || _series.isEmpty())
        return 0;
    return _series.size();
}

QVariant SeriesAbstractModel::data(const QModelIndex &index, int role) const {
    if (!index.isValid() || index.row() >= _series.size())
        return QVariant();

    const SeriesDTO *series = _series.at(index.row());
    switch (role) {
    case idSerie:
        return series->id();
    case dsNome:
        return series->dsName();
    case imagem:
        return series->image();
    case nota:
        return series->rating();
    default:
        return QVariant();
    }
}

QHash<int, QByteArray> SeriesAbstractModel::roleNames() const {
    QHash<int, QByteArray> roles;
    roles[idSerie] = "idSerie";
    roles[dsNome] = "nome";
    roles[imagem] = "imagem";
    roles[nota] = "nota";
    return roles;
}

QList<SeriesDTO*> SeriesAbstractModel::series() const {
    return _series;
}

void SeriesAbstractModel::setSeries(const QList<SeriesDTO*> &series) {
    if (_series == series)
        return;
    beginResetModel();
    qDeleteAll(_series);
    _series = series;
    endResetModel();
    emit seriesChanged();
}
