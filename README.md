For Minecraft 26.4

Demolition is a mini-game inspired by the classic board game Battleship. Each team of players has to build a structure on a grid. Then when the game begins, teams take turn guessing where to drop massive blocks of TNT on the grid in order to explode the other team's build. Whoever can fully demolish the enemy's build first wins!

## Setup
Before the game can be played, an operator has to enter Setup Mode, and place down the Lobby, Player 1 Arena, and Player 2 Arena. These structures are meant to be spawned in far apart from each other, so as to avoid cheating during play (ie; so that players on Team 1 can't peek over the wall to see Team 2's build.)

| Command | Description |
| --- | --- |
| `/function demolition:setup/begin` | Enter Setup Mode. |
| `/function demolition:setup/items` | Get items to spawn various play structures. |
| `/function demolition:setup/end` | Exit Setup Mode. |
| `/function demolition:setup/remove_all` | Remove all play structures. |

## Starting the Game
Once the play structures are set up, you can enter Lobby Mode, and players can pick their teams. Each team requires at least 1 player. Once teams are ready, an operator can run the Start Game command to enter Building Mode.

| Command | Description |
| --- | --- |
| `/function demolition:settings` | Modify the build requirements. |
| `/function demolition:pick_teams` | Enter Lobby Mode, where players can pick a team by standing on either side of the Lobby. |
| `/function demolition:start_game` | Start the game and enter Building Mode. |
| `/function demolition:end_game` | End the game early. |

## Gameplay
In Building Mode, players can use as few blocks as they want, but must keep their build within the various limits listed on the right side of the screen (Total Blast Resistance, Number of Blocks, Number of Cells Filled). These limits can be changed with the settings command in the previous section,

Once both teams are ready, they can interact with the Game Panel to indicate that their team is ready. Interacting with the Panel or placing/breaking blocks will unready the team.

When the game starts, teams simply take turns picking where to drop their TNT on the enemy via the Game Panel. The cell the player chooses will change color based on the result:

- While waiting for the TNT to drop, the cell becomes a small orange dot.
- If the TNT destroyed any blocks, that cell becomes a large red dot. This does not necessarily mean that the destroyed blocks are actually within that cell, since the TNT's splash damage can destroy blocks within an adjacent cell.
- If the TNT did not destroy any blocks, that cell becomes a large gray dot.

Choosing a cell on the Game Panel does NOT disable it from being used again in the future, since it's entirely possible that multiple TNT are required to destroy all of the blocks within a cell.

Once one team has entirely destroyed the other team's build, the game ends, and you can inspect each others' builds using the following commands.

| Command | Description |
| --- | --- |
| `/function demolition:teleport/lobby` | Teleport to Lobby, where the original, undamaged builds are stored. |
| `/function demolition:teleport/p1_arena` | Teleport to Player 1's Arena to see the damage to their build. |
| `/function demolition:teleport/p2_arena` | Teleport to Player 2's Arena to see the damage to their build. |
