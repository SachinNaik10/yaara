// import 'package:auth/src/features/authentication/screens/calender/create_note/notes.dart';
// import 'package:auth/src/features/authentication/screens/calender/event.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// class Event {
//   final String id;
//   final String title;
//   final DateTime date;
//
//   Event({
//     required this.id,
//     required this.title,
//     required this.date,
//   });
//
//   factory Event.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
//     final data = snapshot.data()!;
//     return Event(
//       id: snapshot.id,
//       title: data['title'],
//       date: (data['date'] as Timestamp).toDate(),
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'title': title,
//       'date': Timestamp.fromDate(date),
//     };
//   }
// }
// class Calendar extends StatefulWidget {
//   @override
//   _CalendarState createState() => _CalendarState();
// }
//
// class _CalendarState extends State<Calendar> {
//   Map<DateTime, List<Event>> selectedEvents = {};
//   CalendarFormat format = CalendarFormat.month;
//   DateTime selectedDay = DateTime.now();
//   DateTime focusedDay = DateTime.now();
//
//   TextEditingController _eventController = TextEditingController();
//
//   @override
//   void initState() {
//     selectedEvents = {};
//     super.initState();
//   }
//
//   List<Event> _getEventsfromDay(DateTime date) {
//     return selectedEvents[date] ?? [];
//   }
//
//   @override
//   void dispose() {
//     _eventController.dispose();
//     super.dispose();
//   }
//
//   Future<void> _addEvent() async {
//     if (_eventController.text.isEmpty) {
//       return;
//     }
//
//     final eventTitle = _eventController.text;
//
//     // Create a reference to the "calendar" collection
//     final calendarCollection = FirebaseFirestore.instance.collection('calendar');
//
//     // Create a new document in the "calendar" collection
//     final newEventDoc = await calendarCollection.add({
//       'title': eventTitle,
//       'date': selectedDay,
//     });
//
//     // Get the ID of the newly created document
//     final eventId = newEventDoc.id;
//
//     // Create a reference to the logged-in user's "Users" collection
//     final userCollection = FirebaseFirestore.instance.collection('Users');
//
//     // Get the document reference for the logged-in user
//     final userDoc = userCollection.doc(FirebaseAuth.instance.currentUser?.uid);
//
//     // Update the "calendar" field in the user document
//     await userDoc.update({
//       'calendar': FieldValue.arrayUnion([eventId]),
//     });
//
//     // Clear the text field and update the UI
//     _eventController.clear();
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ScaffoldGradientBackground(
//       gradient: LinearGradient(colors: [
//         Color(0xFF8EC5FC),
//         Color(0xFFE0C3FC),
//       ]),
//       appBar: AppBar(
//         title: Text("Calendar"),
//         centerTitle: true,
//         leading: IconButton(
//           color: Colors.black,
//           onPressed: () {
//             Get.to(() => NotesScreen());
//           },
//           icon: Icon(Icons.next_plan_outlined),
//         ),
//       ),
//       body: Column(
//         children: [
//           TableCalendar(
//             focusedDay: selectedDay,
//             firstDay: DateTime(1990),
//             lastDay: DateTime(2050),
//             calendarFormat: format,
//             onFormatChanged: (CalendarFormat _format) {
//               setState(() {
//                 format = _format;
//               });
//             },
//             startingDayOfWeek: StartingDayOfWeek.sunday,
//             daysOfWeekVisible: true,
//
//             //Day Changed
//             onDaySelected: (DateTime selectDay, DateTime focusDay) {
//               setState(() {
//                 selectedDay = selectDay;
//                 focusedDay = focusDay;
//               });
//               print(focusedDay);
//             },
//             selectedDayPredicate: (DateTime date) {
//               return isSameDay(selectedDay, date);
//             },
//
//             eventLoader: _getEventsfromDay,
//
//             //To style the Calendar
//             calendarStyle: CalendarStyle(
//               isTodayHighlighted: true,
//               selectedDecoration: BoxDecoration(
//                 color: Colors.blue,
//                 shape: BoxShape.rectangle,
//                 borderRadius: BorderRadius.circular(5.0),
//               ),
//               selectedTextStyle: TextStyle(color: Colors.white),
//               todayDecoration: BoxDecoration(
//                 color: Colors.purpleAccent,
//                 shape: BoxShape.rectangle,
//                 borderRadius: BorderRadius.circular(5.0),
//               ),
//               defaultDecoration: BoxDecoration(
//                 shape: BoxShape.rectangle,
//                 borderRadius: BorderRadius.circular(5.0),
//               ),
//               weekendDecoration: BoxDecoration(
//                 shape: BoxShape.rectangle,
//                 borderRadius: BorderRadius.circular(5.0),
//               ),
//
//             ),
//             headerStyle: HeaderStyle(
//               formatButtonVisible: true,
//               titleCentered: true,
//               formatButtonShowsNext: false,
//               formatButtonDecoration: BoxDecoration(
//                 color: Colors.blue,
//                 borderRadius: BorderRadius.circular(5.0),
//               ),
//               formatButtonTextStyle: TextStyle(
//                 color: Colors.white,
//               ),
//             ),
//           ),
//           Expanded(
//             child: StreamBuilder<QuerySnapshot>(
//               stream: FirebaseFirestore.instance
//                   .collection('calendar')
//                   .where('date', isEqualTo: selectedDay)
//                   .snapshots(),
//               builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//                 if (snapshot.hasError) {
//                   return Text('Error: ${snapshot.error}');
//                 }
//
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return CircularProgressIndicator();
//                 }
//
//                 final events = snapshot.data?.docs ?? [];
//
//                 if (events.isEmpty) {
//                   return Center(child: Text('No events found for selected day'));
//                 }
//
//                 return ListView.builder(
//                   itemCount: events.length,
//                   itemBuilder: (context, index) {
//                     final event = events[index].data() as Map<String, dynamic>;
//                     final eventTitle = event['title'] as String;
//                     return ListTile(
//                       title: Text(eventTitle),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: () => showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//             title: Text("Add Event"),
//             content: TextFormField(
//               controller: _eventController,
//             ),
//             actions: [
//               TextButton(
//                 child: Text("Cancel"),
//                 onPressed: () => Navigator.pop(context),
//               ),
//               TextButton(
//                 child: Text("Ok"),
//                 onPressed: _addEvent,
//               ),
//             ],
//           ),
//         ),
//         label: Text("Add Event"),
//         icon: Icon(Icons.add),
//       ),
//     );
//   }
// }