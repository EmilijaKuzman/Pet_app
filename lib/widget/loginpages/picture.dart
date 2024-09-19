import 'dart:io';

import 'package:aplikacija/bloc/pet_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class PicturePage extends StatefulWidget {
  const PicturePage({super.key});

  @override
  State<PicturePage> createState() => _PicturePageState();
}

class _PicturePageState extends State<PicturePage> {
  //File? _image;
  final picker = ImagePicker();

//Image Picker function to get image from gallery
  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    //.getImage(source: ImageSource.gallery);

    // setState(() {
    if (pickedFile != null) {
      final image = File(pickedFile.path);
      if (mounted) {
        context.read<PetBloc>().add(
              AddPictureEvent(image: image),
            );
      }
    }
    // });
  }

//Image Picker function to get image from camera
  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    //setState(() {
    if (pickedFile != null) {
      final image = File(pickedFile.path);
      if (mounted) {
        context.read<PetBloc>().add(
              AddPictureEvent(image: image),
            );
      }
    }
    // });
  }

  Future showOptions() async {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            child: Text('Photo Gallery'),
            onPressed: () {
              // close the options modal
              Navigator.of(context).pop();
              // get image from gallery
              getImageFromGallery();
            },
          ),
          CupertinoActionSheetAction(
            child: Text('Camera'),
            onPressed: () {
              // close the options modal
              Navigator.of(context).pop();
              // get image from camera
              getImageFromCamera();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Color.fromARGB(255, 255, 220, 132),
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Add picture",
                style: TextStyle(
                    //backgroundColor: Color.fromARGB(255, 255, 220, 132),
                    fontSize: 30,
                    color: Color.fromARGB(255, 102, 183, 187)),
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<PetBloc, PetState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: showOptions,
                        child: state.newPet.petsImage == null
                            ? Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Color.fromARGB(202, 118, 122, 122),
                                    ),
                                    margin: EdgeInsets.all(10),
                                    width: double.infinity,
                                    height: 400,
                                    child: const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.add,
                                          size: 70,
                                          color: Color.fromARGB(
                                              223, 255, 220, 132),
                                        ),
                                        Text(
                                          'Select Image',
                                          style: TextStyle(
                                            fontSize: 22,
                                            color: Color.fromARGB(
                                                255, 255, 220, 132),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Text(
                                    'No Image selected',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color.fromARGB(255, 255, 88, 82),
                                    ),
                                  )
                                ],
                              )
                            : Image.file(
                                state.newPet.petsImage!,
                                width: 1000,
                                //  height: 450,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
