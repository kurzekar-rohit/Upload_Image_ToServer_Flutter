import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';

void main() {
  runApp(UploadImageDemo());
}

class UploadImageDemo extends StatefulWidget {
  UploadImageDemo() : super();

  final String title = "Upload Image Demo";

  @override
  UploadImageDemoState createState() => UploadImageDemoState();
}

class UploadImageDemoState extends State<UploadImageDemo> {
  //
  static final String uploadEndPoint =
      'https://goodmove.cloud/flutter_android_medical/api_uploadimage.php';
  Future<File> file;
  String status = '';
  String base64Image;
  File tmpFile;
  String errMessage = 'Error Uploading Image';
  String fileSize = 'File size is greater than 2MB';
  var length;
  List<File> files;
  chooseImage() {
    setState(() async {
      // file = ImagePicker.pickImage(source: ImageSource.gallery);
      FilePickerResult result =
          await FilePicker.platform.pickFiles(allowMultiple: true);
      if (result != null) {
        files = result.paths.map((path) => File(path));
        uploadImage(result.paths);
      }
    });
    setStatus('');
  }

  // clickImage() {
  //   setState(() {
  //     file = ImagePicker.pickImage(source: ImageSource.camera);
  //   });
  //   setStatus('');
  // }

  setStatus(String message) {
    setState(() {
      status = message;
    });
  }

  // startUpload() {
  //   setStatus('Uploading Image...');
  //   print("File Size lengthSync: ${tmpFile.lengthSync()}");
  //   length = tmpFile.lengthSync();
  //   length = length / 1024;
  //   print('File Size in KB : $length');

  //   if (null == tmpFile) {
  //     setStatus(errMessage);
  //     return;
  //   }
  //   if (length > 2000) {
  //     setStatus(fileSize);
  //     return;
  //   }
  // String fileName = tmpFile.path.split('/').last;
  //   upload(fileName);
  //   // uploadFile();
  // }

  // upload(String fileName) {
  //   http.post(uploadEndPoint, body: {
  //     "image": base64Image,
  //     "name": fileName,
  //     // "action": "UPLOADIMAGE",
  //   }).then((result) {
  //     print("ImageBase64: $base64Image");
  //     print("FileName: $fileName");
  //     setStatus(result.statusCode == 200 ? result.body : errMessage);
  //   }).catchError((error) {
  //     setStatus(error);
  //   });
  // }

  Future<String> uploadImage(filename) async {
    var request = http.MultipartRequest('POST', Uri.parse(uploadEndPoint));
    request.files.add(await http.MultipartFile.fromPath('picture', filename));
    print('This Is Filename: $filename');
    var res = await request.send();
    return res.reasonPhrase;
  }

  Widget showImage() {
    return FutureBuilder<File>(
      future: file,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            null != snapshot.data) {
          tmpFile = snapshot.data;
          base64Image = base64Encode(snapshot.data.readAsBytesSync());
          return Flexible(
            child: Image.file(
              snapshot.data,
              fit: BoxFit.fill,
            ),
          );
        } else if (null != snapshot.error) {
          return const Text(
            'Error Picking Image',
            textAlign: TextAlign.center,
          );
        } else {
          return const Text(
            'No Image Selected',
            textAlign: TextAlign.center,
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Upload Image Demo"),
        ),
        body: Container(
          padding: EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              OutlineButton(
                onPressed: chooseImage,
                child: Text('Choose Image'),
              ),
              SizedBox(
                height: 8.0,
              ),
              // OutlineButton(
              //   onPressed: clickImage,
              //   child: Text('Click Image'),
              // ),
              SizedBox(
                height: 20.0,
              ),
              // showImage(),
              SizedBox(
                height: 20.0,
              ),
              // OutlineButton(
              //   onPressed: startUpload,
              //   child: Text('Upload Image'),
              // ),
              // SizedBox(
              //   height: 20.0,
              // ),
              Text(
                status,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.w500,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
