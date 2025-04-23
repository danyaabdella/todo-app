// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:jwt_decoder/jwt_decoder.dart';
// import 'package:velocity_x/velocity_x.dart';
// import 'package:http/http.dart' as http;
// import 'Config.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';

// class Dashboard extends StatefulWidget {
//   final token;
//   const Dashboard({@required this.token, Key? key}) : super(key: key);

//   @override
//   State<Dashboard> createState() => _DashboardState();
// }

// class _DashboardState extends State<Dashboard> {
//   late String userId;
//   TextEditingController _todoTitle = TextEditingController();
//   TextEditingController _todoDesc = TextEditingController();
//   List? items;

//   @override
//   void initState() {
//     super.initState();
//     Map<String, dynamic> jwtDecodedToken = JwtDecoder.decode(widget.token);
//     userId = jwtDecodedToken['_id'];
//     getTodoList(userId);
//   }

//   void addTodo() async {
//     if (_todoTitle.text.isNotEmpty && _todoDesc.text.isNotEmpty) {
//       var regBody = {
//         "userId": userId,
//         "title": _todoTitle.text,
//         "desc": _todoDesc.text,
//       };

//       var response = await http.post(
//         Uri.parse(addtodo),
//         headers: {"Content-Type": "application/json"},
//         body: jsonEncode(regBody),
//       );

//       var jsonResponse = jsonDecode(response.body);

//       if (jsonResponse['status']) {
//         _todoDesc.clear();
//         _todoTitle.clear();
//         Navigator.pop(context);
//         getTodoList(userId);
//       }
//     }
//   }

//   void getTodoList(userId) async {
//     var regBody = {"userId": userId};

//     var response = await http.post(
//       Uri.parse(getToDoList),
//       headers: {"Content-Type": "application/json"},
//       body: jsonEncode(regBody),
//     );

//     var jsonResponse = jsonDecode(response.body);
//     items = jsonResponse['success'];

//     setState(() {});
//   }

//   void deleteItem(id) async {
//     var regBody = {"id": id};

//     var response = await http.post(
//       Uri.parse(deleteTodo),
//       headers: {"Content-Type": "application/json"},
//       body: jsonEncode(regBody),
//     );

