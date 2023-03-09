import QtQuick 2.15
import QtQuick.Controls
import Qt.labs.platform as Platform

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("ImageViewer")

    background:Rectangle{
        color:"darkGrey"
    }

    Image{
        id:image
        anchors.fill:parent
        fillMode:Image.PreserveAspectFit
        asynchronous:true
    }

    header:ToolBar{
        Flow{
            anchors.fill:parent
            ToolButton{
                text:qsTr("Open")
                icon.name:"document-open"
                onClicked:fileOpenDialog.open()
            }

        }
    }

    Platform.FileDialog{
        id:fileOpenDialog
        title:"Select an image file"
        folder: StandardPaths.writableLocation(StandardPaths.DocumentsLocation)
        nameFilters:["Image files (*.png *.jpeg *.jpg)"]
        onAccepted:{

            image.source=fileOpenDialog.file
        }
    }
    Dialog{
        id:aboutDialog
        modal: true
        title:qsTr("About")
        standardButtons: Dialog.Ok
        Label{
            anchors.fill:parent
            text:qsTr("Image Viewer\n by Aryan The Arora The Great")
            horizontalAlignment:text.AlignHCenter
        }

    }
    menuBar:
        MenuBar{
                Menu{
                    title:qsTr("&File")

                    MenuItem{
                        text:qsTr("&Open...")
                        icon.name:"document-open"
                        onTriggered:fileOpenDialog.open()
                    }
                }

                Menu{
                    title:qsTr("&Help")
                    MenuItem{
                        text:qsTr("&About")
                        onTriggered:aboutDialog.open()
                    }

            }
    }



}
