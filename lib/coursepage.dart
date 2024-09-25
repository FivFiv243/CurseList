import 'package:flutter/material.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key,required this.name,required this.description,required this.image, required this.lessons});

  final String? name,description,image;
  final int? lessons;

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  @override
  Widget build(BuildContext context) {
    final QueryWidth = MediaQuery.of(context).size.width;
    final QueryHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(136, 59, 40, 40),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 46, 36, 45),
        leading: IconButton(onPressed: (){Navigator.of(context).pop();}, icon: Icon(Icons.arrow_back, color: const Color.fromARGB(255, 222, 201, 255)),
        )
      ),
      body: SafeArea(
        child: ListView(children: [
        Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadiusDirectional.vertical(bottom: Radius.circular(30)),
              child: Container(
                height: QueryHeight/2,
                width: QueryWidth,
                child: widget.image!=null?Image.network(
                  height: QueryHeight/2,
                  width: QueryWidth,
                  fit: BoxFit.cover,
                  widget.image!):Image.network(
                    height: QueryHeight/2,
                    width: QueryWidth,
                    fit: BoxFit.cover,
                    "https://avatars.mds.yandex.net/i?id=9576ac4e5121ba912290d0a77941aced3ec05e7f-12378875-images-thumbs&n=13"),
              ),
            ),

                widget.name!=null?Text(widget.name!, style: TextStyle(fontSize: (QueryHeight * QueryWidth)/((QueryHeight+QueryWidth)*10.5), color: const Color.fromARGB(255, 222, 201, 255)),)
                :Text("enn error", style: TextStyle(fontSize: (QueryHeight * QueryWidth)/((QueryHeight+QueryWidth)*10.5), color: const Color.fromARGB(255, 222, 201, 255)),),
                Padding(padding: EdgeInsets.fromLTRB(0, QueryHeight/75, 0, 0)),
              Container(
                width: QueryWidth/1.15,
                child:widget.description!=null?Text(widget.description!, style: TextStyle(fontSize: (QueryHeight * QueryWidth)/((QueryHeight+QueryWidth)*20.5), color: const Color.fromARGB(255, 222, 201, 255)),)
                :Text("enn error description", style: TextStyle(fontSize: (QueryHeight * QueryWidth)/((QueryHeight+QueryWidth)*20.5), color: const Color.fromARGB(255, 222, 201, 255)),)
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, QueryHeight/75, 0, 0)),
              Container(
                width: QueryWidth/1.15,
                child:widget.lessons!=null?Text("Колличество уроков : " + widget.lessons.toString(), style: TextStyle(fontSize: (QueryHeight * QueryWidth)/((QueryHeight+QueryWidth)*10.5), color: const Color.fromARGB(255, 222, 201, 255)),)
                :Text("lessons form error", style: TextStyle(fontSize: (QueryHeight * QueryWidth)/((QueryHeight+QueryWidth)*10.5), color: const Color.fromARGB(255, 222, 201, 255)),)
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, QueryHeight/75, 0, 0)),
              ],
            )
          ]
        )
      ),
    );
  }
}