import 'package:flutter/material.dart';
import 'package:projeto_fanap/app/modules/order/order_open_details_page.dart';
import 'package:projeto_fanap/app/shared/models/order_open_list_model.dart';

class OrderOpenCard extends StatelessWidget {
  final OrderOpenListModel item;

  const OrderOpenCard({Key key, this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        elevation: 2,
        child: Row(
          children: <Widget>[
            Container(
              width: 80,
              height: 80,
              child: Center(
                child: Icon(
                  Icons.add_shopping_cart,
                  color: Colors.blueAccent,
                  size: 50,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.height / 3.0,
              height: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 3, bottom: 4),
                    child: Padding(
                      padding: EdgeInsets.only(top: 3, bottom: 4),
                      child: Text(
                        item.client.name != null
                            ? (item.client.name.length >= 32
                                ? item.client.name.substring(0, 29) + '...'
                                : item.client.name)
                            : 'Consumidor Final',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).accentColor),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 2.5, bottom: 4),
                    child: Row(
                      children: <Widget>[
                        Text(
                          item.status,
                          style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context).accentColor),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OrderOpenDetailsPage(
              item: item,
            ),
          ),
        );
      },
    );
  }
}
