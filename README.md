# Makeathon5 Application

Mobile Application being built in flutter & firebase for [Microsoft Student Learn Chapter, TIET]()'s flagship event - [Makeathon5]()

## Getting Started

This section provides all the details needed to start contributing to this project. 

### Prerequisites

- Flutter & Android Studio installed in the system 
> Refer to this [link](https://docs.flutter.dev/get-started/install?gclsrc=ds&gclsrc=ds)                                                                 
> Make sure to run and test the sample app once to ensure that the everything is installed correctly

- Any IDE Setup with flutter and dart *([Vscode](https://code.visualstudio.com) recommended)*

- Google [Firebase](https://firebase.google.com/) Account

- Firebase [CLI Tools](https://firebase.google.com/docs/cli) installed on the system

### Setting up the project in the local system 

- Fork the repository to your GitHub

- clone using ```git clone [repo link]```

- Open the project in your IDE

- Initialise Firebase: 
  - Open your firebase console and create a new project
  - Activate firebase using your terminal ```dart pub global activate flutterfire_cli```
  - Run ```flutterfire configure --project=[Project-ID]``` from your project directory, (Replace [Project-ID] with the project ID from your firebase project or directly copy the command with the project ID from your Firebase console.)
  - If asked to select platforms for configuring Firebase, select only Android & IOS

- run ```flutter pub get``` 

Your project is now all set-up in your local machine!!

## How to contribute

- Tasks would be assigned in meetings and through the Issues section of the Repo.
- Make sure to reguraly check the Issues section and choose any open issue that you wish to work upon. 
- Also make sure to read the [guidelines](https://github.com/UdBe/Makeathon5_app/edit/main/README.md#guidelines) given below before you start contributing!

## Guidelines
  
### Collaboration Related
- Make sure to do your work in the dev branch or any other branch. Never push directly to the main branch.
- Always test the final code on your emulator/device before pushing. 
- Keep an eye that your pull request is passing the Build test in the Actions tab.

### Flutter and dart related 
- Clearly name all the images and assets you are using and place them in the ./Assets folder. 
- Try to break down long widget trees into separate files. 

### Misc 
- If you face a 'Network Artifacts' error, try switching to a different network or use a VPN.

**Best of Luck!!**
  
