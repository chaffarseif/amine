import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'addtache.dart';

class affichage extends StatefulWidget {
  const affichage({super.key});
  @override
  State<affichage> createState() => affichageid();
}

class affichageid extends State<affichage> {
  var taches = ["call me", "fonction ajout"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('liste des taches',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        )),
      ),
      body: ListView.builder(
        itemBuilder: _list,
        itemCount: taches.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {Get.to(() => addtache())},
        backgroundColor: Colors.black,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

Widget _list(c, i) {
  return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
          height: Get.height / 7,
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
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 25.0),
              child: Column(children: [
                Text('Title',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, top: 20, bottom: 20.0),
              child: Row(
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                  IconButton(onPressed: () => {}, icon: Icon(Icons.edit)),
                ],
              ),
            ),
          ])));
}
