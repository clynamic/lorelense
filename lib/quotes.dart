import 'dart:math';

import 'package:flutter/material.dart';

class SunTzuQuote extends StatefulWidget {
  const SunTzuQuote({super.key});

  @override
  State<SunTzuQuote> createState() => _SunTzuQuoteState();
}

class _SunTzuQuoteState extends State<SunTzuQuote> {
  final String quote = sunTzuQuotes[Random().nextInt(sunTzuQuotes.length)];

  @override
  Widget build(BuildContext context) {
    TextStyle style = DefaultTextStyle.of(context).style;
    return SelectionArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            quote,
            style: style,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  ' - Sun Tzu',
                  style: style.copyWith(
                    fontSize: style.fontSize! * 0.8,
                    color: style.color!.withOpacity(0.5),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

const List<String> sunTzuQuotes = [
  'A wise general makes a point of foraging of the enemy.',
  'All men can see these tactics whereby I conquer, but what none can see is the strategy out of which victory is evolved.',
  'All warfare is based on deception. Hence, when we are able to attack, we must seem unable; when using our forces, we must appear inactive; when we are near, we must make the enemy believe we are far away; when far away, we must make him believe we are near.',
  'Anger may in time change to gladness; vexation may be succeeded by content. But a kingdom that has once been destroyed can never come again into being; nor can the dead ever be brought back to life.',
  'Appear weak when you are strong, and strong when you are weak.',
  'Attack is the secret of defense; defense is the planning of an attack.',
  'Be extremely subtle even to the point of formlessness. Be extremely mysterious even to the point of soundlessness. Thereby you can be the director of the opponent\'s fate.',
  'Be where your enemy is not.',
  'Begin by seizing something which your opponent holds dear; then he will be amenable to your will.',
  'Bravery without forethought, causes a man to fight blindly and desperately like a mad bull. Such an opponent, must not be encountered with brute force, but may be lured into an ambush and slain.',
  'Build your opponent a golden bridge to retreat across.',
  'Can you imagine what I would do if I could do all I can?',
  'Concentrate your energy and hoard your strength.',
  'Convince your enemy that he will gain very little by attacking you; this will diminish his enthusiasm.',
  'Do not press an enemy at bay.',
  'Do not swallow bait offered by the enemy. Do not interfere with an army that is returning home.',
  'Energy may be likened to the bending of a crossbow; decision, to the releasing of a trigger.',
  'Even the finest sword plunged into salt water will eventually rust.',
  'For them to perceive the advantage of defeating the enemy, they must also have their rewards.',
  'Foreknowledge cannot be gotten from ghosts and spirits, cannot be had by analogy, cannot be found out by calculation. It must be obtained from people, people who know the conditions of the enemy.',
  'Great results can be achieved with small forces.',
  'He who is prudent and lies in wait for an enemy who is not, will be victorious.',
  'He will win who knows when to fight and when not to fight.',
  'Hence that general is skillful in attack whose opponent does not know what to defend; and he is skillful in defense whose opponent does not know what to attack.',
  'If ignorant both of your enemy and yourself, you are certain to be in peril.',
  'If quick, I survive. If not quick, I am lost. This is death.',
  'If soldiers are punished before they have grown attached to you, they will not prove submissive; and, unless submissive, then will be practically useless. If, when the soldiers have become attached to you, punishments are not enforced, they will still be unless.',
  'If the enemy know not where he will be attacked, he must prepare in every quarter, and so be everywhere weak.',
  'If the mind is willing, the flesh could go on and on without many things.',
  'If there is disturbance in the camp, the general\'s authority is weak.',
  'If words of command are not clear and distinct, if orders are not thoroughly understood, then the general is to blame. But, if orders are clear and the soldiers nevertheless disobey, then it is the fault of their officers.',
  'If you fight with all your might, there is a chance of life; where as death is certain if you cling to your corner.',
  'If you know the enemy and know yourself, you need not fear the result of a hundred battles. If you know yourself but not the enemy, for every victory gained you will also suffer a defeat. If you know neither the enemy nor yourself, you will succumb in every battle.',
  'If your opponent is temperamental, seek to irritate him. Pretend to be weak, that he may grow arrogant. If he is taking his ease, give him no rest. If his forces are united, separate them. If sovereign and subject are in accord, put division between them. Attack him where he is unprepared, appear where you are not expected.',
  'In battle, there are not more than two methods of attack - the direct and the indirect; yet these two in combination give rise to an endless series of maneuvers.',
  'In the midst of chaos, there is also opportunity.',
  'It is easy to love your friend, but sometimes the hardest lesson to learn is to love your enemy.',
  'It is only the enlightened ruler and the wise general who will use the highest intelligence of the army for the purposes of spying, and thereby they achieve great results.',
  'Leadership is a matter of intelligence, trustworthiness, humaneness, courage, and sternness.',
  'Let your plans be dark and impenetrable as night, and when you move, fall like a thunderbolt.',
  'Move not unless you see an advantage; use not your troops unless there is something to be gained; fight not unless the position is critical.',
  'Move swift as the Wind and closely-formed as the Wood. Attack like the Fire and be still as the Mountain.',
  'Never venture, never win.',
  'One mark of a great soldier is that he fight on his own terms or fights not at all.',
  'One may know how to conquer without being able to do it.',
  'Opportunities multiply as they are seized.',
  'Plan for what it is difficult while it is easy, do what is great while it is small.',
  'Ponder and deliberate before you make a move.',
  'Quickness is the essence of the war.',
  'Rewards for good service should not be deferred a single day.',
  'So in war, the way is to avoid what is strong, and strike at what is weak.',
  'Strategy without tactics is the slowest route to victory. Tactics without strategy is the noise before defeat..',
  'Sweat more during peace: bleed less during war.',
  'The art of giving orders is not to try to rectify the minor blunders and not to be swayed by petty doubts.',
  'The art of war is of vital importance to the State. It is a matter of life and death, a road either to safety or to ruin. Hence it is a subject of inquiry which can on no account be neglected.',
  'The general who advances without coveting fame and retreats without fearing disgrace, whose only thought is to protect his country and do good service for his sovereign, is the jewel of the kingdom.',
  'The general who wins the battle makes many calculations in his temple before the battle is fought. The general who loses makes but few calculations beforehand.',
  'The greatest victory is that which requires no battle.',
  'The line between disorder and order lies in logistics.',
  'The opportunity of defeating the enemy is provided by the enemy himself.',
  'The peak efficiency of knowledge and strategy is to make conflict unnecessary.',
  'The skillful tactician may be likened to the shuai-jan. Now the shuai-jan is a snake that is found in the Ch\'ang mountains. Strike at its head, and you will be attacked by its tail; strike at its tail, and you will be attacked by its head; strike at its middle, and you will be attacked by head and tail both.',
  'The supreme art of war is to subdue the enemy without fighting.',
  'The whole secret lies in confusing the enemy, so that he cannot fathom our real intent.',
  'The wise warrior avoids the battle.',
  'The worst calamities that befall an army arise from hesitation.',
  'There are five dangerous faults which may affect a general: \n(1) Recklessness, which leads to destruction; \n(2) cowardice, which leads to capture; \n(3) a hasty temper, which can be provoked by insults; \n(4) a delicacy of honor which is sensitive to shame; \n(5) over-solicitude for his men, which exposes him to worry and trouble.',
  'There are not more than five musical notes, yet the combinations of these five give rise to more melodies than can ever be heard. There are not more than five primary colours, yet in combination they produce more hues than can ever been seen. There are not more than five cardinal tastes, yet combinations of them yield more flavours than can ever be tasted.',
  'There are roads which must not be followed, armies which must not be attacked, towns which must not be besieged, positions which must not be contested, commands of the sovereign which must not be obeyed.',
  'There is no instance of a nation benefiting from prolonged warfare.',
  'Those skilled at making the enemy move do so by creating a situation to which he must conform; they entice him with something he is certain to take, and with lures of ostensible profit they await him in strength.',
  'Thus the expert in battle moves the enemy, and is not moved by him.',
  'Thus we may know that there are five essentials for victory: \n(1) He will win who knows when to fight and when not to fight; \n(2) he will win who knows how to handle both superior and inferior forces; \n(3) he will win whose army is animated by the same spirit throughout all its ranks; \n(4) he will win who, prepared himself, waits to take the enemy unprepared; \n(5) he will win who has military capacity and is not interfered with by the sovereign.',
  'To fight and conquer in all our battles is not supreme excellence; supreme excellence consists in breaking the enemy\'s resistance without fighting.',
  'To know your enemy, you must become your enemy.',
  'To secure ourselves against defeat lies in our own hands, but the opportunity of defeating the enemy is provided by the enemy himself.',
  'To win one hundred victories in one hundred battles is not the acme of skill. To subdue the enemy without fighting is the acme of skill.',
  'Treat your men as you would your own beloved sons. And they will follow you into the deepest valley.',
  'Victorious warriors win first and then go to war, while defeated warriors go to war first and then seek to win.',
  'Victory comes from finding opportunities in problems.',
  'Water shapes its course according to the nature of the ground over which it flows; the soldier works out his victory in relation to the foe whom he is facing.',
  'We cannot enter into alliances until we are acquainted with the designs of our neighbors.',
  'What the ancients called a clever fighter is one who not only wins, but excels in winning with ease.',
  'Wheels of justice grind slow but grind fine.',
  'When envoys are sent with compliments in their mouths, it is a sign that the enemy wishes for a truce.',
  'When one treats people with benevolence, justice, and righteousness, and reposes confidence in them, the army will be united in mind and all will be happy to serve their leaders.',
  'When the enemy is relaxed, make them toil. When full, starve them. When settled, make them move.',
  'When the outlook is bright, bring it before their eyes; but tell them nothing when the situation is gloomy.',
  'When your army has crossed the border, you should burn your boats and bridges, in order to make it clear to everybody that you have no hankering after home.',
  'Who does not know the evils of war cannot appreciate its benefits.',
  'Who wishes to fight must first count the cost.',
  'You have to believe in yourself.',
];
