import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final String profileImageUrl;
  final String nameSurname;
  final String passingTime;
  final String postImageUrl;
  final String description;

  const PostCard(
      {Key? key,
      required this.profileImageUrl,
      required this.nameSurname,
      required this.passingTime,
      required this.postImageUrl,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Material(
        elevation: 1.0,
        borderRadius: BorderRadius.circular(12.0),
        child: Container(
          padding: EdgeInsets.all(15.0),
          width: double.infinity,
          height: 425.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0), color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.indigo,
                            image: DecorationImage(
                                image: NetworkImage(profileImageUrl),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(width: 12.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            nameSurname,
                            style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          Text(
                            passingTime,
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.grey),
                          )
                        ],
                      ),
                    ],
                  ),
                  Icon(Icons.more_vert)
                ],
              ),
              SizedBox(height: 15.0),
              Text(
                description,
                style: TextStyle(fontSize: 18.0, color: Colors.grey),
              ),
              SizedBox(height: 20.0),
              Image.network(
                postImageUrl,
                width: double.infinity,
                height: 200.0,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 4.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconWithButton(
                    iconButton: Icons.favorite,
                    yazi: "Like",
                    myFunction: () {
                      print("Like");
                    },
                  ),
                  IconWithButton(
                    iconButton: Icons.comment,
                    yazi: "Comment",
                    myFunction: () {
                      print("Write comment");
                    },
                  ),
                  FlatButton.icon(
                      onPressed: () {
                        print("Share");
                      },
                      icon: Icon(
                        Icons.share,
                        color: Colors.grey,
                      ),
                      label: Text(
                        "Share",
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class IconWithButton extends StatelessWidget {
  final IconData iconButton;
  final String yazi;
  final myFunction;

  const IconWithButton(
      {required this.iconButton, required this.yazi, this.myFunction});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: myFunction,
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Icon(
                iconButton,
                color: Colors.grey,
              ),
              SizedBox(
                width: 8.0,
              ),
              Text(
                yazi,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              )
            ],
          ),
        ),
      ),
    );
  }
}
