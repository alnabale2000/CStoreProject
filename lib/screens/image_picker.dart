import 'dart:io';
import 'package:cstore/screens/add_ad_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cstore/constant.dart';
import 'package:cstore/components/loading.dart';

class ImageCapture extends StatefulWidget {
  createState() => _ImageCaptureState();
}

class _ImageCaptureState extends State<ImageCapture> {
  File _imageFile;

  Future<void> _pickImage(ImageSource source) async {
    File selected = await ImagePicker.pickImage(source: source);

    setState(() {
      _imageFile = selected;
    });
  }

  void _clear() {
    setState(() => _imageFile = null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: kNeturalBigColor,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      // Select an image from the camera or gallery
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.photo_camera),
              onPressed: () => _pickImage(ImageSource.camera),
            ),
            IconButton(
              icon: Icon(Icons.photo_library),
              onPressed: () => _pickImage(ImageSource.gallery),
            ),
          ],
        ),
      ),

      // Preview the image and crop it
      body: ListView(
        children: <Widget>[
          if (_imageFile != null) ...[
            Image.file(_imageFile),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(
                child: Icon(Icons.refresh, color: kNeturalBigColor),
                onPressed: _clear,
              ),
            ),
            SizedBox(height: 10),
            Uploader(file: _imageFile)
          ]
        ],
      ),
    );
  }
}

class Uploader extends StatefulWidget {
  final File file;

  Uploader({this.file, Key key}) : super(key: key);
  @override
  _UploaderState createState() => _UploaderState();
}

class _UploaderState extends State<Uploader> {
  UploadTask _uploadTask;
  final FirebaseStorage _storage =
      FirebaseStorage.instanceFor(bucket: 'gs://cstore-1410d.appspot.com');

  void _startUpload() {
    String filePath = 'images/${DateTime.now()}.png';

    setState(() {
      _uploadTask = _storage.ref().child(filePath).putFile(widget.file);
    });
  }

  String url;

  @override
  Widget build(BuildContext context) {
    if (_uploadTask != null) {
      return StreamBuilder(
        stream: _uploadTask.snapshotEvents,
        builder: (_, snapshot) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Loading(text: 'Uploading'),
          );
        },
      );
    } else {
      // Allows user to decide when to start the upload
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 120),
            child: Container(
              decoration: BoxDecoration(color: kNeturalBigColor, boxShadow: [
                BoxShadow(
                  offset: Offset(0, 2),
                  color: kNeturalBigColor,
                  blurRadius: 4,
                  spreadRadius: -1,
                )
              ]),
              child: FlatButton.icon(
                label: Text(
                  'SAVE',
                  style: TextStyle(color: Colors.white),
                ),
                icon: Icon(
                  Icons.save,
                  color: Colors.white,
                ),
                onPressed: () async {
                  _startUpload();

                  TaskSnapshot taskSnapshot = await _uploadTask;
                  url = (await taskSnapshot.ref.getDownloadURL()).toString();

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return AddPage(
                          file: widget.file,
                          url: url,
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 10)
        ],
      );
    }
  }
}
