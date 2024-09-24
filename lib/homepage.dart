import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task1/firebase_logic/firebase_firestore_logic.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late Stream CoursesStream;

  initStream()async{
    CoursesStream = await FirebaseFirestoreLogic().getCoursesList();
  }

  @override
  void initState() {
    initStream();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final QueryWidth = MediaQuery.of(context).size.width;
    final QueryHeight = MediaQuery.of(context).size.height;
    return Scaffold(
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
              color: Colors.amberAccent,
            ),
            child: Center(child:Text("List of curses", style: TextStyle(fontSize: QueryHeight/20),),)
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
                  itemCount: 4,
                  separatorBuilder: (context,index)=> Padding(padding: EdgeInsets.fromLTRB(0, QueryHeight/50, 0, 0)),
                  itemBuilder: (context,index){
                    return SizedBox(
                      height: QueryHeight/2.55,
                      width:QueryWidth/1.05,
                      child:Center(child:ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: false,
                      itemCount: 3,
                      separatorBuilder: (context,index2)=>Padding(padding: EdgeInsets.fromLTRB(QueryWidth/20, 0, 0, 0)),
                      itemBuilder: (context,index2){
                        return Container(
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
                            color: Colors.amberAccent,
                          ),
                          child: const Text("Mamy Ebal"),
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
