import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isTurnX = true;
  List<String> xOroList = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  int fillBoxes = 0;
  bool gameHasResult = false;
  int scoreX = 0;
  int scoreO = 0;
  String resultButtonTitle = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[900],
        title: Text(
          'Tic Tac Toe',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: clearGame,
              icon: Icon(
                Icons.refresh,
                color: Colors.white,
                size: 30,
              ))
        ],
      ),
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            getScoreBoard(),
            SizedBox(
              height: 40,
            ),
            getResultButton(),
            SizedBox(
              height: 20,
            ),
            getGridView(),

            getTurn(),
          ],
        ),
      ),
    );
  }

  Widget getScoreBoard() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Text(
              'Player O',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '$scoreO',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              'Player X',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '$scoreX',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget getGridView() {
    return Expanded(
      child: GridView.builder(
        itemCount: 9,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              tapped(index);
            },
            child: Container(
              width: 100,
              height: 100,
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.grey,
                ),
              ),
              child: Text(
                '${xOroList[index]}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: xOroList[index] == 'O' ? Colors.red : Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget getTurn() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Text(
        '${isTurnX ? 'Turn O' : 'Turn X'}',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  void tapped(int index) {
    if(gameHasResult){
      return ;
    }
    setState(() {
      if (isTurnX && xOroList[index].isEmpty) {
        xOroList[index] = 'O';
        fillBoxes = fillBoxes + 1;
        isTurnX = false;
      } else if(!isTurnX && xOroList[index].isEmpty){
        xOroList[index] = 'X';
        fillBoxes = fillBoxes + 1;
        isTurnX = true;
      }
      // isTurnX = !isTurnX;
      getWinner();

    });
  }

  void getWinner() {
    if (xOroList[0] == xOroList[1] &&
        xOroList[0] == xOroList[2] &&
        xOroList[0].isNotEmpty) {
      setResult(xOroList[0], 'winner is ' + xOroList[0]);
      return;
    }
    if (xOroList[3] == xOroList[4] &&
        xOroList[3] == xOroList[5] &&
        xOroList[3].isNotEmpty) {
      setResult(xOroList[3], 'winner is ' + xOroList[3]);
      return;
    }
    if (xOroList[6] == xOroList[7] &&
        xOroList[6] == xOroList[8] &&
        xOroList[6].isNotEmpty) {
      setResult(xOroList[6], 'winner is ' + xOroList[6]);
      return;
    }

    if (xOroList[0] == xOroList[3] &&
        xOroList[0] == xOroList[6] &&
        xOroList[0].isNotEmpty) {
      setResult(xOroList[0], 'winner is ' + xOroList[0]);
      return;
    }
    if (xOroList[1] == xOroList[4] &&
        xOroList[1] == xOroList[7] &&
        xOroList[1].isNotEmpty) {
      setResult(xOroList[1], 'winner is ' + xOroList[1]);
      return;
    }
    if (xOroList[2] == xOroList[5] &&
        xOroList[2] == xOroList[8] &&
        xOroList[2].isNotEmpty) {
      setResult(xOroList[2], 'winner is ' + xOroList[2]);
      return;
    }
    if (xOroList[0] == xOroList[4] &&
        xOroList[0] == xOroList[8] &&
        xOroList[0].isNotEmpty) {
      setResult(xOroList[0], 'winner is ' + xOroList[0]);
      return;
    }
    if (xOroList[2] == xOroList[4] &&
        xOroList[2] == xOroList[6] &&
        xOroList[2].isNotEmpty) {
      setResult(xOroList[2], 'winner is ' + xOroList[2]);
      return;
    }
    if (fillBoxes == 9) {
      setResult('', 'Draw Game');
      return;
    }
  }

  void clearGame() {
    setState(() {
      for (var i = 0; i < xOroList.length; i++) {
        xOroList[i] = '';
      }
    });
  }

  void setResult(String winner, String title) {
    setState(() {
      gameHasResult = true;
      resultButtonTitle = '${title} , Play again!';
      if (winner == 'X') {
        scoreX = scoreX + 1;
        return ;
      }
      if (winner == 'O') {
        scoreO = scoreO + 1;
        return ;
      } else {

        scoreX = scoreX + 1;
        scoreO = scoreO + 1;
        return ;
      }
    });
  }

  Widget getResultButton() {
    return Visibility(
      visible: gameHasResult,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            width: 2,
            color: Colors.white
          )
        ),
        onPressed: () {
          fillBoxes = 0;
          gameHasResult = false;
          clearGame();
        },
        child: Padding(
          padding: const EdgeInsets.only(top:3),
          child: Text(
            resultButtonTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
