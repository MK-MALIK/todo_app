import 'package:flutter/material.dart';
import 'package:todoappflutter/ReuseableButton.dart';
import 'package:todoappflutter/profile.dart';
import 'package:todoappflutter/todomodel.dart';
import 'detailstodo.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final String title = 'Design Logo';
  final String description = 'Make Logo For The Mini Project';
  final DateTime dateTime = DateTime.now();

  List<Todo> todolist = [

  ];


  TextEditingController titlecontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(

            context: context,

            backgroundColor: Color(0xffF79E89),
            isScrollControlled: true,
            builder: (context) => Container(
              height: 800,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
                child: Column(

                  children: [

                    SizedBox(height: 20,),
                    TextField(
                      controller: titlecontroller,

                      decoration: InputDecoration(
                        hintText: 'title',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            width: 2.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: descriptioncontroller,
                      maxLines: 8,
                      decoration: InputDecoration(
                        hintText: 'Description',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            width: 2.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: descriptioncontroller,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.calendar_today),
                        ),
                        hintText: 'Deadline(Optional)',
                        contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            width: 2.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ReuseableButton(title: 'ADD TODO', onPressed: () {

                      setState(() {
                        todolist.add(
                          Todo(
                              title: titlecontroller.text,
                              description: descriptioncontroller.text,
                              dt: DateTime.now())
                        );
                      });

                      titlecontroller.clear();
                      descriptioncontroller.clear();
                        Navigator.pop(context);



                    })
                  ],
                ),
              ),
            ),
          );
        },
        backgroundColor: const Color(0xffF76C6A),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 24,
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'TO DO LIST',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color(0xffF79E89),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => profile()));
            },
            icon: const Icon(Icons.settings),
            iconSize: 40,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Column(

          children: [
        Row(
        children: [


          Image.asset('assets/icons/Union.png'),
          SizedBox(width: 5,),
          const Text(

            'LIST OF TODO',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Color(0xffF76C6A),
            ),
          ),
          const SizedBox(width: 30,),
          Image.asset('assets/icons/filter.png')
        ],
      ),
            SizedBox(height: 20,),







            Expanded(child: Container(
              child: ListView.separated(
                itemCount: todolist.length,
                separatorBuilder: (context, index) => SizedBox(height: 20),
                itemBuilder: (context, index) {
                  final todo = todolist[index];
                  return Container(
                    height: 140,
                    width: MediaQuery.of(context).size.width * 0.6,
                    decoration: BoxDecoration(
                      color: index.isOdd?   Color(0xffF79E89) : Color(0xffF76C6A),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                todo.title,
                                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                              const SizedBox(width: 70),
                              IconButton(onPressed: () {}, icon: const Icon(Icons.lock_clock)),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              todo.description,
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Created at ${todo.dt.day} ${todo.dt.month} ${todo.dt.year}',
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
             ),
            )
          ],
        ),
      ),
    );
  }
}




//  Padding(
//   padding: const EdgeInsets.only( left: 10),
//   child: Column(
//     children: [
//        Row(
//         children: [
//
//           Image.asset('assets/icons/Union.png'),
//           SizedBox(width: 5,),
//           const Text(
//
//             'LIST OF TODO',
//             style: TextStyle(
//               fontSize: 40,
//               fontWeight: FontWeight.bold,
//               color: Color(0xffF76C6A),
//             ),
//           ),
//           const SizedBox(width: 30,),
//           Image.asset('assets/icons/filter.png')
//         ],
//       ),
//       const SizedBox(height: 20),
//
//       InkWell(
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) =>  detailstodo(
//                  title: title,
//                  description: description,
//                  dateTime:  dateTime
//             )),
//
//           );
//         },
//         child: Container(
//           height: 140,
//           width: double.infinity,
//           decoration: BoxDecoration(
//             color: const Color(0xffF76C6A),
//             borderRadius: BorderRadius.circular(14),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                      Text(
//                       title,
//                       style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
//                     ),
//                     const SizedBox(width: 70),
//                     IconButton(onPressed: () {}, icon: const Icon(Icons.lock_clock)),
//                   ],
//                 ),
//                 const SizedBox(height: 6),
//                  Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     description,
//                     style: TextStyle(color: Colors.white, fontSize: 20),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                  Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     'Created at ${dateTime.day} ${dateTime.month} ${dateTime.year}',
//                     style: TextStyle(color: Colors.white, fontSize: 20),
//                   )
//
//                  ),
//               ],
//             ),
//           ),
//         ),
//       ),
//
//       const SizedBox(height: 20),
//
//       Container(
//         height: 160,
//         width: double.infinity,
//         decoration: BoxDecoration(
//           color: const Color(0xffF79E89),
//           borderRadius: BorderRadius.circular(14),
//         ),
//         child: const Padding(
//           padding: EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'UI Design',
//                     style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
//                   ),
//                   SizedBox(width: 70),
//                 ],
//               ),
//               SizedBox(height: 6),
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Make Ui Design For the Mini Project',
//                   style: TextStyle(color: Colors.white, fontSize: 20),
//                 ),
//               ),
//
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Created at 1 7 2021',
//                   style: TextStyle(color: Colors.white, fontSize: 20),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ],
//   ),
// ),