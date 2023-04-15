import 'package:chatfog/ui/chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: false,
        title: const Text(
          'ChatFog',
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Row(children: [
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20, left: 20),
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                  child: const Placeholder(),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 10),
                  child: Text(
                    'Scan',
                    style: TextStyle(fontSize: 13, color: Colors.white),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 130,
              width: MediaQuery.of(context).size.width - 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Myprofile(),
                      Padding(
                        padding: EdgeInsets.only(left: 20, top: 10),
                        child: Text(
                          'Name',
                          style: TextStyle(fontSize: 13, color: Colors.white),
                        ),
                      )
                    ],
                  );
                },
                itemCount: 5,
              ),
            )
          ]),
          const SizedBox(height: 15),
          Container(
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height - 245,
            padding: const EdgeInsets.only(top: 10),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return const Divider(
                  height: 30,
                  thickness: 3,
                  indent: 20,
                  endIndent: 20,
                  color: Color(0xffEFF0F1),
                );
              },
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Chat()));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    height: 80,
                    width: MediaQuery.of(context).size.width - 40,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Group(rad: 30,),
                  ),
                );
              },
              itemCount: 10,
            ),
          )
        ],
      ),
    );
  }
}

class Group extends StatelessWidget {
   const Group({super.key, required this.rad});

  final double rad;
  @override
  Widget build(
    BuildContext context,
  ) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: rad,
          child: const Placeholder(),
        ),
        const SizedBox(width: 20),
        const Text(
          'Name',
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

class Myprofile extends StatelessWidget {
  const Myprofile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
        radius: 40,
        backgroundColor: Color(0xffFFCB45),
        child: CircleAvatar(
          radius: 37,
          backgroundColor: Colors.black,
          child: CircleAvatar(
              radius: 35,
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage('https://picsum.photos/200/300')),
        ));
  }
}
