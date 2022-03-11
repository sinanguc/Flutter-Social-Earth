import 'package:flutter/material.dart';
import 'package:sociaworld/PostCard.dart';

class ProfilePage extends StatelessWidget {
  final String nameSurname;
  final String username;
  final String coverImageUrl;
  final String profileImageUrl;

  const ProfilePage(
      {Key? key,
      required this.nameSurname,
      required this.username,
      required this.coverImageUrl,
      required this.profileImageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 230.0,
              ),
              Container(
                height: 180.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(coverImageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                left: 20.0,
                bottom: 0.0,
                child: Container(
                  width: 120.0,
                  height: 120.0,
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(60.0),
                    border: Border.all(width: 2.0, color: Colors.white),
                    image: DecorationImage(
                      image: NetworkImage(profileImageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 190.0,
                left: 145.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      nameSurname,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 1.0),
                    Text(username,
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ))
                  ],
                ),
              ),
              Positioned(
                top: 130.0,
                right: 15.0,
                child: Container(
                  width: 100.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.grey[200],
                      border: Border.all(width: 2.0, color: Colors.white)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.add_circle,
                        size: 18.0,
                      ),
                      SizedBox(
                        width: 2.0,
                      ),
                      Text(
                        "Follow",
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              )
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            height: 75.0,
            color: Colors.grey.withOpacity(0.1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Counter("Follower", "500K"),
                Counter("Followed", "5K"),
                Counter("Share", "10K"),
              ],
            ),
          ),
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

  Widget Counter(String title, String count) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          count,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: 1.0,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}
