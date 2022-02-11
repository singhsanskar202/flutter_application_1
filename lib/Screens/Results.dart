import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/user_dao.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ResultPage extends StatefulWidget {
  final userDao = UserDao();

  ResultPage({Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

bool flag = false;

class _ResultPageState extends State<ResultPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget _buildListItem(BuildContext context, DocumentSnapshot documents) {
    return ListTile(
      title: Row(
        children: [
          Expanded(
            child: Text(documents['party']),
          ),
          Container(
            child: Text(documents['votes'].toString()),
          )
        ],
      ),
      onTap: () {
        documents.reference.update({'votes': documents['votes'] + 1});
      },
    );
  }

  showAlert() async {
    Alert(
      context: context,
      title: "Thanks For Voting",
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tap to vote"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return SizedBox(
                width: 200, height: 200, child: Text('Something went wrong'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return SizedBox(width: 200, height: 200, child: Text("Loading"));
          } else {
            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                String Party = data['party'];
                String path = "assets/images/owasi.jpeg";
                if (Party == "BJP") {
                  path = "assets/images/yogi.jpeg";
                }
                if (Party == "INC") {
                  path = "assets/images/gandhi.jpeg";
                }
                if (Party == "BSP") {
                  path = "assets/images/maya.jpeg";
                }
                if (Party == "SP") {
                  path = "assets/images/akhilesh.jpeg";
                }
                if (Party == "AAP") {
                  path = "assets/images/kejri.jpeg";
                }
                if (Party == "NOTA") {
                  path = "assets/images/nota.png";
                }
                if (Party == "OTHERS") {
                  path = "assets/images/hi.png";
                }

                return SingleChildScrollView(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 150,
                        height: 120,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Text("PARTY"),
                                    Text(data['party']),
                                  ],
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  children: [
                                    Text("VOTES"),
                                    Text(data['votes'].toString()),
                                  ],
                                ),
                              ],
                            ),
                            // SizedBox(height: 30)
                          ],
                        ),
                      ),
                      InkWell(
                        //leading: Image.asset("assets/images/yogi.jpeg"),
                        child: SizedBox(
                          child: Image.asset(
                            path,
                            width: 150,
                            height: 150,
                          ),
                        ),
                        onTap: () {
                          if (flag) {
                            document.reference
                                .update({'votes': FieldValue.increment(0)});
                          } else {
                            flag = true;
                            showAlert();
                            document.reference
                                .update({'votes': FieldValue.increment(1)});
                          }
                          // data.update(data['votes'], (value) => data['votes']++);
                        },

                        //subtitle: Text(data['votes'].toString()),
                      ),
                    ],
                  ),
                );
              }).toList(),
            );
          }
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //   //  Navigator.pushNamed(context, MyRoutes.graphroute);
      //   },
      // ),
      bottomSheet: Text("Made by Sanskar"),
    );
  }

//   Widget _getMessageList() {
//     return Container(
//       height: 800,
//       child: FirebaseAnimatedList(
//         controller: _scrollController,
//         query: FirebaseDatabase.instance.ref().child('user-pref'),
//         itemBuilder: (context, snapshot, animation, index) {
//           // if (snapshot.exists) {
//           //   final json1 = snapshot.value as Map<dynamic, dynamic>;
//           //   print(json1['place']);
//           // }

//           final json = snapshot.value as Map<dynamic, dynamic>;
//           // final message = UserPref.fromJson(json);
//           //print(json);
//           // return Container(child: Text(json['place'].toString()));
//           return MessageWidget(
//               json['date'],
//               json['place'],
//               int.parse(json['sex']),
//               int.parse(json['age']),
//               int.parse(json['religion']),
//               int.parse(json['party']));
//         },
//       ),
//     );
//   }
// }

// class MessageWidget extends StatelessWidget {
//   final String date;
//   final String place;
//   final int sex;
//   final int age;
//   final int religion;
//   final int party;

//   const MessageWidget(
//       this.date, this.place, this.sex, this.age, this.religion, this.party);

//   @override
//   Widget build(BuildContext context) {
//     String Sex = 'Male';
//     String Age = '18-35';
//     String Religion = 'Hindu';
//     String Party = 'BJP';
//     {
//       if (sex == 2) {
//         Sex = 'Female';
//       }
//       if (sex == 1) {
//         Sex = 'Male';
//       }
//     }
//     {
//       if (age == 2) {
//         Age = '36-50';
//       }
//       if (age == 3) {
//         Age = '50+';
//       }
//     }
//     if (religion == 2) {
//       Religion = 'Muslim';
//     }
//     if (religion == 3) {
//       Religion = 'Sikh';
//     }
//     if (religion == 4) {
//       Religion = 'Christian';
//     }
//     if (religion == 5) {
//       Religion = 'Jain';
//     }
//     if (religion == 6) {
//       Religion = 'others';
//     }
//     if (religion == 7) {
//       Religion = 'Prefer Not to say';
//     }
//     if (party == 2) {
//       Party = 'INC';
//     }
//     if (party == 3) {
//       Party = 'BSP';
//     }
//     if (party == 4) {
//       Party = 'SP';
//     }
//     if (party == 5) {
//       Party = 'AP';
//     }
//     if (party == 6) {
//       Party = 'AIMIM';
//     }
//     if (party == 7) {
//       Party = 'others';
//     }
//     if (party == 8) {
//       Party = 'NOTA';
//     }
//     return Padding(
//         padding: const EdgeInsets.only(left: 1, top: 5, right: 1, bottom: 2),
//         child: Column(
//           children: [
//             Container(
//                 decoration: BoxDecoration(
//                     boxShadow: [
//                       BoxShadow(
//                           color: Colors.grey[350]!,
//                           blurRadius: 2.0,
//                           offset: const Offset(0, 1.0))
//                     ],
//                     borderRadius: BorderRadius.circular(50.0),
//                     color: Colors.white),
//                 child: MaterialButton(
//                     disabledTextColor: Colors.black87,
//                     padding: const EdgeInsets.only(left: 18),
//                     onPressed: null,
//                     child: Wrap(
//                       children: <Widget>[
//                         Row(
//                           children: [
//                             Text("hello"),
//                             Text("avc"),
//                             Text("jhk"),
//                             Text("asd"),
//                             Text("party.toString()"),
//                           ],
//                         ),
//                       ],
//                     ))),
//             Padding(
//               padding: const EdgeInsets.only(top: 4),
//               child: Align(
//                   alignment: Alignment.topRight,
//                   child: Text(
// //DateFormat('yyyy-MM-dd, kk:mma').format(date).toString(),
//                     "hello",
//                     style: const TextStyle(color: Colors.grey),
//                   )),
//             ),
//           ],
//         ));
//   }
// }
}
