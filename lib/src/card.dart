import 'package:flutter/material.dart';

class FlowCard extends StatefulWidget {
  final String flowName;
  final Widget direct;
  final String image;
  final String about;
  final int fav;
  final int id;
  FlowCard(
      {Key key,
      @required this.id,
      @required this.flowName,
      @required this.direct,
      @required this.image,
      @required this.about,
      @required this.fav})
      : super(key: key);
  @override
  _FlowCardState createState() => _FlowCardState();
}

class _FlowCardState extends State<FlowCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width - 20,
              height: MediaQuery.of(context).size.height / 3.5,
              child: Image.asset(
                widget.image,
                fit: BoxFit.fill,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      widget.flowName,
                      style: TextStyle(fontSize: 25),
                    )),
                IconButton(
                  icon: Icon(Icons.favorite_border),
                  onPressed: () {},
                )
              ],
            ),
          ],
        ));
  }
}
