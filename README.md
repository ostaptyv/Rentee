# Rentee

Rent any house you want easily and conveniently!

## Description

This is a test project the main purpose of which is to develop and improve my iOS Developer skills. In this project, I'm developing my proficiency in SwiftUI, Combine, etc.

## Table of contents

- [Description](#description)
- [Table of contents](#table-of-contents)
- [Installation](#installation)
- [Usage](#usage)
- [Help](#help)
- [Known issues](#known-issues)
- [Version History](#version-history)
- [Dependencies](#dependencies)
- [Authors](#authors)
- [License](#license)
- [Acknowledgments](#acknowledgments)

## Installation

In Terminal:

1. Checkout the directory you want the project to be cloned to:
```
cd <your-directory-full-path>
```
2. Clone the project:
```
git clone https://github.com/ostaptyv/Rentee
```
3. Install the project's pods (ensure that you have the [CocoaPods](https://cocoapods.org/#install) installed before running the command):
```
pod install
```
4. After that, go to your directory and open the "Rentee.xcworkspace" file.

In Xcode:

5. Build your project for the first time (it should fail). Pay attention to the file "R.generated.swift" in the Project navigator: it should change from red to white. 
6. Build your project for the second time. Now build is successful!

## Usage

It's recommended to run the app on the next devices:  

- iPhone 12 mini
- iPhone 11 Pro
- iPhone XS
- iPhone X

or devices with the same screen resolution. The development is performed based on the device which was used in the design template.  
It's okay to use devices with other screen resolutions but some UI elements may behave not as expected.  

UI supports all screens with the @2x and higher scale factors. The only device @1x which supports iOS 14.0 and higher is iPhone SE (1st generation), so it was decided to ignore the support of @1x screens.

## Help

God helps you :)  
But jokes aside, if you're experiencing any problems with the project, file a respective [issue](https://github.com/ostaptyv/Rentee/issues/new/choose).  
Also, if you have a suggestion on how to fix some known issue (the list is given below) you can create a [pull request](https://github.com/ostaptyv/Rentee/pulls), or send me some articles, materials, code snippets, etc. which may be useful (see my contacts in [Authors](#authors) section).

### Known issues

- **Image stretching in OnboardingView**: when run on the devices with screen dimensions other than 375x812 pt., the image becomes stretched.

## Version History  

- 0.1.0 (developing):
  - Initial Release.

## Dependencies

Currently, the project uses next libraries:

- [R.swift](https://github.com/mac-cain13/R.swift)

## Authors

**Ostap Tyvonovych:**
- Telegram: [@ostaptyv_work](https://t.me/ostaptyv_work)
- Email: <ostaptyv@gmail.com>

## License

This project is licensed under the GNU GPLv3 License - see the LICENSE file for details.

## Acknowledgments

- [Design template](https://www.sketchappsources.com/resource/download-4738.html) by: [Rachelizmarvel](https://www.behance.net/thaonguyend1bf)
