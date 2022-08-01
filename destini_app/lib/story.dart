//TODO: Step 2 - Create a new class called Story.

//TODO: Step 3 - Create 3 properties for this class, A. storyTitle to store the story text. B. choice1 to store the text for choice 1, C. choice2 to store the text for choice 2.

//TODO: Step 4 - Create a Constructor for this class to be able to initialise the properties created in step 3.

class Story {
  String _title = "";
  String _choice1 = "";
  String _choice2 = "";
  String _image = "";

  Story(
      {String storyTitle = "",
      String choice1 = "",
      String choice2 = "",
      String image = ""}) {
    this._title = storyTitle;
    this._choice1 = choice1;
    this._choice2 = choice2;
    this._image = image;
  }

  String getTitle() {
    return this._title;
  }

  String getChoice1() {
    return this._choice1;
  }

  String getChoice2() {
    return this._choice2;
  }

  String getImage() {
    return this._image;
  }
}
