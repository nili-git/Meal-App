//import 'dart:html';

import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import './favourites_screen.dart';
import './categories_screen.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List <Meal> favouriteMeals; 

  TabsScreen(this.favouriteMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages; 
  int _selectedPageIndex = 0;

@override
  void initState() {
    _pages = 
    [
    {'page': CategoriesScreen(), 
    'title': 'Categories'
    },
    {'page': FavouriteScreen(widget.favouriteMeals),
     'title': 'Your Favourite'
     
     },
  ];
    
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
        // bottom: TabBar(
        //   tabs: <Widget>[
        //     Tab(
        //       icon: Icon(Icons.category),
        //       text: 'Categories',
        //     ),
        //     Tab(
        //       icon: Icon(
        //         Icons.star,
        //       ),
        //       text: 'Favourites',
        //     ),
        //   ],
        // ),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: -_selectedPageIndex,
        // type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            //title: Text('Categories'),
          label: ('Categories'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
           // title: Text('Favourites'),
           label: ('Favourites'),
          ),
        ],
      ),

      //TabBarView(children: <Widget>[
      //  CategoriesScreen(),
      //   FavouriteScreen(),
      // ],
      // ),
    );
  }
}
