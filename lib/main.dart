import 'package:flutter/material.dart';
import 'package:folding_cell/folding_cell.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Folding Cell',
    theme: ThemeData(
      primaryColor: Color(0xff6a53a4),
    ),
    home: FoldingCellListView(),
  ));
}

class FoldingCellListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Text('Calendar'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        color: Color(0xffdfd4f4),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return SimpleFoldingCell(
              frontWidget: FrontWidget(),
              innerTopWidget: InnerTopWidget(),
              innerBottomWidget: InnerBottomWidget(),
              cellSize: Size(MediaQuery.of(context).size.width, 175),
              padding: EdgeInsets.all(10),
            );
          },
        ),
      ),
    );
  }

  Widget FrontWidget() {
    return Builder(
      builder: (BuildContext context) {
        return InkWell(
          onTap: () {
            final foldingCellState =
                context.findAncestorStateOfType<SimpleFoldingCellState>();
            foldingCellState?.toggleFold();
          },
          child: Container(
            color: Color(0xffdfd4f4),
            alignment: Alignment.center,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xff6a53a4),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Container InnerTopWidget() {
    return Container(
      color: Color(0xff6a53a4),
    );
  }

  Widget InnerBottomWidget() {
    return Builder(
      builder: (BuildContext context) {
        return InkWell(
          onTap: () {
            final foldingCellState =
                context.findAncestorStateOfType<SimpleFoldingCellState>();
            foldingCellState?.toggleFold();
          },
          child: Container(
            color: Colors.white,
          ),
        );
      },
    );
  }
}
