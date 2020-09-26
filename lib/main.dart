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
  String status1 = '';
  String status2 = '';
  String status3 = '';
  String status4 = '';
  String status5 = '';
  String base64Image;
  File tmpFile;
  String errMessage = 'Error Uploading Image';
  String fileSizeError = 'File size is greater than 5MB';
  // var length;
  String fileName, fileName1, fileName2, fileName3, fileName4, fileName5;
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
  File files1, files2, files3, files4, files5;
  chooseImage_1() async {
    FilePickerResult result = await FilePicker.platform.pickFiles();
    if (result != null) {
      files1 = File(result.files.single.path);
      print('This is main Files 1 : $files');
      PlatformFile file = result.files.first;
      if (file.size > 5120) {
        print('FIle size is more');
        setState(() {
          filename1 = fileSizeError;
        });
      } else {
        setState(() {
          filename1 = file.name;
          file_size1 = file.size;
          // _progressBarActive1 = true;
        });
        // fileName1 = files1.path.split('/').last;
        // print('This is fileName : ${files1.path}');

        // uploadImage1(files1.path);
      }
    }

    setStatus1('');
  }

  chooseImage_2() async {
    FilePickerResult result = await FilePicker.platform.pickFiles();
    if (result != null) {
      files2 = File(result.files.single.path);
      print('This is main Files 2 : $files');
      PlatformFile file = result.files.first;
      if (file.size > 5120) {
        print('FIle size is more');
        setState(() {
          filename2 = fileSizeError;
        });
      } else {
        setState(() {
          filename2 = file.name;
          file_size2 = file.size;
          // _progressBarActive2 = true;
        });
        // fileName2 = files2.path.split('/').last;
        // print('This is fileName : ${files2.path}');

        // uploadImage2(files2.path);
      }
    }

    setStatus2('');
  }

  chooseImage_3() async {
    FilePickerResult result = await FilePicker.platform.pickFiles();
    if (result != null) {
      files3 = File(result.files.single.path);
      print('This is main Files 3 : $files');
      PlatformFile file = result.files.first;

      if (file.size > 5120) {
        print('FIle size is more');
        setState(() {
          filename3 = fileSizeError;
        });
      } else {
        setState(() {
          filename3 = file.name;
          file_size3 = file.size;
          // _progressBarActive3 = true;
        });
        // fileName3 = files4.path.split('/').last;
        // print('This is fileName : ${files4.path}');

        // uploadImage3(files4.path);
      }
    }

    setStatus3('');
  }

  chooseImage_4() async {
    FilePickerResult result = await FilePicker.platform.pickFiles();
    if (result != null) {
      files4 = File(result.files.single.path);
      print('This is main Files 4 : $files');
      PlatformFile file = result.files.first;

      if (file.size > 5120) {
        print('FIle size is more');
        setState(() {
          filename4 = fileSizeError;
        });
      } else {
        setState(() {
          filename4 = file.name;
          file_size4 = file.size;
          // _progressBarActive4 = true;
        });
        // fileName4 = files4.path.split('/').last;
        // print('This is fileName : ${files4.path}');

        // uploadImage4(files4.path);
      }
    }

    setStatus4('');
  }

  chooseImage_5() async {
    FilePickerResult result = await FilePicker.platform.pickFiles();
    if (result != null) {
      files5 = File(result.files.single.path);
      print('This is main Files 5 : $files');
      PlatformFile file = result.files.first;

      if (file.size > 5120) {
        print('FIle size is more');
        setState(() {
          filename5 = fileSizeError;
        });
      } else {
        setState(() {
          filename5 = file.name;
          file_size5 = file.size;
          // _progressBarActive5 = true;
        });
        // fileName5 = files5.path.split('/').last;
        // print('This is fileName : ${files5.path}');

        // uploadImage5(files5.path);
      }
    }

    setStatus5('');
  }

  setStatus(String message) {
    setState(() {
      status = message;
    });
  }

  setStatus1(String message) {
    setState(() {
      status1 = message;
    });
  }

  setStatus2(String message) {
    setState(() {
      status2 = message;
    });
  }

  setStatus3(String message) {
    setState(() {
      status3 = message;
    });
  }

  setStatus4(String message) {
    setState(() {
      status4 = message;
    });
  }

  setStatus5(String message) {
    setState(() {
      status5 = message;
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
  startUpload_1() {
    setState(() {
      _progressBarActive1 = true;
    });

    fileName1 = files1.path.split('/').last;
    print('This is fileName 1: ${files1.path}');

    uploadImage1(files1.path);
  }

  startUpload_2() {
    setState(() {
      _progressBarActive2 = true;
    });

    fileName2 = files2.path.split('/').last;
    print('This is fileName 2: ${files2.path}');

    uploadImage2(files2.path);
  }

  startUpload_3() {
    setState(() {
      _progressBarActive3 = true;
    });

    fileName3 = files3.path.split('/').last;
    print('This is fileName 3: ${files3.path}');

    uploadImage3(files3.path);
  }

  startUpload_4() {
    setState(() {
      _progressBarActive4 = true;
    });

    fileName4 = files4.path.split('/').last;
    print('This is fileName 4: ${files4.path}');

    uploadImage4(files4.path);
  }

  startUpload_5() {
    setState(() {
      _progressBarActive5 = true;
    });

    fileName5 = files5.path.split('/').last;
    print('This is fileName 5: ${files5.path}');

    uploadImage5(files5.path);
  }

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

  Future<String> uploadImage1(filename) async {
    var request = http.MultipartRequest('POST', Uri.parse(uploadEndPoint));
    request.fields['filename'] = fileName1;
    request.fields['isuploadFile'] = 'yes';
    request.files.add(await http.MultipartFile.fromPath('file', filename));
    var res = await request.send();
    var response = await http.Response.fromStream(res);
    print('Response code 1: ${response.statusCode}');
    if (response.statusCode != 200) {
      print('Result Fail 1:');
      return null;
    }
    setStatus1(response.statusCode == 200 ? response.body : errMessage);
    print('Result Pass 1: ${json.decode(response.body)}');
    _progressBarActive1 = false;
    return res.reasonPhrase;
  }

  Future<String> uploadImage2(filename) async {
    var request = http.MultipartRequest('POST', Uri.parse(uploadEndPoint));
    request.fields['filename'] = fileName2;
    request.fields['isuploadFile'] = 'yes';
    request.files.add(await http.MultipartFile.fromPath('file', filename));
    var res = await request.send();
    var response = await http.Response.fromStream(res);
    print('Response code 2: ${response.statusCode}');
    if (response.statusCode != 200) {
      print('Result Fail 2:');
      return null;
    }
    setStatus2(response.statusCode == 200 ? response.body : errMessage);
    print('Result Pass 2: ${json.decode(response.body)}');
    _progressBarActive2 = false;
    return res.reasonPhrase;
  }

  Future<String> uploadImage3(filename) async {
    var request = http.MultipartRequest('POST', Uri.parse(uploadEndPoint));
    request.fields['filename'] = fileName3;
    request.fields['isuploadFile'] = 'yes';
    request.files.add(await http.MultipartFile.fromPath('file', filename));
    var res = await request.send();
    var response = await http.Response.fromStream(res);
    print('Response code 3: ${response.statusCode}');
    if (response.statusCode != 200) {
      print('Result Fail 3:');
      return null;
    }
    setStatus3(response.statusCode == 200 ? response.body : errMessage);
    print('Result Pass 3: ${json.decode(response.body)}');
    _progressBarActive3 = false;
    return res.reasonPhrase;
  }

  Future<String> uploadImage4(filename) async {
    var request = http.MultipartRequest('POST', Uri.parse(uploadEndPoint));
    request.fields['filename'] = fileName4;
    request.fields['isuploadFile'] = 'yes';
    request.files.add(await http.MultipartFile.fromPath('file', filename));
    var res = await request.send();
    var response = await http.Response.fromStream(res);
    print('Response code 4: ${response.statusCode}');
    if (response.statusCode != 200) {
      print('Result Fail 4:');
      return null;
    }
    setStatus4(response.statusCode == 200 ? response.body : errMessage);
    print('Result Pass 4: ${json.decode(response.body)}');
    _progressBarActive4 = false;
    return res.reasonPhrase;
  }

  Future<String> uploadImage5(filename) async {
    // print('Print FILENAME: $filename');
    var request = http.MultipartRequest('POST', Uri.parse(uploadEndPoint));
    request.fields['filename'] = fileName5;
    request.fields['isuploadFile'] = 'yes';
    request.files.add(await http.MultipartFile.fromPath('file', filename));
    var res = await request.send();
    var response = await http.Response.fromStream(res);
    print('Response code 5: ${response.statusCode}');
    if (response.statusCode != 200) {
      print('Result Fail 5:');
      return null;
    }
    setStatus5(response.statusCode == 200 ? response.body : errMessage);
    print('Result Pass 5: ${json.decode(response.body)}');
    _progressBarActive5 = false;
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
        body: SingleChildScrollView(
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
                        Expanded(
                          child: Column(
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
                              Text(
                                status1,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 13.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 4.0,
                        ),
                        _progressBarActive1 == true
                            ? CircularProgressIndicator(
                                strokeWidth: 2,
                              )
                            : Container(),
                        SizedBox(
                          width: 4.0,
                        ),
                        ButtonTheme(
                          minWidth: 10.0,
                          height: 30.0,
                          child: RaisedButton(
                            onPressed: startUpload_1,
                            textColor: Colors.white,
                            color: Colors.green,
                            child: Text('Upload'),
                          ),
                        ),
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
                        Expanded(
                          child: Column(
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
                              Text(
                                status2,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 13.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        _progressBarActive2 == true
                            ? CircularProgressIndicator(
                                strokeWidth: 2,
                              )
                            : Container(),
                        SizedBox(
                          width: 4.0,
                        ),
                        ButtonTheme(
                          minWidth: 10.0,
                          height: 30.0,
                          child: RaisedButton(
                            onPressed: startUpload_2,
                            textColor: Colors.white,
                            color: Colors.green,
                            child: Text('Upload'),
                          ),
                        ),
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
                        Expanded(
                          child: Column(
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
                              Text(
                                status3,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 13.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        _progressBarActive3 == true
                            ? CircularProgressIndicator(
                                strokeWidth: 2,
                              )
                            : Container(),
                        SizedBox(
                          width: 4.0,
                        ),
                        ButtonTheme(
                          minWidth: 10.0,
                          height: 30.0,
                          child: RaisedButton(
                            onPressed: startUpload_3,
                            textColor: Colors.white,
                            color: Colors.green,
                            child: Text('Upload'),
                          ),
                        ),
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
                        Expanded(
                          child: Column(
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
                              Text(
                                status4,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 13.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        _progressBarActive4 == true
                            ? CircularProgressIndicator(
                                strokeWidth: 2,
                              )
                            : Container(),
                        SizedBox(
                          width: 4.0,
                        ),
                        ButtonTheme(
                          minWidth: 10.0,
                          height: 30.0,
                          child: RaisedButton(
                            onPressed: startUpload_4,
                            textColor: Colors.white,
                            color: Colors.green,
                            child: Text('Upload'),
                          ),
                        ),
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
                        Expanded(
                          child: Column(
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
                              Text(
                                status5,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 13.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        _progressBarActive5 == true
                            ? CircularProgressIndicator(
                                strokeWidth: 2,
                              )
                            : Container(),
                        SizedBox(
                          width: 4.0,
                        ),
                        ButtonTheme(
                          minWidth: 10.0,
                          height: 30.0,
                          child: RaisedButton(
                            onPressed: startUpload_5,
                            textColor: Colors.white,
                            color: Colors.green,
                            child: Text('Upload'),
                          ),
                        ),
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
