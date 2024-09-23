import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    final QueryWidth = MediaQuery.of(context).size.width;
    final QueryHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body:SizedBox(
        height: QueryHeight,
        width: QueryWidth,
        child:   
      ListView(
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
          ListView.separated(
            shrinkWrap: true,
            itemCount: 5,
            separatorBuilder: (context,index)=>const Divider(),
            itemBuilder: (context,index){
              return SizedBox(
                height: QueryHeight/9.5,
                width:QueryWidth,
                child:
              ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 5,
                separatorBuilder: (context,index2)=>Padding(padding: EdgeInsets.fromLTRB(QueryWidth/20, 0, 0, 0)),
                itemBuilder: (context,index2){
                  return Container(
                    width: QueryWidth/8,
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
                    child: const Text("Mamy Ebal"),
                    );
                  },
                ),
              );
            },
          ),
        ]
        )
      )
    );
  }
}
