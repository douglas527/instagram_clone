// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element, unused_field

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/utilis/colors.dart';
import 'package:instagram_clone/utilis/utils.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  Uint8List? _file;

  _selectImage(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text('Create a post'),
            children: [
              SimpleDialogOption(
                  padding: const EdgeInsets.all(20),
                  child: const Text('Take a photo'),
                  onPressed: () async {
                    Navigator.of(context).pop();
                    Uint8List file = await pickImage(
                      ImageSource.camera,
                    );
                    setState(() {
                      _file = file;
                    });
                  }),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    //return Center(
    //child: IconButton(
    //icon: const Icon(Icons.upload),
    //onPressed: () {},
    //),
    //);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgrouundColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: const Text('Post to'),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'post',
              style: TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1653781509531-c0f1cd64c223?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxN3x8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60'),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Write a Caption...',
                    border: InputBorder.none,
                  ),
                  maxLines: 8,
                ),
              ),
              SizedBox(
                height: 45,
                width: 45,
                child: AspectRatio(
                  aspectRatio: 487 / 451,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://images.unsplash.com/photo-1653841305515-737c52ac55a3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw5MXx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60'),
                        fit: BoxFit.fill,
                        alignment: FractionalOffset.topCenter,
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(),
            ],
          ),
        ],
      ),
    );
  }
}
