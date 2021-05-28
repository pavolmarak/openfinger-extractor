QT       += gui
TEMPLATE = lib

DEFINES += EXTRACTION_LIBRARY
DEFINES += QT_DEPRECATED_WARNINGS
DEFINES += PRO_PWD=\\\"$$_PRO_FILE_PWD_\\\"

CONFIG += c++17
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

# ********************************************************************
#                           DEPENDENCIES
# ********************************************************************

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
    unix:!macx: LIBS += -L/usr/local/cuda-10.2/lib64/ -lcudart
    INCLUDEPATH += /usr/local/cuda-10.2/include
    DEPENDPATH += /usr/local/cuda-10.2/include

    #Caffe - Manjaro (built from source)
    unix:!macx: LIBS += -L/usr/local/lib -lcaffe
    INCLUDEPATH += /usr/local/include
    DEPENDPATH += /usr/local/include

    #glog, protobuf, boost - Manjaro (as a package)
    unix:!macx: LIBS += -L/usr/lib/ -lglog
    unix:!macx: LIBS += -L/usr/lib/ -lprotobuf
    unix:!macx: LIBS += -L/usr/lib/ -lboost_system
    INCLUDEPATH += /usr/include
    DEPENDPATH += /usr/include

    #OpenCV - Manjaro (as a package)
    INCLUDEPATH += /usr/include/opencv4/
}
