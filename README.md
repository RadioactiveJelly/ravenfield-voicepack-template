# Ravenfield: Voice Packs
-----

Hello, if you're here then it means you're interested in creating a voice pack for the Team Voices 3.0 mutator. Here you'll find a quick description of how to create a voice pack, and a quick run down of when clips will actually play.

# Requirements
1. **Unity 2020.3.20f1**
2. The latest version of the RF2020 Toolspack, found on the official RF discord.
3. Sourcetree (optional, but can make things easier for you if you clone the repo instead of just downloading the files)

# Setting Up
To start things of, take the VoicePackMutator[Template] prefab and create a variant of it. If you're new to Unity 2020, just put it in an empty scene then create a new prefab using it. It'll give you an option to make a variant of the template prefab. **This is important!** Making a variant of the prefab means that any changes made to the template that you shouldn't override will be updated on your variant as well. **Do not touch the template prefab, if you make changes to it I will not help you fix your bugs**. You can name your variant whatever you want.

Next up, do the same thing for the VoicePackContentMod[Template] prefab. This is your content mod, which you will export to create the .rfc file for your voice pack. **Important:** make sure that the Mutator Prefab field is pointing to the VoicePackMutator variant that you made. Again you can name this whatever you want. Do note, the prefab's name will be the name of your .rfc file when exported.

# The Voice Pack Mutator
Now, open your VoicePackMutator variant. You'll notice that it has a bunch of soundbanks, separated into two child objects. Now these are self explanatory, InfantryVoices are clips played through the bots themselves while Announcer clips use their own channel that will be heard regardless of distance. Announcer lines will also only play for the player's team.

Let's go through the infantry lines first.

| SoundBank Name        | When Does It Play?  |
| -------------         |:-------------:|
| DirectionalBank       | Calls out the direction when a bot is firing. Happens within a set interval.       |  
| DeathBank             | Plays when a bot dies. Will interrupt other lines.    |  
| KillBank              | Plays when a bot gets a kill. Only one bot can callout at a time to prevent spamming.       |  
| FriendlyFireBank      | Plays when you damage a friendly bot.        |

**Important Note:** For directional callouts, you need 8 clips no more, no less. You need to place them in this order:
1) North
2) North Eeast
3) East
4) South East
5) South
6) South West
7) West
8) North West

Now let's go through the announcer lines.

| SoundBank Name        | When Does It Play?  |
| -------------         |:-------------:|
| WinBank               | Plays when the player team wins.       |  
| LoseBank              | Plays when the player team loses.    |  
| PointCaptuedBank      | Plays when a point is captured by the player's team, without them being there. (when the flag icon isn't on the top left corner)       |  
| PointLostBank         | Plays when a point is set to neutral by the enemy team without them being there.       |
| LosingPointBank       | Unimplemented as of now.     |
| CapturingPointBank    | Plays when the player's team neutralizes a point without them being there.        |
| TakeControlBank       | Plays when the player's team has more flags than the enemy team. Takes priority to PointLost and CapturingPoint.        |
| LostControlBank       | Plays when the player's team has less flags than the enemy team. Takes priority to PointLost and CapturingPoint.        |
| TiedControlBank       | Plays when the player's team has the same amount of flags as the enemy team. Takes priority to PointLost and CapturingPoint.       |

All you need to do as a voice pack creator is to put in your clips into their respective sound banks. **Do not rename any of the soundbanks or any of the Targets on the ScriptedBehaviour component.**

**Note:** It is safe to leave banks blank.

### Extra Settings

Now what if you only want your pack to have infantry lines or just announcer lines? In the DataContainer component of your prefab, you'll find two boolean values. Setting hasInfantryLines to false will tell the main mutator to not add your pack to the list of infantry lines. Setting hasAnnouncerLines to false will do the same for the announcer clips.

For debug purposes, there are also strings to set your voice pack name and its announcer pack name.

# Publishing

All done with setting up? Before you publish your mod, make sure to test it first! Select your content mod, and press Ctrl + E. This will export your mod. Now run the game with the Team Voices 3.0 mutator active and see if your lines are playing properly. All good? Now go back to Unity and go to Ravenfield Tools -> Publish To Steam Workshop and follow the instructions there.

Before you make your voice pack public, be sure to have the Team Voice 3.0 mod linked as a required item.

Congratulations, you've made your first voice pack!

