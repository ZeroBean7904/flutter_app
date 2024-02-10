import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(), // 아마 텍스트 만드는건 MyAppState라는 클래스에서 한다
      child: MaterialApp( // MaterialApp 이라는 위젯 여기엔 파라미터로 child가 title, theme등이 가능
        title: 'Namer App',
        theme: ThemeData( // ThemeData라는 위젯 여기엔 파라미터로 useMaterial3, 색도 지정해 줌 
          useMaterial3: true, // ?
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green), // 시드 색은 초록색
        ),
        home: MyHomePage(), // MyHomePage라는 클래스에서 시작
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random(); // wordPair 라는 위젯 랜덤으로 단어를 current에 저장

  void getNext(){ // getNext는 뭔가 다음걸로 넘어가는 듯함
    current = WordPair.random(); // 단어를 변경함
    notifyListeners(); // ??
  }

  var favorites = <WordPair>[]; // 위젯을 <> 이걸로 감싸는 건 무슨 의미인가? 제네릭이래...

  void toggleFavorite() { // 좋아요 누르는 부분 인듯
    if (favorites.contains(current)) { // ? 뭘의미하는 if 문이지
      favorites.remove(current); // 좋아요에서 삭제
    } else {
      favorites.add(current); // 좋아요에 추가
    }
    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState(); // 왜 구지 그냥 하지 않고 ?
}

class _MyHomePageState extends State<MyHomePage> {

  var selectedIndex = 0; // home 이냐 favorite이냐 결정하는 변수

  @override
  Widget build(BuildContext context) {
    Widget page; // page라는 위젯
    switch (selectedIndex) { // 처음에 0으로 초기화했으니깐
      case 0:
        page = GeneratorPage(); // GeneratorPage를 보여줌
        break;
      case 1:
        page = FavoritesPage(); // FavoritesPage를 보여줌
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex'); // 예외처리 느낌인듯
    }
    return LayoutBuilder(builder: (context, constraints) { // 보통 return 다음에 이렇게 시작하던데 위엔 build안에 두었네
        return Scaffold(// 머리 몸 아래로 나누는 위젯
          body: Row( // 가로로 배치하는 건데? home과 favorite은 세로로 되어있는데? 아이콘이랑 관계인가?
            children: [
              SafeArea( // 다른 것에 의해 가려지지 않도록 하는 위젯
                child: NavigationRail( // navigation push ? 뭐 이런거 같은데 공부해야 할듯
                  extended: constraints.maxWidth >=600, // 최대 이정도 크기만 늘어나라 이거인듯 실제로 옆으로 땡기면 어느순간 안늘어남
                  destinations: [ // navigation의 파라미터인듯 무슨 의미일까? 약간 이동하는 것들 정의 같음
                    NavigationRailDestination( // 홈 화면
                      icon: Icon(Icons.home),
                      label: Text('home'),
                    ),
                    NavigationRailDestination( // favorite 화면
                      icon: Icon(Icons.favorite),
                      label: Text('favorites'),
                    ),
                  ],
                  selectedIndex: selectedIndex, // home 인지 favorite인지
                  onDestinationSelected: (value){ // 이부분은 모르겠다 ???
                    setState(() {
                      selectedIndex = value;
                    });
                  },
                ),
              ),
               Expanded( // 칸수를 최대한 먹는 위젯?
                child: Container(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: page,
                 )
               )
            ],
          )
        );
      }
    );
  }
}

// class scafold extends StatelessWidget {
//   const scafold({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     var messages =['Hello','ahoy','こんにちは'];
//     return Column(children: [
//       Text('Messages:'),
//       for(var msg in messages)
//         Text(msg),
//     ],);
//   }
// }

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();// MyAppState를 불러온다? 뭐 그정도 같은데
    var pair = appState.current;

    IconData icon; // icon 선언
    if (appState.favorites.contains(pair)) { // ?
      icon = Icons.favorite; // 하트에 불들어오는거
    } else {
      icon = Icons.favorite_border; // 하트에 불꺼지는거
    }

    return Center(
      child: Column( // 세로로 정렬하는 위젯
        mainAxisAlignment: MainAxisAlignment.center, // 중앙에 배치하는 위젯
        children: [
          //Text('A random AWESOME idea:'),
          BigCard(pair: pair), // 파라미터가 pair 하나라서 그냥 이렇게 젤 큰 단어 적힌 카드인듯
          SizedBox(height: 15,), // 이건 밑에 버튼과 카드 사이에 간격
          Row( // 가로로 정렬
            mainAxisSize: MainAxisSize.min, // 사용가능한 모든 가로 공간을 차지하지마라
            children: [
              ElevatedButton.icon( // 왜 ElevaatedButton일까
                onPressed: () { // 클릭을 담당하는듯
                  appState.toggleFavorite(); // 그러면 좋아요에 자극을 보내고
                }, 
                icon: Icon(icon),
                label: Text('like'),
              ),
              SizedBox(width: 10,), // 좋아요와 다음 사이의 간격
              ElevatedButton( // icon이 필요없어서 뺀듯
                onPressed: () {
                  appState.getNext(); // getNext에 자극을 보내고
                }, 
                child: Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) { // 여기다 집어넣는 건 기본적인 내용들인가? 
    final theme = Theme.of(context); // 그냥 메마 불러온거
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary, // 스타일 지정해 준거 자세힌 모르겠음
    );

    return Card(
      color: theme.colorScheme.primary, // 위에꺼랑 뭐가 달라
      elevation: 20, // 그림자
      child: Padding(
        padding: const EdgeInsets.all(20),// 왜 const를 하나요?
        child: Text(
          pair.asLowerCase, // 이게 단어임 뒤에꺼가 다른거 추가해 준거고
          style: style, // 위에 정의한 스타일로
          semanticsLabel: "${pair.first} ${pair.second}", //?
        ),
      ),
    );
  }
}

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.favorites.isEmpty) { // 만약 좋아요 누른게 없다면
      return Center( // 중앙에
        child: Text('No favorites yet.'), // 이글을 적는다
      );
    }

    return ListView( // 리스트를 만든다
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have ' // 여긴 왜 이렇게?
              '${appState.favorites.length} favorites:'),
        ),
        for (var pair in appState.favorites) // for 문 돌리는 형식이 잘 이해가 안감 대충 좋아요 개수만큼 하라는 듯
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(pair.asLowerCase),
          ),
      ],
    );
  }
}