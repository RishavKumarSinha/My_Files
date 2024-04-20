import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomepageWidget(),
  ));
}

class FileItem extends StatelessWidget {
  final String title;
  final String iconPath;
  const FileItem({
    Key? key,
    required this.title,
    required this.iconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(232, 232, 232, 0.25),
            offset: Offset(15, 20),
            blurRadius: 45,
          ),
        ],
        color: Colors.white,
        border: Border.all(
          color: Color.fromRGBO(68, 56, 216, 1),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Image.asset(
            iconPath,
            width: 20,
            height: 20,
            fit: BoxFit.contain,
          ),
          SizedBox(width: 20),
          Text(
            title,
            style: TextStyle(
              color: Color.fromRGBO(107, 105, 105, 1),
              fontFamily: 'Sofia Sans',
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

class HomepageWidget extends StatelessWidget {
  final List<Map<String, String>> files = [
    {'title': 'assets', 'iconPath': 'assets/folder.png'},
    {'title': 'pdfs', 'iconPath': 'assets/folder.png'},
    {'title': 'certificates', 'iconPath': 'assets/folder.png'},
    {'title': 'Downloads', 'iconPath': 'assets/folder.png'},
    {'title': 'Documents', 'iconPath': 'assets/folder.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF6048F1),
        title: Text(
          'My Directory',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.white,
            size: 40,
          ),
          onPressed: () {
          },
        ),
        actions: [
          Image.asset('assets/logo.png', height: 40,),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HorizontallistWidget(
            title: 'Recently Uploaded',
            items: [
              {'text': 'Desktop', 'imagePath': 'assets/Diamond1.png'},
              {'text': 'Mobile', 'imagePath': 'assets/Diamond1.png'},
              {'text': 'Web', 'imagePath': 'assets/Diamond1.png'},
              {'text': 'Abc', 'imagePath': 'assets/Diamond1.png'},
            ],
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Files',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(20.0),
              itemCount: files.length,
              itemBuilder: (context, index) {
                final file = files[index];
                return FileItem(
                  title: file['title']!,
                  iconPath: file['iconPath']!,
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        shape: CircleBorder(),
        backgroundColor: Color(0xFF6048F1),
      ),
    );
  }
}





class HorizontallistWidget extends StatelessWidget {
  final String title;
  final List<Map<String, String>> items;

  HorizontallistWidget({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 20, bottom: 10),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (var item in items) _buildItem(item['text']!, item['imagePath']!),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildItem(String text, String imagePath) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color.fromRGBO(247, 247, 247, 1),
            ),
            padding: EdgeInsets.all(35),
            child: Image.asset(
              imagePath,
              width: 50,
              height: 50,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 10),
          Text(
            text,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 1),
              fontFamily: 'Sofia Sans',
              fontSize: 20,
              letterSpacing: 0,
              fontWeight: FontWeight.normal,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}


