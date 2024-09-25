import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:task1/coursepage.dart';
import 'package:task1/firebase_logic/firebase_firestore_logic.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late Stream CoursesStream = Stream.empty();
  late String name,description,image;
  late int lessons;
  CoursesStreamInitial()async{
    CoursesStream = await FirebaseFirestoreLogic().getCoursesList().whenComplete((){setState(() {});});
  }



  @override
  void initState() {
    CoursesStreamInitial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final QueryWidth = MediaQuery.of(context).size.width;
    final QueryHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(136, 59, 40, 40),
      body:SizedBox(
        height: QueryHeight,
        width: QueryWidth,
        child:ListView(
        shrinkWrap: false,
        children: [ 
        Center(child:
          Container(
            width: QueryWidth/1.5,
            height: QueryHeight/10,
            constraints: const BoxConstraints(
              minHeight: 30,
              maxHeight: 100,
              minWidth: 100,
              maxWidth: 500,
            ),
            decoration: BoxDecoration(
              border: Border.all(width: 0.5),
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 90, 69, 83),
            ),
            child: Center(child:Text("List of curses", style: TextStyle(fontSize: QueryHeight/20, color: const Color.fromARGB(255, 222, 201, 255)),),)
          ),
        ),


        Padding(padding: EdgeInsets.fromLTRB(0, QueryHeight/50, 0, 0)),
        Center(child:
          SizedBox(
            width:QueryWidth/1.05,
            child:StreamBuilder(
              stream: CoursesStream,
              builder: (context,snapshot){
              return snapshot.hasData?
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: (snapshot.data.docs.length/3).ceil(),
                  separatorBuilder: (context,index)=> Padding(padding: EdgeInsets.fromLTRB(0, QueryHeight/50, 0, 0)),
                  itemBuilder: (context,index){
                    return SizedBox(
                      height: QueryHeight/2.55,
                      width:QueryWidth/1.05,
                      child:Center(child:ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: false,
                      itemCount: snapshot.data.docs.length -(snapshot.data.docs.length-9) ,
                      separatorBuilder: (context,index2)=>Padding(padding: EdgeInsets.fromLTRB(QueryWidth/20, 0, 0, 0)),
                      itemBuilder: (context,index2){
                        DocumentSnapshot DsU = snapshot.data.docs[index*3+index2];
                        String? CourseNameNullable, CourseImageNullable,CourseDescriptionNullable;
                        int? CourseLessonsNullable;
                        try{
                          CourseNameNullable = DsU['name'];
                          CourseImageNullable = DsU['image'];
                          CourseDescriptionNullable = DsU['description'];
                          CourseLessonsNullable = DsU['lessons'];
                        }catch(e){
                          debugPrint("Catched an error");
                        }
                        return  InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CoursePage(name: CourseNameNullable, description: CourseDescriptionNullable, image: CourseImageNullable, lessons: CourseLessonsNullable)));
                          },
                          child: Container(
                            
                          width: QueryWidth/3.56,
                          height: QueryHeight/2.55,
                          constraints: const BoxConstraints(
                            minHeight: 150,
                            maxHeight: 500,
                            minWidth: 100,
                            maxWidth: 500,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(width: 0.5),
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(255, 90, 69, 83),
                          ),
                          child:Column(children:[ 
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: 
                              CourseImageNullable!=null?Image.network(
                                alignment: Alignment.topCenter,
                                height: (QueryHeight/2.55)/2.3,
                                width: QueryHeight/2.55,
                                fit: BoxFit.fill,
                                CourseImageNullable
                              ):Image.network(
                                "https://avatars.mds.yandex.net/i?id=9576ac4e5121ba912290d0a77941aced3ec05e7f-12378875-images-thumbs&n=13"
                              ),
                            ),
                            CourseNameNullable!=null?Text(CourseNameNullable,style: TextStyle(fontSize: (QueryHeight * QueryWidth)/((QueryHeight+QueryWidth)*16.5),color: const Color.fromARGB(255, 222, 201, 255))):Text("en error", style: TextStyle(fontSize: (QueryHeight * QueryWidth)/((QueryHeight+QueryWidth)*16.5),color: const Color.fromARGB(255, 222, 201, 255))),
                            
                            CourseDescriptionNullable!=null?Text(CourseDescriptionNullable.substring(0,75)+"...", style: TextStyle(fontSize: (QueryHeight * QueryWidth)/((QueryHeight+QueryWidth)*23),color: const Color.fromARGB(255, 222, 201, 255))):Text("err", style: TextStyle(fontSize: (QueryHeight * QueryWidth)/((QueryHeight+QueryWidth)*23),color: const Color.fromARGB(255, 222, 201, 255))),
                            ]
                            
                            ),
                          ),
                        );
                        },
                      ),
                    )
                  );
                  },
                )

                :CircleAvatar();


                }
              )
            )
          )
        ]
        )
      )
    );
  }
}
