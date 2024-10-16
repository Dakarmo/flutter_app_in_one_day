import 'package:flutter/material.dart';

class AddHashtagComponent extends StatelessWidget {
  // const AddHashtagComponent({super.key});
  const AddHashtagComponent({Key? key}) : super(key: key);

    void _modal(BuildContext context) => showModalBottomSheet(
      context: context, 
      builder: (context) =>  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          children:  <Widget>[
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Text("Hashtag creator", style: Theme.of(context).textTheme.titleLarge ),
             ),
             const Padding(
               padding: EdgeInsets.all(8.0),
               child: TextField(
                decoration: InputDecoration(
                  hintText: "Entrer votre hashtag",
                ),
                         ),
             ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("Annuler".toUpperCase()),
                
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("Ajouter".toUpperCase()),
                
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: () => _modal(context),
        child: const Icon(
          Icons.add
        ),
    );
  }
}