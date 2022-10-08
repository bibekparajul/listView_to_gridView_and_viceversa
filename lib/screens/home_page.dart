import 'package:flutter/material.dart';
//ignore_for_file:prefer_const_constructors

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isGrid = true;

  List<String> items = [
    'bbek',
    'bibek',
    'bicheri',
    'bhagawati',
    'bishal',
    'sanskar',
    'govinda',
    'saraswati',
    'ramita',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
        backgroundColor: Colors.grey,
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              
                
                setState(() {
                  isGrid = !isGrid;
                });
            },
          )
        ]
        ,
      ),

//this is for listView

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: buildList(),
      ),

// body: Padding(padding: EdgeInsets.all(5),
// child: Container(
//   padding: EdgeInsets.all(12),
//   child:   GridView.builder(gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//   itemCount: 9,

//   itemBuilder: (context, index){

//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         // color: Colors.purple

//       ),
//       child: Card(

//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),

//         elevation: 3.0,

//         child: GridTile(child: Center(child: Text("Hello")),
//         header: Icon(Icons.favorite),
//         footer: Column(
//           children: [
//             Icon(Icons.face),
//             Text("hey")
//           ],
//         ),

//         ),

//       ),
//     );

//   }),
// ),),
    );
  }

  Widget buildList() => isGrid
      ? GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            final item = items[index];
            return InkWell(
              onTap: () => selectItem(item),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Colors.black26,
                elevation: 3.0,
                child: GridTile(
                  footer: Column(children: [
                    Icon(Icons.face),
                  ]),
                  header: Icon(Icons.favorite_outline),
                  child: Center(
                      child: Text(
                    '$item',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
                ),
              ),
            );
          })
      : ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            final item = items[index];
            Padding(padding: EdgeInsets.all(10));
            return Card(
              elevation: 3.0,
              child: ListTile(
                contentPadding: EdgeInsets.only(right: 9),
                leading: Icon(Icons.favorite_outline),
                title: Text("Welcome To the text $index"),
                subtitle: Text(item),
                trailing: Text(
                  "Hey",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
                onTap: () => selectItem(item),
              ),
            );
          });

  void selectItem(String item) {
    final snackBar = SnackBar(content: Text('You have Selected $item'));
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
