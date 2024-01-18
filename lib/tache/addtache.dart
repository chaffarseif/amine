import 'package:ds_mobile/tache/affichage.dart';
import 'package:ds_mobile/tache/sqldb.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class addtache extends StatefulWidget {
  const addtache({super.key});
  @override
  State<addtache> createState() => add();
}

class add extends State<addtache> {
  TextEditingController TitleController = TextEditingController();
  bool isComplited = false;
  tachedb db = tachedb();
  insert() {
    if (TitleController.text.isNotEmpty) {
      db.insert(TitleController.text);
      Get.to(() => affichage());
      Get.snackbar("ok", "ajout valide");
    } else {
      Get.snackbar("oops", "3abi lblayes");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('add Client',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Get.back();
            },
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          )),
        ),
        backgroundColor: Colors.grey[300],
        body: SafeArea(
            child: Center(
                child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Container(
              width: Get.width * 0.85,
              height: Get.height * 0.8,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade600,
                        blurRadius: 10,
                        spreadRadius: 1,
                        offset: Offset(4, 4))
                  ]),
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20, left: 30.0, right: 30.0),
                        child: TextField(
                            controller: TitleController,
                            decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12))),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade400)),
                              labelText: "title",
                              hintText: "title",
                            )),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 30.0, right: 30.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Radio(
                                      value: 1,
                                      groupValue: 1,
                                      onChanged: (value) {
                                        isComplited = true;
                                      },
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text("complited"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Radio(
                                      value: 2,
                                      groupValue: 1,
                                      onChanged: (value) {
                                        isComplited = false;
                                      },
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text("Not complited"),
                                  ],
                                )
                              ])),
                      Padding(
                          padding: const EdgeInsets.only(
                              top: 20.0, left: 30.0, right: 30.0),
                          child: GestureDetector(
                            onTap: () => insert(),
                            child: Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(12)),
                                child: const Center(
                                  child: Text('add to tache',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      )),
                                )),
                          )),
                      SizedBox(
                        height: 20,
                      )
                    ]),
              )),
        ))));
  }
}
