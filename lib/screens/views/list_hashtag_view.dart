import 'package:flutter/material.dart';

const List<Map<String, dynamic>> listHashtags = [
  {
    'name': '#flutter',
    
  },
  {
    'name': '#dart',
  },
];

class ListHashtagView extends StatelessWidget {
  const ListHashtagView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return listHashtags.isEmpty 
      ? const Center(
         child: Text('No Hashtags available')
        )  
    
      : ListView.builder(
        itemCount: listHashtags.length,
        itemBuilder: (context, index) {
          return  Dismissible(
            key: Key(index.toString()),
            onDismissed: (direction) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('$index suprimer')
                )
              );
            },
            background: Container(
              color: Colors.red,
            ),
            child: Card(
              child: ListTile(
                leading: const Icon(Icons.star),
                title: Text(listHashtags[index]['name']),
              ),
            )
          );
        },
      );
  }
}