# Flutter Project - Random Fighters

## Introduction
This is a documentation document for the Flutter project of a simple character fight game. The app consists of two main screens: the character selection screen and the fight screen. Players can choose two characters to battle, or random characters will be automatically selected for them. The fight occurs textually, with two types of attacks available: basic attack and special attack. Additionally, the fight scenarios are randomized.

## Usage
### Character Selection Screen

![readmeplayerselect](https://github.com/Monguilhott/random-fighters/assets/34020950/dd7829a9-23dc-473f-afb1-f20f82c7dac1)

1. Upon launching the application, you will be directed to the character selection screen.
2. You can choose two characters by tapping on them. If you don't want to choose, the app will randomly select two characters for you.
3. After selecting the characters, click the "Fight" button to start the battle.

### Fight Screen

![readme_fight_screen](https://github.com/Monguilhott/random-fighters/assets/34020950/38078ff4-2d2c-43d4-8f15-257f99ed10b2)

1. On the fight screen, you will see the textual representation of the battle between the two selected characters.
2. The battle consists of rounds of attacks, with each character taking turns to attack.
3. There are two types of attacks:
- **Basic Attack:** This attack has a 70% chance of occurring. The damage varies from 0 to 10.
- **Special Attack:** This attack has a 30% chance of occurring. The damage varies from 15 to 20.
4. The fight scenarios are randomly selected for each match, making each battle unique.
5. The battle continues until one of the characters is defeated (reaches 0 health).
6. After the battle concludes, you will see the battle result, indicating the winner.
