import 'package:flutter/material.dart';
import 'package:flutter_app/common/net/HttpManager.dart';
import 'package:flutter_app/common/net/api.dart';
import 'package:flutter_app/bean/website.dart';
import 'package:flutter_app/page/web_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

class StudyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StudyState();
  }
}

class _StudyState extends State<StudyPage> {
  var _items = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  Future getData() async {
    HttpManager.post(FRIEND_WEBSITE, (data) {
      var lists = [];
      data.forEach((item) {
        lists.add(Website.fromJson(item));
      });
      setState(() {
        _items += lists;
      });
    }, errorCallBack: (errorMsg) {
      Fluttertoast.showToast(msg: errorMsg);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    List<ListTile> listTiles = _items
        .map((item) {
          return ListTile(
            leading: new CircleAvatar(
                backgroundImage: NetworkImage(item.imagePath),
                backgroundColor: Colors.grey),
            title: Text(item.title),
            subtitle: Text(item.desc),
            onTap: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (BuildContext context) {
                return new WebPage(item);
              }));
            },
          );
        })
        .cast<ListTile>()
        .toList();
    return new Scaffold(
        appBar: new AppBar(title: const Text("网站列表")),
        body: new RefreshIndicator(
            child: new ListView(
                children: ListTile.divideTiles(
                        context: this.context, tiles: listTiles)
                    .toList()),
            onRefresh: getData));
    // body: new ListView(
    //     children:
    //         ListTile.divideTiles(context: this.context, tiles: listTiles)
    //             .toList()));

    // body: new ListView.builder(
    //     itemCount: _items.length,
    //     itemBuilder: (BuildContext context, int index) {
    //       return itemView(context, index);
    //       // return ListTile(title: Text("$index"));
    //     }));
  }

  Widget itemView(BuildContext context, int index) {
    Website website = this._items[index];
    //设置分割线
    // if (index.isOdd) return new Divider(height: 2.0);
    // return new Container(color: Colors.blue);
    return ListTile(
        leading: new CircleAvatar(
            backgroundImage: NetworkImage(website.imagePath),
            backgroundColor: Colors.grey),
        title: Text(website.title),
        subtitle: Text(website.desc));
  }
}
