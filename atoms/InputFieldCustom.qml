import QtQuick 2.15

InputFieldCustomForm {
    id: root

    signal pesquisaChanged(string pesquisa)

    input.onTextChanged: delayTimer.restart()

    delayTimer.onTriggered: root.pesquisaChanged(input.text)

    clearButton.onClicked: input.text = ""

    function getText() {
        return input.text
    }

    function clearText() {
        input.text = ""
    }
}
