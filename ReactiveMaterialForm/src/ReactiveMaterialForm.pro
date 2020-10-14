QT += quick

CONFIG += c++11 qtquickcompiler

SOURCES += \
    Form.cpp \
    main.cpp

RESOURCES += \
    qml.qrc

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
	Form.h
