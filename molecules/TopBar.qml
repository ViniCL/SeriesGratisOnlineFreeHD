import QtQuick 2.15

TopBarForm {
    id: root

    property string vColor

    signal pesquisaChanged(string pesquisa)

    background.color: vColor

    search.onPesquisaChanged: function(pesquisa){
           root.pesquisaChanged(pesquisa)
    }

}
