# allows to add DEPLOYMENTFOLDERS and links to the Felgo library and QtCreator auto-completion
CONFIG += felgo

# uncomment this line to add the Live Client Module and use live reloading with your custom C++ code
# for the remaining steps to build a custom Live Code Reload app see here: https://felgo.com/custom-code-reload-app/
# CONFIG += felgo-live

# Project identifier and version
# More information: https://felgo.com/doc/felgo-publishing/#project-configuration
PRODUCT_IDENTIFIER = de.constructor.test
PRODUCT_VERSION_NAME = 1.0.0
PRODUCT_VERSION_CODE = 5

# Optionally set a license key that is used instead of the license key from
# main.qml file (App::licenseKey for your app or GameWindow::licenseKey for your game)
# Only used for local builds and Felgo Cloud Builds (https://felgo.com/cloud-builds)
# Not used if using Felgo Live
PRODUCT_LICENSE_KEY = "02FDFC3B69CFF9C409CE635A645B1BF90F3572B39A99F8987C32BA66C388D7D6DFF9EE68493E79934756F6A1BC88972496974FF5E82DBC1EDF026F5028D21DA48A01345BE0D4BCE38152A2D625A2E62E5139BDAAFE5812A50D5B641231723B3703FFF04AA7208FFDF4F3E14170554A5D3E5B08ED0FA03441D3268065BBF68C44ED04824C64854C9DBE9CE183DBAABF93DE6513A6FF683CF5B44235F715883FE4459F3CBCF937EE38B17628B351A4C48A50B96C5CE746F891C30F25FD18424B9AF41BAC0D45A265D7643C50F9DA3957C072617F48DECD3A7D56642290831F09EF2D09C133106270F85245E6293AD450E84D4927D98952D8CC6B896E05E1B77826A2EAA80D178CD95881177FEE543C63CE3AB240649D5CF5B86812CE996F30FC8B9B0D56451424A981C27518E2F82AE098"

qmlFolder.source = qml
DEPLOYMENTFOLDERS += qmlFolder # comment for publishing

assetsFolder.source = assets
DEPLOYMENTFOLDERS += assetsFolder

# Add more folders to ship with the application here

RESOURCES += #    resources.qrc # uncomment for publishing

# NOTE: for PUBLISHING, perform the following steps:
# 1. comment the DEPLOYMENTFOLDERS += qmlFolder line above, to avoid shipping your qml files with the application (instead they get compiled to the app binary)
# 2. uncomment the resources.qrc file inclusion and add any qml subfolders to the .qrc file; this compiles your qml files and js files to the app binary and protects your source code
# 3. change the setMainQmlFile() call in main.cpp to the one starting with "qrc:/" - this loads the qml files from the resources
# for more details see the "Deployment Guides" in the Felgo Documentation

# during development, use the qmlFolder deployment because you then get shorter compilation times (the qml files do not need to be compiled to the binary but are just copied)
# also, for quickest deployment on Desktop disable the "Shadow Build" option in Projects/Builds - you can then select "Run Without Deployment" from the Build menu in Qt Creator if you only changed QML files; this speeds up application start, because your app is not copied & re-compiled but just re-interpreted


# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp


android {
    ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
    OTHER_FILES += android/AndroidManifest.xml       android/build.gradle
}

ios {
    QMAKE_INFO_PLIST = ios/Project-Info.plist
    OTHER_FILES += $$QMAKE_INFO_PLIST
}

# set application icons for win and macx
win32 {
    RC_FILE += win/app_icon.rc
}
macx {
    ICON = macx/app_icon.icns
}
