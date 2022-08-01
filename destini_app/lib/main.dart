import 'package:flutter/material.dart';
import 'story_brain.dart';

void main() {
  runApp(Destini());
}

class Destini extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Destini app',
      theme: ThemeData.dark(),
      home: StroyPage(),
    );
  }
}

class StroyPage extends StatefulWidget {
  State<StroyPage> createState() => _StroyPageState();
}

class _StroyPageState extends State<StroyPage> {
  StoryBrain storyBrain = StoryBrain();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Story page"),
      ),
      body: Container(
        // TODO : step 1 - Add background image,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.png"),
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              child: Center(
                child: Image(
                  image: AssetImage(storyBrain.getImage()),
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Center(
                child: Text(
                  //TODO : Step 10 - user the stroyBrain to get the first story title and display it here,
                  // 'Story will go here',
                  storyBrain.getStory(),
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: TextButton(
                onPressed: () {
                  // choice 1 made by user,
                  // TODO : step 18 - Call the nextStroy() method form stoyBrain and pass the number 1 made by the user,
                  setState(() {
                    storyBrain.nextStory(choice: 1);
                  });
                },
                style: TextButton.styleFrom(
                  primary: Colors.pink,
                ),
                child: Text(
                  // TODO : Step 13 - use the storyBrain to get the text for choice 1,
                  // 'Choice 1',
                  storyBrain.getChoice1(),
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 2,
              // TODO : Step 26 - Use flutter visibility widget to wrap this button,
              //TODO : Step 28- Set the visible property of the visibility widget to equal the output from the buttonShouldBeVisible() method in the storyBrain,
              child: Visibility(
                visible: storyBrain.buttonShouldBeVisible(),
                child: TextButton(
                  onPressed: () {
                    // choice 1 made by user,
                    // TODO : step 19 - Call the nextStroy() method form stoyBrain and pass the number 2 made by the user,
                    setState(() {
                      storyBrain.nextStory(choice: 2);
                    });
                  },
                  style: TextButton.styleFrom(
                    primary: Colors.blue,
                  ),
                  child: Text(
                    // TODO : Step 14 - use the storyBrain to get the text for choice 2,
                    // 'Choice 2',
                    storyBrain.getChoice2(),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

// TODO : Step 24 - Run the app and try to figure out what code you need to add to this file , to make the story change when you pres on the choice buttons.
// TODO : Step 29 - Run the app and test it against the Story Outline to make sure you've completed all the steps. The code for the completed app can be found here:  https://github.com/londonappbrewery/destini-challenge-completed/