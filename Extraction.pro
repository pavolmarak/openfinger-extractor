#-------------------------------------------------
#
# Project created by QtCreator 2017-05-15T14:09:19
#
#-------------------------------------------------

QT       += gui

TARGET = Extraction
TEMPLATE = lib

DEFINES += EXTRACTION_LIBRARY

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

DEFINES += PRO_PWD=\\\"$$_PRO_FILE_PWD_\\\"

QMAKE_CFLAGS_ISYSTEM=

SOURCES += \
    extraction.cpp \
    crossingnumber.cpp \
    neuralchecker.cpp \
    isoconverter.cpp \
    orientationfixer.cpp \
    extraction_caffenetwork.cpp

HEADERS +=\
    extraction.h \
    extraction_global.h \
    crossingnumber.h \
    neuralchecker.h \
    isoconverter.h \
    orientationfixer.h \
    extraction_config.h \
    extraction_caffenetwork.h

unix {
    target.path = /usr/lib
    INSTALLS += target
}

CONFIG += manjaro
#CONFIG += debian

debian {
    #CUDA - Debian
    unix:!macx: LIBS += -L/usr/local/cuda/lib64/ -lcudart
    INCLUDEPATH += /usr/local/cuda/include
    DEPENDPATH += /usr/local/cuda/include

    #Caffe - Debian (built from source)
    unix:!macx: LIBS += -L/usr/local/lib -lcaffe
    INCLUDEPATH += /usr/local/include
    DEPENDPATH += /usr/local/include

    #glog, protobuf, boost - Debian (as a package)
    unix:!macx: LIBS += -L/usr/lib/x86_64-linux-gnu/ -lglog
    unix:!macx: LIBS += -L/usr/lib/x86_64-linux-gnu/ -lprotobuf
    unix:!macx: LIBS += -L/usr/lib/x86_64-linux-gnu/ -lboost_system
    INCLUDEPATH += /usr/include
    DEPENDPATH += /usr/include

    #OpenCV - Debian (as a package)
    INCLUDEPATH += /usr/include/opencv4/
}

manjaro {
    #CUDA - Manjaro
    unix:!macx: LIBS += -L/opt/cuda/lib64/ -lcudart
    INCLUDEPATH += /opt/cuda/include
    DEPENDPATH += /opt/cuda/include

    #Caffe - Manjaro (as a package)
    unix:!macx: LIBS += -L/usr/lib -lcaffe
    INCLUDEPATH += /usr/include
    DEPENDPATH += /usr/include

    #glog, protobuf, boost - Manjaro (as a package)
    unix:!macx: LIBS += -L/usr/lib/ -lglog
    unix:!macx: LIBS += -L/usr/lib/ -lprotobuf
    unix:!macx: LIBS += -L/usr/lib/ -lboost_system
    INCLUDEPATH += /usr/include
    DEPENDPATH += /usr/include

    #OpenCV - Manjaro (as a package)
    INCLUDEPATH += /usr/include/opencv4/
}
