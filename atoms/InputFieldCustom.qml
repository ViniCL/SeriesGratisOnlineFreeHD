import QtQuick 2.15

InputFieldCustomForm {
    id: root

    signal pesquisaChanged(string pesquisa)
    signal inputFocusChanged(bool focus)

    input.onTextChanged: delayTimer.restart()

    delayTimer.onTriggered: root.pesquisaChanged(input.text)

    clearButton.onClicked: input.text = ""

    function getText() {
        return input.text
    }

    function clearText() {
        input.text = ""
    }

    input.cursorVisible: input.focus
    input.onFocusChanged: root.inputFocusChanged(input.focus)
}
