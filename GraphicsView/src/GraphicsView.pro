QT += gui widgets quick

CONFIG += c++11

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        Backend.cpp \
        LineItem.cpp \
        PixmapBuilder.cpp \
        SelectionHelper.cpp \
        main.cpp

HEADERS += \
	Backend.h \
	LineItem.h \
	PixmapBuilder.h \
	SelectionHelper.h

RESOURCES += qml.qrc

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
