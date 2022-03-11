import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sociaworld/PostCard.dart';
import 'package:sociaworld/ProfilePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Social Earth',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Home());
  }
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.grey,
            size: 32.0,
          ),
          onPressed: () {},
        ),
        title: Text(
          "Social Earth",
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.grey,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.notifications,
                color: Colors.purple[300],
                size: 32.0,
              ),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Column(
                        children: <Widget>[
                          duyuru("Jessica followed to you", "3 min ago"),
                          duyuru("Sinan write comment your post", "1 day ago"),
                          duyuru("Tom sent message to you", "2 weeks ago"),
                        ],
                      );
                    });
              })
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 100.0,
            decoration: BoxDecoration(color: Colors.grey[100], boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 3.0),
                  blurRadius: 5.0),
            ]),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                CreateProfile(
                  "ahmet",
                  "https://cdn.pixabay.com/photo/2016/11/22/21/42/woman-1850703_960_720.jpg",
                  "Ahmet Yıldız",
                  "https://cdn.pixabay.com/photo/2016/11/22/21/42/woman-1850703_960_720.jpg",
                ),
                CreateProfile(
                  "tom",
                  "https://cdn.pixabay.com/photo/2016/06/06/17/05/woman-1439909_960_720.jpg",
                  "Tom Hanks",
                  "https://cdn.pixabay.com/photo/2016/06/06/17/05/woman-1439909_960_720.jpg",
                ),
                CreateProfile(
                  "jessica",
                  "https://cdn.pixabay.com/photo/2016/11/21/14/53/man-1845814_960_720.jpg",
                  "Jessica Alba",
                  "https://cdn.pixabay.com/photo/2016/11/21/14/53/man-1845814_960_720.jpg",
                ),
                CreateProfile(
                    "nelma",
                    "https://cdn.pixabay.com/photo/2021/06/15/16/11/man-6339003_960_720.jpg",
                    "Belma Aslan",
                    "https://cdn.pixabay.com/photo/2021/06/15/16/11/man-6339003_960_720.jpg"),
                CreateProfile(
                    "micheal",
                    "https://cdn.pixabay.com/photo/2016/11/29/06/08/woman-1867715_960_720.jpg",
                    "Micheal Jackson",
                    "https://cdn.pixabay.com/photo/2016/11/29/06/08/woman-1867715_960_720.jpg"),
                CreateProfile(
                    "messi",
                    "https://cdn.pixabay.com/photo/2015/01/06/16/14/woman-590490_960_720.jpg",
                    "Lionel Messi",
                    "https://cdn.pixabay.com/photo/2015/01/06/16/14/woman-590490_960_720.jpg")
              ],
            ),
          ),
          SizedBox(height: 10.0),
          PostCard(
            profileImageUrl:
                "https://i.insider.com/5ec2038019182438795d88b3?width=700",
            nameSurname: "Micheal Jordan",
            passingTime: "1 hour ago",
            description:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            postImageUrl:
                "https://cdn.pixabay.com/photo/2013/05/02/21/23/basketball-108622_960_720.jpg",
          ),
          PostCard(
            profileImageUrl:
                "https://miro.medium.com/fit/c/176/176/2*51-UfrxKZjbpXLO-6AeLSg.jpeg",
            nameSurname: "Sinan Güç",
            passingTime: "1 hour ago",
            description:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            postImageUrl:
                "https://cdn.pixabay.com/photo/2017/10/12/19/27/galatasaray-2845588_960_720.jpg",
          ),
        ],
      ),
    );
  }

  Padding duyuru(String message, String passingTime) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            message,
            style: TextStyle(fontSize: 15.0),
          ),
          Text(passingTime)
        ],
      ),
    );
  }

  Widget CreateProfile(String username, String imageUrl, String nameSurname,
      String coverImageUrl) {
    return Material(
      child: InkWell(
        onTap: () async {
          bool valueFromAnotherPage =
              await Navigator.of(context).push(CupertinoPageRoute(
                  builder: (BuildContext context) => ProfilePage(
                        username: username,
                        nameSurname: nameSurname,
                        coverImageUrl: coverImageUrl,
                        profileImageUrl: imageUrl,
                      )));

          if (valueFromAnotherPage) {
            print("User was back from another page.");
          }
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Column(
            children: <Widget>[
              Stack(
                alignment: Alignment.topRight,
                children: <Widget>[
                  Hero(
                    tag: username,
                    child: Container(
                      width: 70.0,
                      height: 70.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 2.0, color: Colors.grey),
                          borderRadius: BorderRadius.circular(35.0),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(imageUrl))),
                    ),
                  ),
                  Container(
                    width: 20.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(25.0),
                        border: Border.all(width: 2.0, color: Colors.white)),
                  )
                ],
              ),
              SizedBox(height: 4.0),
              Text(
                username,
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
