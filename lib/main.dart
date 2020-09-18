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
  String fileSize = 'File size is greater than 5MB';
  var length;
  List<File> files;
  var filename1,
      file_size1,
      filename2,
      file_size2,
      filename3,
      file_size3,
      filename4,
      file_size4,
      filename5,
      file_size5;

  chooseImage_1() async {
    // setState(() async {
    // file = ImagePicker.pickImage(source: ImageSource.gallery);
    FilePickerResult result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // files = result.paths.map((path) => File(path));
      // print('Result path : $files');
      // uploadImage(result.paths);
      PlatformFile file = result.files.first;
      print('FileName : ${file.name}');
      print('FileSize : ${file.size}');
      print('FileExtension : ${file.extension}');
      print('FilePath : ${file.path}');
      if (file.size > 5120) {
        print('FIle size is more');
        setState(() {
          filename1 = fileSize;
          // file_size1 = '';
        });
      } else {
        setState(() {
          filename1 = file.name;
          file_size1 = file.size;
        });
      }
    }
    // });
    setStatus('');
  }

  chooseImage_2() async {
    // setState(() async {
    // file = ImagePicker.pickImage(source: ImageSource.gallery);
    FilePickerResult result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // files = result.paths.map((path) => File(path));
      // print('Result path : $files');
      // uploadImage(result.paths);
      PlatformFile file = result.files.first;
      print('FileName : ${file.name}');
      print('FileSize : ${file.size}');
      print('FileExtension : ${file.extension}');
      print('FilePath : ${file.path}');
      // setState(() {
      //   filename2 = file.name;
      //   file_size2 = file.size;
      // });
      if (file.size > 5120) {
        print('FIle size is more');
        setState(() {
          filename2 = fileSize;
          // file_size1 = '';
        });
      } else {
        setState(() {
          filename2 = file.name;
          file_size2 = file.size;
        });
      }
    }
    // });
    setStatus('');
  }

  chooseImage_3() async {
    // setState(() async {
    // file = ImagePicker.pickImage(source: ImageSource.gallery);
    FilePickerResult result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // files = result.paths.map((path) => File(path));
      // print('Result path : $files');
      // uploadImage(result.paths);
      PlatformFile file = result.files.first;
      print('FileName : ${file.name}');
      print('FileSize : ${file.size}');
      print('FileExtension : ${file.extension}');
      print('FilePath : ${file.path}');
      // setState(() {
      //   filename3 = file.name;
      //   file_size3 = file.size;
      // });
      if (file.size > 5120) {
        print('FIle size is more');
        setState(() {
          filename3 = fileSize;
          // file_size1 = '';
        });
      } else {
        setState(() {
          filename3 = file.name;
          file_size3 = file.size;
        });
      }
    }
    // });
    setStatus('');
  }

  chooseImage_4() async {
    // setState(() async {
    // file = ImagePicker.pickImage(source: ImageSource.gallery);
    FilePickerResult result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // files = result.paths.map((path) => File(path));
      // print('Result path : $files');
      // uploadImage(result.paths);
      PlatformFile file = result.files.first;
      print('FileName : ${file.name}');
      print('FileSize : ${file.size}');
      print('FileExtension : ${file.extension}');
      print('FilePath : ${file.path}');
      // setState(() {
      //   filename4 = file.name;
      //   file_size4 = file.size;
      // });
      if (file.size > 5120) {
        print('FIle size is more');
        setState(() {
          filename4 = fileSize;
          // file_size1 = '';
        });
      } else {
        setState(() {
          filename4 = file.name;
          file_size4 = file.size;
        });
      }
    }
    // });
    setStatus('');
  }

  chooseImage_5() async {
    // setState(() async {
    // file = ImagePicker.pickImage(source: ImageSource.gallery);
    FilePickerResult result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // files = result.paths.map((path) => File(path));
      // print('Result path : $files');
      // uploadImage(result.paths);
      PlatformFile file = result.files.first;
      print('FileName : ${file.name}');
      print('FileSize : ${file.size}');
      print('FileExtension : ${file.extension}');
      print('FilePath : ${file.path}');
      // setState(() {
      //   filename5 = file.name;
      //   file_size5 = file.size;
      // });
      if (file.size > 5120) {
        print('FIle size is more');
        setState(() {
          filename5 = fileSize;
          // file_size1 = '';
        });
      } else {
        setState(() {
          filename5 = file.name;
          file_size5 = file.size;
        });
      }
    }
    // });
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
              Expanded(
                child: OutlineButton(
                  onPressed: chooseImage_1,
                  child: Text('Choose File 1'),
                ),
              ),
              // SizedBox(
              //   height: 8.0,
              // ),
              Expanded(
                child: filename1 != null
                    ? Text('$filename1')
                    : SizedBox(
                        height: 5.0,
                      ),
              ),
              // OutlineButton(
              //   onPressed: clickImage,
              //   child: Text('Click Image'),
              // ),
              // SizedBox(
              //   height: 5.0,
              // ),
              Expanded(
                child: file_size1 != null
                    ? Text('$file_size1 kB')
                    : SizedBox(
                        height: 5.0,
                      ),
              ),
              // showImage(),
              SizedBox(
                height: 5.0,
              ),
              Expanded(
                child: OutlineButton(
                  onPressed: chooseImage_2,
                  child: Text('Choose File 2'),
                ),
              ),
              Expanded(
                child: filename2 != null
                    ? Text('$filename2')
                    : SizedBox(
                        height: 5.0,
                      ),
              ),
              Expanded(
                child: file_size2 != null
                    ? Text('$file_size2 kB')
                    : SizedBox(
                        height: 5.0,
                      ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Expanded(
                child: OutlineButton(
                  onPressed: chooseImage_3,
                  child: Text('Choose File 3'),
                ),
              ),
              Expanded(
                child: filename3 != null
                    ? Text('$filename3')
                    : SizedBox(
                        height: 5.0,
                      ),
              ),
              Expanded(
                child: file_size3 != null
                    ? Text('$file_size3 kB')
                    : SizedBox(
                        height: 5.0,
                      ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Expanded(
                child: OutlineButton(
                  onPressed: chooseImage_4,
                  child: Text('Choose File 4'),
                ),
              ),
              Expanded(
                child: filename4 != null
                    ? Text('$filename4')
                    : SizedBox(
                        height: 5.0,
                      ),
              ),
              Expanded(
                child: file_size4 != null
                    ? Text('$file_size4 kB')
                    : SizedBox(
                        height: 5.0,
                      ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Expanded(
                child: OutlineButton(
                  onPressed: chooseImage_5,
                  child: Text('Choose File 5'),
                ),
              ),
              Expanded(
                child: filename5 != null
                    ? Text('$filename5')
                    : SizedBox(
                        height: 5.0,
                      ),
              ),
              Expanded(
                child: file_size5 != null
                    ? Text('$file_size5 kB')
                    : SizedBox(
                        height: 5.0,
                      ),
              ),
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