//     var jsonResponse = jsonDecode(response.body);
//     if (jsonResponse['status']) {
//       getTodoList(userId);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.lightBlueAccent,
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             padding: EdgeInsets.only(
//               top: 60.0,
//               left: 30.0,
//               right: 30.0,
//               bottom: 30.0,
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 CircleAvatar(
//                   child: Icon(Icons.list, size: 30.0),
//                   backgroundColor: Colors.white,
//                   radius: 30.0,
//                 ),
//                 SizedBox(height: 10.0),
//                 Text(
//                   'ToDo with NodeJS + Mongodb',
//                   style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),
//                 ),
//                 SizedBox(height: 8.0),
//                 Text('5 Task', style: TextStyle(fontSize: 20)),
//               ],
//             ),
//           ),
//           Expanded(
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(20),
//                   topRight: Radius.circular(20),
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child:
//                     items == null
//                         ? null
//                         : ListView.builder(
//                           itemCount: items!.length,
//                           itemBuilder: (context, int index) {
//                             return Slidable(
//                               key: const ValueKey(0),
//                               endActionPane: ActionPane(
//                                 motion: const ScrollMotion(),
//                                 dismissible: DismissiblePane(
//                                   onDismissed: () {},
//                                 ),
//                                 children: [
//                                   SlidableAction(
//                                     backgroundColor: Color(0xFFFE4A49),
//                                     foregroundColor: Colors.white,
//                                     icon: Icons.delete,
//                                     label: 'Delete',
//                                     onPressed: (BuildContext context) {
//                                       deleteItem('${items![index]['_id']}');
//                                     },
//                                   ),
//                                 ],
//                               ),
//                               child: Card(
//                                 borderOnForeground: false,
//                                 child: ListTile(
//                                   leading: Icon(Icons.task),
//                                   title: Text('${items![index]['title']}'),
//                                   subtitle: Text('${items![index]['desc']}'),
//                                   trailing: Icon(Icons.arrow_back),
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//               ),
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => _displayTextInputDialog(context),
//         child: Icon(Icons.add),
//         tooltip: 'Add-ToDo',
//       ),
//     );
//   }

//   Future<void> _displayTextInputDialog(BuildContext context) async {
//     return showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Add To-Do'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 controller: _todoTitle,
//                 keyboardType: TextInputType.text,
//                 decoration: InputDecoration(
//                   filled: true,
//                   fillColor: Colors.white,
//                   hintText: "Title",
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                   ),
//                 ),
//               ).p4().px8(),
//               TextField(
//                 controller: _todoDesc,
//                 keyboardType: TextInputType.text,
//                 decoration: InputDecoration(
//                   filled: true,
//                   fillColor: Colors.white,
//                   hintText: "Description",
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                   ),      
//                 ),
//               ).p4().px8(),
//               ElevatedButton(onPressed: () => addTodo(), child: Text("Add")),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;
import 'config.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Dashboard extends StatefulWidget {
  final token;
  const Dashboard({@required this.token, Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late String userId;
  TextEditingController _todoTitle = TextEditingController();
  TextEditingController _todoDesc = TextEditingController();
  List? items;

  @override
  void initState() {
    super.initState();
    Map<String, dynamic> jwtDecodedToken = JwtDecoder.decode(widget.token);
    userId = jwtDecodedToken['_id'];
    getTodoList(userId);
  }

  void addTodo() async {
    if (_todoTitle.text.isNotEmpty && _todoDesc.text.isNotEmpty) {
      var regBody = {
        "userId": userId,
        "title": _todoTitle.text,
        "desc": _todoDesc.text,
      };

      var response = await http.post(
        Uri.parse(addtodo),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(regBody),
      );

      var jsonResponse = jsonDecode(response.body);

      if (jsonResponse['status']) {
        _todoDesc.clear();
        _todoTitle.clear();
        Navigator.pop(context);
        getTodoList(userId);
      }
    }
  }

  void getTodoList(userId) async {
    var regBody = {"userId": userId};

    var response = await http.post(
      Uri.parse(getToDoList),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(regBody),
    );

    var jsonResponse = jsonDecode(response.body);
    items = jsonResponse['success'];

    setState(() {});
  }

  void deleteItem(id) async {
    var regBody = {"id": id};

    var response = await http.post(
      Uri.parse(deleteTodo),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(regBody),
    );

    var jsonResponse = jsonDecode(response.body);
    if (jsonResponse['status']) {
      getTodoList(userId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 60.0,
              left: 30.0,
              right: 30.0,
              bottom: 30.0,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blueAccent, Colors.lightBlue],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  child: Icon(Icons.list, size: 30.0, color: Colors.blueAccent),
                  backgroundColor: Colors.white,
                  radius: 30.0,
                ).animate().scale(delay: 200.ms),
                SizedBox(height: 10.0),
                Text(
                  'To-Do List',
                  style: GoogleFonts.poppins(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  '${items?.length ?? 0} Tasks',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: items == null
                    ? Center(child: CircularProgressIndicator())
                    : items!.isEmpty
                        ? Center(
                            child: Text(
                              'No tasks yet!',
                              style: GoogleFonts.poppins(fontSize: 18),
                            ),
                          )
                        : ListView.builder(
                            itemCount: items!.length,
                            itemBuilder: (context, int index) {
                              return Slidable(
                                key: ValueKey(items![index]['_id']),
                                endActionPane: ActionPane(
                                  motion: ScrollMotion(),
                                  children: [
                                    SlidableAction(
                                      backgroundColor: Colors.redAccent,
                                      foregroundColor: Colors.white,
                                      icon: Icons.delete,
                                      label: 'Delete',
                                      onPressed: (BuildContext context) {
                                        deleteItem('${items![index]['_id']}');
                                      },
                                    ),
                                  ],
                                ),
                                child: Card(
                                  elevation: 4,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: ListTile(
                                    leading: Icon(Icons.task_alt,
                                        color: Colors.blueAccent),
                                    title: Text(
                                      '${items![index]['title']}',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600),
                                    ),
                                    subtitle: Text(
                                      '${items![index]['desc']}',
                                      style: GoogleFonts.poppins(
                                          color: Colors.grey[600]),
                                    ),
                                    trailing: Icon(Icons.arrow_forward_ios,
                                        size: 16),
                                  ),
                                ).animate().fadeIn(delay: (100 * index).ms),
                              ).pOnly(bottom: 8);
                            },
                          ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _displayTextInputDialog(context),
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.blueAccent,
        tooltip: 'Add Task',
      ).animate().scale(delay: 400.ms),
    );
  }

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(
            'Add New Task',
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _todoTitle,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: "Task Title",
                  hintStyle: GoogleFonts.poppins(),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ).p4(),
              TextField(
                controller: _todoDesc,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: "Description",
                  hintStyle: GoogleFonts.poppins(),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ).p4(),
              ElevatedButton(
                onPressed: () => addTodo(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
                child: Text(
                  "Add Task",
                  style: GoogleFonts.poppins(color: Colors.white),
                ),
              ),
            ],
          ),
        ).animate().slideY(begin: 0.2, end: 0.0, duration: 300.ms);
      },
    );
  }
}