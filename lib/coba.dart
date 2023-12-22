import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:http/http.dart' as http;

class GetImageExample extends StatefulWidget {
  const GetImageExample({super.key});

  @override
  State<GetImageExample> createState() => _GetImageExampleState();
}

class _GetImageExampleState extends State<GetImageExample> {
  File? _image;
  List _images = [];

  final picker = ImagePicker();
  TextEditingController namaController = TextEditingController();

  Future sendImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);
    var uri = "http://192.168.123.34/e-commerce/coba.php";
    var request = http.MultipartRequest('POST', Uri.parse(uri));
    if (img != null) {
      var pic = await http.MultipartFile.fromPath("image", img.path);

      request.files.add(pic);

      await request.send().then((result) {
        http.Response.fromStream(result).then((response) {
          var message = jsonDecode(response.body);

          // show snackbar if input data successfully
          final snackBar = SnackBar(content: Text(message['message']));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);

          //get new list images
        });
      }).catchError((e) {
        print(e);
      });
    }
  }

  Future getImageServer() async {
    try {
      final response = await http.get(Uri.parse(
          'http://192.168.123.34/e-commerce/read_coba.php'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        setState(() {
          _images = data;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    getImageServer();
  }

  // Future choiceImage() async {
  //   var pickedImage = await picker.pickImage(source: ImageSource.gallery);
  //   setState(() {
  //     _image = File(pickedImage!.path);
  //   });
  // }

  // Future uploadImage() async {
  //   final uri = Uri.parse('http://192.168.123.34/e-commerce/coba.php');
  //   var request = http.MultipartRequest('POST', uri);
  //   // request.fields['name'] = namaController.text;
  //   var pic = await http.MultipartFile.fromPath('gambar', _image!.path);
  //   request.files.add(pic);
  //   try {
  //     var respone = await request.send().then((result) {
  //       http.Response.fromStream(result).then((response) {
  //         var message = jsonDecode(response.body);
  //         final snackbar = SnackBar(content: Text(message['message']));
  //         ScaffoldMessenger.of(context).showSnackBar(snackbar);
  //       });
  //     });

  //     if (respone.statusCode == 200) {
  //       debugPrint('Image Uploaded. ${respone.statusCode}');
  //     } else {
  //       debugPrint('Image Not Uploaded. ${respone.statusCode}');
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Upload Gambar'),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          TextField(
            controller: namaController,
            decoration: const InputDecoration(labelText: 'Nama'),
          ),
          // IconButton(
          //   onPressed: () {
          //     choiceImage();
          //   },
          //   icon: const Icon(Icons.browse_gallery),
          // ),
          // ignore: unnecessary_null_comparison
          _image == null
              ? const Text('Not Image Selected')
              : Image.file(_image!),
          ElevatedButton(
              onPressed: () {
                sendImage(ImageSource.gallery);
              },
              child: const Text('Upload Image')),
          _images.length != 0
              ? GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: _images.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: Image(
                        image: NetworkImage(
                            'http://192.168.123.34/e-commerce/p/' +
                                _images[index]['image']),
                        fit: BoxFit.cover,
                      ),
                    );
                  })
              : const Center(
                  child: Text("No Image"),
                )
        ])));
  }
}
