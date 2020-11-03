#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QStandardItemModel>
#include "Backend.h"
#include "PixmapBuilder.h"
#include "SelectionHelper.h"
#include "LineItem.h"

int main(int argc, char *argv[])
{
	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

	QGuiApplication app(argc, argv);
	Backend backend;
	QQmlApplicationEngine engine;
	const QUrl url(QStringLiteral("qrc:/main.qml"));

	engine.rootContext()->setContextProperty("backend", &backend);
	engine.addImageProvider(QLatin1String("icons"), new PixmapBuilder);

	qmlRegisterType<QStandardItemModel>("QStandardItemModel", 1, 0, "QStandardItemModel");
	qmlRegisterType<LineItem>("Scope.PaintedItems", 1, 0, "LineItem");
	qmlRegisterType<SelectionHelper>("Scope.PaintedItems", 1, 0, "SelectionHelper");

	QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
					 &app, [url](QObject *obj, const QUrl &objUrl) {
		if (!obj && url == objUrl)
			QCoreApplication::exit(-1);
	}, Qt::QueuedConnection);

	engine.load(url);

	return app.exec();
}
