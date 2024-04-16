import QtQuick 2.15

TopBarForm {
    id: root

    property string vColor

    signal pesquisaChanged(string pesquisa)
    signal inputFocusChanged(bool focus)

    background.color: vColor

    search.onPesquisaChanged: function(pesquisa){
        root.pesquisaChanged(pesquisa)
    }


    search.onInputFocusChanged: function(focus){
        inputFocusChanged(focus)
    }
}
