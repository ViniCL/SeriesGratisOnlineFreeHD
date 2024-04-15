#ifndef SERIEINFOABSTRACTMODEL_H
#define SERIEINFOABSTRACTMODEL_H

#include <QAbstractListModel>
#include "serieinfodto.h"

class SerieInfoAbstractModel : public QAbstractListModel {
    Q_OBJECT
    Q_PROPERTY(SerieInfoDTO serie READ serie WRITE setSerie NOTIFY serieChanged)
public:
    explicit SerieInfoAbstractModel(QObject *parent = nullptr);
    ~SerieInfoAbstractModel() override;

    enum Role {
        dsNome,
        imagem,
        nota,
        dsResumo,
        generosList
    };

    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    QHash<int, QByteArray> roleNames() const override;

    SerieInfoDTO serie() const;
    void setSerie(const SerieInfoDTO &serie);

signals:
    void serieChanged();

private:
    SerieInfoDTO _serie;
};

#endif // SERIEINFOABSTRACTMODEL_H
