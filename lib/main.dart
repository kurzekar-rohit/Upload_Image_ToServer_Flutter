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
  String fileSizeError = 'File size is greater than 5MB';
  // var length;
  String fileName;
  List<File> files;
  bool _progressBarActive1,
      _progressBarActive2,
      _progressBarActive3,
      _progressBarActive4,
      _progressBarActive5 = false;

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
      PlatformFile file = result.files.first;
      print('FileName : ${file.name}');
      print('FileSize : ${file.size}');
      print('FileExtension : ${file.extension}');
      print('FilePath : ${file.path}');
      if (file.size > 5120) {
        print('FIle size is more');
        setState(() {
          filename1 = fileSizeError;
        });
      } else {
        setState(() {
          filename1 = file.name;
          file_size1 = file.size;
          _progressBarActive1 = true;
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
      PlatformFile file = result.files.first;
      print('FileName : ${file.name}');
      print('FileSize : ${file.size}');
      print('FileExtension : ${file.extension}');
      print('FilePath : ${file.path}');
      if (file.size > 5120) {
        print('FIle size is more');
        setState(() {
          filename2 = fileSizeError;
        });
      } else {
        setState(() {
          filename2 = file.name;
          file_size2 = file.size;
          _progressBarActive2 = true;
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
      PlatformFile file = result.files.first;
      print('FileName : ${file.name}');
      print('FileSize : ${file.size}');
      print('FileExtension : ${file.extension}');
      print('FilePath : ${file.path}');
      if (file.size > 5120) {
        print('FIle size is more');
        setState(() {
          filename3 = fileSizeError;
        });
      } else {
        setState(() {
          filename3 = file.name;
          file_size3 = file.size;
          _progressBarActive3 = true;
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
      PlatformFile file = result.files.first;
      print('FileName : ${file.name}');
      print('FileSize : ${file.size}');
      print('FileExtension : ${file.extension}');
      print('FilePath : ${file.path}');
      if (file.size > 5120) {
        print('FIle size is more');
        setState(() {
          filename4 = fileSizeError;
        });
      } else {
        setState(() {
          filename4 = file.name;
          file_size4 = file.size;
          _progressBarActive4 = true;
        });
      }
    }
    // });
    setStatus('');
  }

  chooseImage_5() async {
    // setState(() {
    // file = ImagePicker.pickImage(source: ImageSource.gallery);
    FilePickerResult result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File files = File(result.files.single.path);
      print('This is main Files : $files');
      PlatformFile file = result.files.first;
      // print('FileName : ${file.name}');
      // print('FileSize : ${file.size}');
      // print('FileExtension : ${file.extension}');
      // print('FilePath : ${file.path}');
      if (file.size > 5120) {
        print('FIle size is more');
        setState(() {
          filename5 = fileSizeError;
        });
      } else {
        setState(() {
          filename5 = file.name;
          file_size5 = file.size;
          _progressBarActive5 = true;
        });
        fileName = files.path.split('/').last;
        print('This is fileName : ${files.path}');
        // upload(fileName);
        uploadImage(files.path);
      }
    }
    // });
    setStatus('');
  }

  setStatus(String message) {
    setState(() {
      status = message;
    });
  }

  // startUpload() {
  // setStatus('Uploading Image...');
  // print("File Size lengthSync: ${tmpFile.lengthSync()}");
  // length = tmpFile.lengthSync();
  // length = length / 1024;
  // print('File Size in KB : $length');

  // if (null == tmpFile) {
  //   setStatus(errMessage);
  //   return;
  // }
  // if (length > 2000) {
  //   setStatus(fileSizeError);
  //   return;
  // }
  // String fileName = tmpFile.path.split('/').last;
  // upload(fileName);
  // uploadFile();
  // }

  upload(String fileName) {
    http.post(uploadEndPoint, body: {
      "image": base64Image,
      "name": fileName,
    }).then((result) {
      print("ImageBase64: $base64Image");
      print("FileName: $fileName");
      setStatus(result.statusCode == 200 ? result.body : errMessage);
      if (result.statusCode == 200) {
        print('This is result body ${result.body}');
      } else {
        print('This is ERROR MESSAGE');
      }
    }).catchError((error) {
      // setStatus(error);
      print(error);
    });
  }

  Future<String> uploadImage(filename) async {
    print('Print FILENAME: $filename');
    var request = http.MultipartRequest('POST', Uri.parse(uploadEndPoint));

    request.fields['filename'] = fileName;
    request.fields['isuploadFile'] = 'yes';

    request.files.add(await http.MultipartFile.fromPath('file', filename));
    var res = await request.send();
    print('Print RES: $res');

    var response = await http.Response.fromStream(res);
    print('Response code: ${response.statusCode}');
    if (response.statusCode != 200) {
      print('Result Fail:');
      return null;
    }
    print('Result Pass: ${json.decode(response.body)}');
    print('This is response: $response');
    print('This is response.body : ${response.body}');
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
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: OutlineButton(
                        onPressed: () {},
                        child: Text('Against Investigations'),
                      ),
                    ),
                    Expanded(
                      child: OutlineButton(
                        onPressed: () {},
                        child: Text('My Routine Reports'),
                      ),
                    ),
                    Expanded(
                      child: OutlineButton(
                        onPressed: () {},
                        child: Text('Lab/Hospital Upload'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    OutlineButton(
                      onPressed: chooseImage_1,
                      child: Text('Choose File 1'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            filename1 != null
                                ? Text('$filename1')
                                : SizedBox(
                                    height: 5.0,
                                  ),
                            file_size1 != null
                                ? Text('$file_size1 kB')
                                : SizedBox(
                                    height: 5.0,
                                  ),
                          ],
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        _progressBarActive1 == true
                            ? CircularProgressIndicator(
                                strokeWidth: 2,
                              )
                            : Container(),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    OutlineButton(
                      onPressed: chooseImage_2,
                      child: Text('Choose File 2'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            filename2 != null
                                ? Text('$filename2')
                                : SizedBox(
                                    height: 5.0,
                                  ),
                            file_size2 != null
                                ? Text('$file_size2 kB')
                                : SizedBox(
                                    height: 5.0,
                                  ),
                          ],
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        _progressBarActive2 == true
                            ? CircularProgressIndicator(
                                strokeWidth: 2,
                              )
                            : Container(),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    OutlineButton(
                      onPressed: chooseImage_3,
                      child: Text('Choose File 3'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            filename3 != null
                                ? Text('$filename3')
                                : SizedBox(
                                    height: 5.0,
                                  ),
                            file_size3 != null
                                ? Text('$file_size3 kB')
                                : SizedBox(
                                    height: 5.0,
                                  ),
                          ],
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        _progressBarActive3 == true
                            ? CircularProgressIndicator(
                                strokeWidth: 2,
                              )
                            : Container(),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    OutlineButton(
                      onPressed: chooseImage_4,
                      child: Text('Choose File 4'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            filename4 != null
                                ? Text('$filename4')
                                : SizedBox(
                                    height: 5.0,
                                  ),
                            file_size4 != null
                                ? Text('$file_size4 kB')
                                : SizedBox(
                                    height: 5.0,
                                  ),
                          ],
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        _progressBarActive4 == true
                            ? CircularProgressIndicator(
                                strokeWidth: 2,
                              )
                            : Container(),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    OutlineButton(
                      onPressed: chooseImage_5,
                      child: Text('Choose File 5'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            filename5 != null
                                ? Text('$filename5')
                                : SizedBox(
                                    height: 5.0,
                                  ),
                            file_size5 != null
                                ? Text('$file_size5 kB')
                                : SizedBox(
                                    height: 5.0,
                                  ),
                          ],
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        _progressBarActive5 == true
                            ? CircularProgressIndicator(
                                strokeWidth: 2,
                              )
                            : Container(),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
