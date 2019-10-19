import 'package:flutter/material.dart';
import 'package:flolearn/allflows.dart';
import 'package:provider/provider.dart';

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
  int fav;

  @override
  void initState() {
    super.initState();
    fav = widget.fav;
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<Flows>(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => widget.direct),
        );
      },
      child: Card(
        elevation: 5,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(7, 7, 7, 0),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3.5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  widget.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.info_outline),
                  onPressed: () {},
                ),
                Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      widget.flowName,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                    )),
                IconButton(
                  icon: (widget.fav == 1)
                      ? Icon(Icons.favorite)
                      : Icon(Icons.favorite_border),
                  onPressed: () {
                    setState(() {
                      appState.toggleFavorite(widget.id);
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
