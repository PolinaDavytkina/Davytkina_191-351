#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "webappcontroller.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    WebAppController w;


    QObject* rootItem = engine.rootObjects()[0];
    QObject::connect(rootItem, SIGNAL(doFetch()),
                     &w, SLOT(getPageInfo()));
    QObject::connect(&w, SIGNAL(signalOut(QString)),
                     rootItem, SIGNAL(signalText(QString)));
    QObject::connect(&w, SIGNAL(cppFriends(QString)),
                     rootItem, SIGNAL(friends(QString)));

    QObject::connect(rootItem, SIGNAL(auth(QString)),
                     &w, SLOT(auth(QString)));
    return app.exec();
}
