INCLUDEPATH += $$PWD/include

win32 {

    CONFIG(release, debug|release) {
        CONFIGURATION = "Release"
    }else{
        CONFIGURATION = "Debug"
    }

    LIBS += -l$$PWD/$$CONFIGURATION/Assimp32

    assimp.files = $$PWD/$$CONFIGURATION/Assimp32.dll
    assimp.path = $$DEPLOY_DIR
    INSTALLS += assimp

}

android{

    LIBS += -L$$PWD/libs
    LIBS += -lAssimp32_$${ANDROID_TARGET_ARCH}

    ANDROID_EXTRA_LIBS += \
        $$PWD/libs/libAssimp32_armeabi-v7a.so \
        $$PWD/libs/libAssimp32_arm64-v8a.so \
        $$PWD/libs/libAssimp32_x86_64.so \
        $$PWD/libs/libAssimp32_x86.so
}
