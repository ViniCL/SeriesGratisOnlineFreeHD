#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "systemsingleton.h"
#include "registertype.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard")); //Ensinamento (e aviso): Esse comando deve estar sempre antes declaração do QGuiApplication app, para o VirtualKeyboard funcionar.
    qputenv("QT_VIRTUALKEYBOARD_LAYOUT_PATH", ":/styles/customVirtualKeyboard");
    // qputenv("QT_VIRTUALKEYBOARD_STYLE", QByteArray("material"));

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    SystemSingleton::getInstance();

    RegisterType().registerQml();

    engine.addImportPath("qrc:/");

    const QUrl url(QStringLiteral("qrc:/main.qml"));

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
