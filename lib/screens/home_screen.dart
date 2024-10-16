import 'package:flutter/material.dart';
import 'package:flutter_app_in_one_day/screens/views/home_view.dart';
import 'package:flutter_app_in_one_day/screens/views/list_hashtag_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
late final PageController _pageController;
  
  int _currentIndex = 0;


@override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: PageView(
        onPageChanged: (index) {
            setState( () => _currentIndex = index);
          },
        controller: _pageController,
        children: const <Widget> [
          HomeView(),
          ListHashtagView(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _modal(context),
        child: const Icon(
          Icons.add
        ),
       ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {

          setState(() => _currentIndex = index);

          _pageController.jumpToPage(index);
        },
          
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Hashtags',
          ),
        ]
      ),
    );
  }
}