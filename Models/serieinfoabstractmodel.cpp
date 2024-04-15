#include "serieinfoabstractmodel.h"

SerieInfoAbstractModel::SerieInfoAbstractModel(QObject *parent) : QAbstractListModel(parent) {}

SerieInfoAbstractModel::~SerieInfoAbstractModel() {}

int SerieInfoAbstractModel::rowCount(const QModelIndex &parent) const {
    if (parent.isValid())
        return 0;
    return 1;
}

QVariant SerieInfoAbstractModel::data(const QModelIndex &index, int role) const {
    if (!index.isValid())
        return QVariant();

    switch (role) {
    case dsNome:
        return _serie.name();
    case imagem:
        return _serie.image();
    case nota:
        return _serie.rating();
    case dsResumo:
        return _serie.summary();
    case generosList:
        return QVariant::fromValue(_serie.genres());
    default:
        return QVariant();
    }
}

QHash<int, QByteArray> SerieInfoAbstractModel::roleNames() const {
    QHash<int, QByteArray> roles;
    roles[dsNome] = "nome";
    roles[imagem] = "imagem";
    roles[nota] = "nota";
    roles[dsResumo] = "resumo";
    roles[generosList] = "generosList";
    return roles;
}

SerieInfoDTO SerieInfoAbstractModel::serie() const {
    return _serie;
}

void SerieInfoAbstractModel::setSerie(const SerieInfoDTO &serie) {
    _serie = serie;
    emit serieChanged();
}
