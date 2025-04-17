import 'package:flutter/material.dart';
class detailstodo extends StatefulWidget {
  final String title;
  final String description;
  final DateTime dateTime;
  const detailstodo({ required this.title,
    required this.description,
    required this.dateTime });

  @override
  State<detailstodo> createState() => _detailstodoState();
}

class _detailstodoState extends State<detailstodo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:  Text('Created at ${widget.dateTime.day}/${widget.dateTime.month}/${widget.dateTime.year}',

      style: TextStyle(
        color: Colors.black,
        fontSize: 20
      ),
      textAlign: TextAlign.center

      ),
      appBar: AppBar(
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          },
              icon: Image.asset('assets/icons/chevron-left.png')
          
          ),
        actions: [
          Padding(
            padding:  EdgeInsets.all(14.0),
            child: Row(
              children: [
                InkWell(

                      onTap:(){
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('${widget.dateTime.day}/${widget.dateTime.month}/${widget.dateTime.year}'),

                            ));
                      },
                    child: Image.asset('assets/icons/clock .png')),
                 SizedBox(width: 5,),
                Image.asset('assets/icons/edit-2 .png'),
                 SizedBox(width: 5,),
                Image.asset('assets/icons/trash-2.png'),
              ],
            ),
          )
        ],
      ),
      
      body:  Padding(
          padding: const EdgeInsets.only(right: 20,left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.title,
              style:const TextStyle(
                fontSize: 36,
                color: Colors.black,
                fontWeight: FontWeight.bold
              ) ,

            ),
             Text(widget.description,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black
              ) ,)
          ],
      ),),
    );
  }
}
