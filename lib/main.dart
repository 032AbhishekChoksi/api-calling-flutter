import 'package:api_calling_in_flutter/api_helper.dart';
import 'package:api_calling_in_flutter/models/Album.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter API Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter API Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
// variable to call and store future list of albums.
  Future<List<Album>> albumFuture = ApiHelper.fetchAlbum();

  // build function
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        // FutureBuilder
        child: FutureBuilder<List<Album>>(
          future: albumFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // until data is fetched, show loader
              return const CircularProgressIndicator();
            } else if (snapshot.hasData) {
              // once data is fetched, display it on screen (call buildPosts())
              final albums = snapshot.data!;
              return buildAlbums(albums);
            } else {
              return const Text(
                "No data available",
                style: TextStyle(fontSize: 30),
              );
            }
          },
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  // function to display fetched data on screen
  Widget buildAlbums(List<Album> albums) {
    // ListView Builder to show data in a list
    return ListView.builder(
      itemCount: albums.length,
      itemBuilder: (context, index) {
        final album = albums[index];
        return Card(
          margin: const EdgeInsets.all(10),
          elevation: 5,
          child: ListTile(
            leading: Text(album.id.toString()),
            title: Text(album.title),
            subtitle: Text(album.userId.toString()),
          ),
        );
      },
    );
  }
}
