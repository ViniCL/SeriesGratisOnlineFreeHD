QT += quick virtualkeyboard core network

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

#QTPLUGIN += qtvirtualkeyboardplugin  #desabilitado, mas mantido como lembre se necessario.


SOURCES += \
        Controllers/seriescontroller.cpp \
        Controls/mainwindowcontrol.cpp \
        Delegates/seriesdelegate.cpp \
        Integrations/seriesintegration.cpp \
        Models/serieinfoabstractmodel.cpp \
        Models/serieinfodto.cpp \
        Models/seriesabstractmodel.cpp \
        Models/seriesdto.cpp \
        Models/seriestubresponse.cpp \
        Services/seriesservice.cpp \
        main.cpp \
        registertype.cpp \
        systemsingleton.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH = $$PWD

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    Controllers/seriescontroller.h \
    Controls/mainwindowcontrol.h \
    Delegates/seriesdelegate.h \
    Integrations/seriesintegration.h \
    Models/serieinfoabstractmodel.h \
    Models/serieinfodto.h \
    Models/seriesabstractmodel.h \
    Models/seriesdto.h \
    Models/seriestubresponse.h \
    Services/seriesservice.h \
    registertype.h \
    systemsingleton.h
