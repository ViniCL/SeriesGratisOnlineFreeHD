#include "seriesabstractmodel.h"

namespace {
    constexpr int FIRST_PAGE = 0;
    constexpr int MAX_PAGES = 2;
}

SeriesAbstractModel::SeriesAbstractModel(QObject *parent) :
    QAbstractListModel( parent ),
    _currentPage( FIRST_PAGE ),
    _series({}),
    _newSeriesSearched({}){}

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
    case dsName:
        return series->dsName();
    case imagem:
        return series->image();
    case rating:
        return series->rating();
    default:
        return QVariant();
    }
}

QHash<int, QByteArray> SeriesAbstractModel::roleNames() const {
    QHash<int, QByteArray> roles;
    roles[idSerie] = "idSerie";
    roles[dsName] = "name";
    roles[imagem] = "imagem";
    roles[rating] = "rating";
    return roles;
}

bool SeriesAbstractModel::canFetchMore(const QModelIndex &parent) const
{
    qInfo() << "SeriesAbstractModel::canFetchMore [SERIES_SIZE]" << _series.size();

    Q_UNUSED( parent )

    if ( _series.isEmpty() || _currentPage > MAX_PAGES ){
        return false;
    }

    qInfo() << "SeriesAbstractModel::canFetchMore [RETURN]" << true;

    return true;
}

void SeriesAbstractModel::fetchMore(const QModelIndex &parent)
{

    qInfo() << "SeriesAbstractModel::fetchMore [CURRENT_PAGE_INITIAL]" << _currentPage;

    Q_UNUSED( parent )

    emit retrieveNewSeries(_currentPage);

    qInfo() << "SeriesAbstractModel::fetchMore [NEW_SERIES_SEARCHED_SIZE]" << _newSeriesSearched.size();

    if ( !_newSeriesSearched.isEmpty() ) {
        beginInsertRows( QModelIndex(), _series.size(), _series.size() + _newSeriesSearched.size() - 1 );
        for ( const auto& series : _newSeriesSearched ) {
            _series.append( series );
        }
        endInsertRows();
        _newSeriesSearched.clear();

    }
    _currentPage++;

    qInfo() << "SeriesAbstractModel::fetchMore [CURRENT_PAGE_FINAL]" << _currentPage << "[SERIES_SIZE]" << _series.size();

}

QList<SeriesDTO *> SeriesAbstractModel::newSeriesSearched() const
{
    return _newSeriesSearched;
}

void SeriesAbstractModel::setNewSeriesSearched(const QList<SeriesDTO *> &newNewSeriesSearched)
{
    if (_newSeriesSearched == newNewSeriesSearched)
        return;
    _newSeriesSearched = newNewSeriesSearched;
    emit newSeriesSearchedChanged();
}

QList<SeriesDTO*> SeriesAbstractModel::series() const {
    return _series;
}

void SeriesAbstractModel::setSeries(const QList<SeriesDTO*> &series) {
    beginResetModel();

    _series.clear();
    _series.squeeze();
    _series.reserve( series.size() );
    _series = series;

    endResetModel();
}

void SeriesAbstractModel::resetCurrentPage() {
    _currentPage = FIRST_PAGE;
}

int SeriesAbstractModel::getCurrentPage() {
    return _currentPage;
}

