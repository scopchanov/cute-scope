QT += gui widgets quick

CONFIG += c++11 qtquickcompiler

SOURCES += \
    main.cpp \
    Form.cpp \
    FormElement.cpp

HEADERS += \
    Form.h \
    Form_p.h \
    FormElement.h \
    FormElement_p.h

RESOURCES += \
    qml.qrc \
    resources.qrc

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
