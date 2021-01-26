import 'dart:core';

import 'package:flutter/material.dart';

const List<AssetImage> eventimages = [
  AssetImage('images/clash1.png'),
  AssetImage('images/revb.png'),
  AssetImage('images/pixelate.png'),
  AssetImage('images/cretronix.png'),
  AssetImage('images/bplan.png'),
  AssetImage('images/wallst.png'),
  AssetImage('images/datawizwhite.png'),
  AssetImage('images/enigma.png'),
  AssetImage('images/quiz.png'),
  AssetImage('images/web.png'),
  AssetImage('images/paper.png'),
  AssetImage('images/nth.png'),
];

const List<String> eventName = [
  "Clash",
  "Reverse Coding",
  "Pixelate",
  "Cretronix",
  "Bplan",
  "Wallstreet",
  "Datawiz",
  "Enigma",
  "Quiz",
  "Web Weaver",
  "Paper Presentation",
  "Network Treasure Hunt"
];

Map<String, int> prices1;

const List<String> intro = [
  "Put your logical acumen and coding expertise to the test as you clash with a round of perplexing MCQs followed by a set of time-bound coding challenges, carefully designed to assess your command over programming in the language of your choice- Python, C or C++.\n\nShowcase your technical proficiency as you have a go at competitive coding with plenty to learn and nothing to lose.\n\n" +
      "Registration Fees:\n\n" +
      "IEEE Members: 60/-\n" +
      "Non IEEE Members: 80/-",

  "A coding competition to test your compilation of the combinations of algorithms and conceptual understanding of the programming languages C/C++. Combine logic and agility to decipher given patterns and code to decode these sequences to find the final answer.\n\n" +
      "Registration Fees:\n\n" +
      "IEEE Members: 60/-\n" +
      "Non-IEEE Members: 80/-",

  "Get ready to paint virtual canvas with your creative and thoughtful designs! Come, digitalise your art and let your mouse be your brush." +
      "\n\nRegistration Fees: \n\n" +
      "IEEE Members: 120/- \n" +
      "Non-IEEE Members: 150/-",

  "Challenge your brains to clear a test where you demonstrate your knowledge in the field of electronics,physics, logical ability and build a circuit by interpreting the hints provided. \n\nPrerequisites: Theoretical and practical knowledge in the field of digital electronics, electrical circuits and physics." +
      "\n\nRegistration Fees: \n\n" +
      "IEEE Members: 40/-\n" +
      "Non-IEEE Members: 50/-",



  "Ever dreamt of having your own business or a product? B-Plan is the perfect platform for you! A perfect presentation describing your business idea will help you grab a chance to win funding from the investors. So showcase your ideas before a panel of best marketing professionals." +
      "\n" +
      "\nRegistration Fees: \n\n" +
      "IEEE Members: 100/- \n" +
      "Non-IEEE Members: 120/-",


  "Let the rise and fall of market shares bring out your inner businessman! Get an insight in the field of Investment banking, corporate financing and trading to take over the virtual stock market. After all, every investment is one step closer to your dream bank balance!" +
      "\n\nRegistration Fees: \n\n" +
      "IEEE Members: 40/-\n" +
      "Non-IEEE Members: 50/-",

  "Get ready to set off on a journey to the world of data science. DataWiz gives you an opportunity to test your machine learning and data analytics skills, work on datasets to analyse and make predictions using your models. Datawiz is a week-long machine learning competition hosted on Kaggle. The participants can form teams of up to 3 members and submit their predicted data values. The team with the highest accuracy on the leaderboard at the end of the week will be declared as winners." +
      "\n\nRegistration Fees: \n\n" +
      "IEEE Members: 40/-\n" +
      "Non-IEEE Members: 50/-",

  "Are you diligent enough to face the mind-boggling questions which will push your logical reasoning to its limits? Then do not miss this amazing opportunity. Enigma is a logical reasoning based questionnaire, which will test your aptitude, thinking capability, response time and mental ability. Get ready to put your Grey Cells to work! "
      +
      "\n\nRegistration Fees: \n\n" +
      "IEEE Members: 40/-\n" +
      "Non IEEE Members: 50/-",


  "Brainstorm on the questions ranging from Greek mythology to world politics, from Shakespeare to business gurus. Set out on a voyage through mind-boggling questions captained by a witty quiz master. Flex your IQ in a set of three quizzes, designed to be a battle of wits."+
      "\n\nRegistration Fees: \n\n" +
      "IEEE Members: 40/-\n" +
      "Non- IEEE Members: 50/-",


  "An aesthetically pleasing and user-friendly website is necessary to keep visitors engaged online. If you think you have the flair to create such a site, WebWeaver is the competition for you! A perfect integration of technology and creativity will lead you to win this competition."+
      "\n\nRegistration Fees: \n\n" +
      "IEEE Members: 60/-\n" +
      "Non IEEE Members : 80/-",

  "An investment in knowledge always pays the best interest.Compete against the most intellectual minds and their progressive ideas!Paper presentation is the perfect platform for undergraduate/postgraduate students to present technical papers with advanced perspectives while honing their skills of research and creating new dimensions of technology!  "+
      "\n\nRegistration Fees: \n\n" +
      "IEEE Members: 180/-\n" +
      "Non IEEE Members : 200/-",



  "Network Treasure Hunt is an online treasure hunt where participants follow a trail of clues, surfing a range of websites to decipher the puzzles.Tread carefully along your way, solving a series of strategic clues, watching out for the concealed misdirection.Decrypt the clues, enjoy the hunt and race your way to the finish to win some exciting goodies!This is your chance to put your logic and reasoning to test. So, log on to our website and be a Sherlock for a day!"+
      "\n\nRegistration Fees:  Free!",


];

const List<String> contact = [
  "Tanmay Nale: +91-9969108722\n" + "Pranjal Newalkar: +91 95529 50492",
  "Sanket Landge: +91 70209 83032\nKaustubh Odak: +91 96502 11332",
  "Shreya Deshpande: +91 7588404218",
  "Ajay Kompalwad: +91 8668460490\nAkshay Satpute: +91 7057602590",
  "Janhavi Bagul: +91 9970004781\nManasi Thonte: +91 9561118320\nSampreeti Saha: +91 9168743366",
  "Muffadal Diwan: +91 7073152539\nKrishiv Mewani: +91 9158087902",
  "Aboli Marathe: +91 9545413291\nAyush Das: +91 9373236438",
  "Saket Gupta: +91 77200 79968\nAtharva Sadre: +91 75882 46742",
  "Aparna Ranade: +91 8149841027\nAsawari Walkade: +91 8956783613",
  "Yash Sonar: +91 97631 26056\nElika Mishra: +91 96736 42654",
  "Anushka Mali: 91 7385747678",
  "Garvita Jain: +91 89895 53238\nPrajwal Patankar: +91 88887 26344"
];

const List<String> judging = [
  "Top 3 participants with Highest Capital at the end of Day 3 will be declared as winners.",
  "1) The competition will test the participants' logical and coding skills.\n2) Time and cost efficiency of the code will be tested in round 2.",
  "1) Creativity and originality of the design.\n2) Distinct features incorporated in the design.\m3) Persuasiveness of the design, i.e. the efficiency of the design to convey the required message.\n4) Photoshop skills.\n5) Layering and masking.\n6) The decision of the judges will be final and shall be respected.",
  "Round 1:\nEach question carries a single mark. No negative marking. Teams having score above the score threshold will be selected for Round 2.\nRound 2:\nTop two teams earning maximum credits based on the understanding of the problem statement, component selection, practical performance and explanation of the implemented circuit will be declared as winners.Winner and runner-up will be awarded.",
  "1) Innovation involved in the development of the idea and its practicality.\n2) Originality and Patentability.\n3) Technical feasibility.\n4) Implementation of the product.\n5) Cost efficiency (if relevant).\n6) Superiority of the product over existing products in market.\n7) Participants will be judged on the basis of their business acumen and on how sustainable and innovative their solution is.\n8) The decision of the judges will be final and shall be respected",
  "Top 3 participants with Highest Capital at the end of Day 3 will be declared as winners.",
  "Submission Limits\nYou may submit a maximum of 10 entries per day.\nYou may select up to 2 final submissions for judging.",
  "1)There will be two rounds.\n2)You need to qualify the threshold score to get into the next round. The threshold will be decided based upon the performance of all the teams.\n3)The decision of the organizer will be final.\n4)There is no negative marking at any stage.",
  "The winner will be selected on the basis of the maximum points scored in final round and/or on the exclusive discretion of the quiz master.",
  "Participants can participate either individually or in a group of 2 and develop a website which is supposed to be submitted 1-2 days before the start of Credenz. On the first day of Credenz, the best website teams are promoted to the second round where people are informed by us to add specific changes to their website. The website with the most aesthetic changes and best compatibility will be announced as the winner.",
  "1) Oratory and Presentation skills will be of prime importance.\n2) Relevance of the content in context with the chosen topic.\n3) Judge's decision will be final and binding on all.",
  "The person who has cracked the highest number of levels wins.\nNOTE: In case of a tie, the one who has reached first on that level is the winner."
];

const List<String> rules = [
  "1) MCQs based on coding concepts in C/C++ and python. (Python, C/C++ for FE and C/C++ for SE, TE and BE)",
  "1) A maximum of 2 candidates pursuing undergraduate program at their institution are allowed per team.\n\n2) Marking scheme will be declared on spot.",
  "1) Candidate pursuing undergraduate course at any institute is allowed to participate.\n\n2) Participants can register online on the official Credenz website.\n\n3) Each participant should have their own laptop and internet connection facility.",
  "1) Each team can consist of maximum 3 members.\n\n2) Participants will be provided with credentials to join tinkercad for the 2nd round.\n\n3) Participants can use data-sheets for the components they are using and are supposed to provide a link of the same.",
  "1) A maximum of three candidates per plan pursuing undergraduate/graduate/postgraduate program at their institution will be allowed per team.\n\n2) Proposed business plan should not be in violation of any intellectual property rights.",
  "1) Every Participating candidate should be pursuing Undergraduate/Graduate courses.\n\n2) Participants should have their own college ID cards.",
  "1) Each team of students may consist of a maximum of 3 participants.\n\n2) One account per participant.\n\n3) Signing In on Kaggle through Multiple accounts is prohibited.\n\n4) No private sharing outside teams.\n\n5) No private sharing outside teams.\n\n6) Privately sharing code or data outside of teams is not permitted.\n\n7) Results should be reproducible to be eligible for prizes.",
  "1) Candidates pursuing an Undergraduate/graduate program at their institution will be allowed to participate. It will be an individual event.\n\n2) All the participants should follow all the instructions as mentioned in the mail received after registration.",
  "1) General Quiz: It includes everything from robotics to politics. Test your GK!\n\n2) MELA Quiz: Movies Entertainment Literature and Arts (MELA) is all set to test your knowledge of literature, arts and entertainment. If you are an entertainment lover, this is for you!\n\n3) BizTech Quiz: If you are passionate about marketing, economics and Business, then BizTech is the ultimate questionnaire you need to answer.",
  "1) A team of maximum 2 is permissible for the event.\n\n2) Use of any front end framework is permitted.\n\n3) You are allowed to use any language but readymade template must not be used.\n\n4) Wordpress is not allowed.",
  "1) Oratory and Presentation skills will be of prime importance.\n\n2) Relevance of the content in context with the chosen topic.\n\n3) Judge's decision will be final and binding on all.",
  "1) Register to get your NTH username and password.\n\n2) Open NTH website: http://www.nth.credenz.in/\n\n3)Login using the credentials sent on the mail.\n\n4) You will be directed to the starting page of the hunt.\n\n5) To advance, crack the question, and put the answer in the URL:\nFROM\nhttp://www.nth.credenz.in/question.php\nTO\nhttp://www.nth.credenz.in/answer.php\n\n6) You need to use Google for many of them to solve. Of course, that is where you search for everything you don't know.\n\n7) Check the source of the pages, you'll get some important clues for hunting further. The titles may also give you clues.\nMost importantly, do not forget to have fun!"
];

const List<String> structure = [
  "1) A 28-minute game for a person or a team of two people.\n2) Teams or players are not allowed to use any IDE or software after the game has started.\n3)You will have 3 lifelines (description will be provided in the game itself) to help yourself.\n4) You are not allowed to switch tabs or close the browser during the game. If you do so, you will be automatically logged out.\n5) The primary marks allotted are +4 if answered correctly and -2 if the answer for a particular question is incorrect. If a question attempted is incorrect, then from the next question +2 marks are allotted for each correctly answered question, else -1 until you get a correct answer for upcoming questions.",
  "1) Integer type questions which involve complex mathematical problems which are not easy to solve without coding.\n2)A 28-minute game for a person or a team of two people.\n3)Teams or players are allowed to use any IDE or software after the game has started.\n4)You will have 3 lifelines (description will be provided in the game itself) to help yourself.\n5)You will have two attempts to answer a particular question. In the first attempt, the marking scheme will be +4 0. In the second attempt, the marking scheme will be changed to +2 -1.",
  "1)The topic will be given on the date of the event with detailed instructions in a google form.\n2) The link will be sent to each participant through their registered email Id.\n3) The time allotted to complete the task will be 2 hours.\n4) The design should be submitted in *psd, *cdr, *ai etc format.\n5)The design submitted should not be flattened.\n6)The brushes and fonts used should be mentioned in the documentation.\n7)Any external source or images used should also be included in the documentation.",
  "(Junior and Senior):\n1) 1st round:It will consist of Multiple Choice Questions (MCQs) from different categories. There will be 30 questions for a time limit of 30 minutes.\n2) 2nd round:The participants will be given a problem statement and they are supposed to implement the solution with the help of tinkercad simulation environment.\nLINK: https://www.tinkercad.com/dashboard",
  "1) At stage 1, the soft copy of the abstract (summary) should be submitted to pisb.bplan21@gmail.com\n2) The Soft copy should be a .pdf file.\n3)The Judges will do Evaluation, and 7 teams will compete in the next stage.\n4) Each team will be given 12 minutes in the final round to present their B-PLAN in front of a panel of judges and audience. A warning bell will be given at 10 minutes and a final 2 minutes thereafter.\n5) The presentation would be followed by a question-answer session where they would be questioned on different hurdles, opportunities and obstacles at various points.\n6) The main stress during question-answer session would be given on feasibility and Exit Plan.",
  "1) Every participant will be given virtual money to trade on our virtual stock market.\n2) The event will be conducted on our Android App/Website.\n3) Mock NEWS will be flashed regarding listed companies and their sectors based on which participants will buy/sell stocks to ultimately become the biggest gainer.\n4) Concepts such as IPO, short selling and high frequency trading will be inculcated within the event.",
  "Team Mergers:\nTeam mergers are allowed in this competition.\nTeam Limits:\nA team may consist of a maximum of 3 participants.",
  "1) There will be two rounds.\n2)You need to qualify the threshold score to get into the next round. The threshold will be decided based upon the performance of all the teams.\n3)The decision of the organizer will be final.\n4)There is no negative marking at any stage.\n5)ROUND 1:\na.There will be 35 questions in this round.\nb.Time limit is 40 minutes.\nc.For every right answer, you will be awarded points and no negative points for a wrong answer.\nd.The marking scheme will be told on the day of the event.\n6)ROUND 2:\na.There will be 5 Puzzles and 5 MCQs in this round.\nb.Time Limit is 2 hours\nc.You must claim whenever you are done. Earliest claim with max. score wins.",
  "1)Candidate pursuing an undergraduate program at any institute is allowed to participate. Participants are encouraged to maintain a copy of their ID card.\n2)Participants can register online on the official Credenz website.\n3)Each team will have a maximum of one participant.\n4)Marking scheme and other rules will be announced on the day of the event itself.",
  "1st ROUND:\nA problem statement shall be given to the participants online.\nThe problem statement shall be released approximately 20 days prior on the official website of Credenz '21.\nThe team should mail the files to webweaver.credenzlive@gmail.com in zip archive. (All files with understandable documentation.)\n2nd ROUND:\nThe second round shall be conducted during Credenz Live.\nApproximately 10 teams shall be shortlisted.\nThe teams shall be given certain add-ons over the pages designed earlier.\nFive add-ons shall be given, specific to the pages designed by the participants.",
  "1) Only soft copy i.e. a .pdf file, of the paper and abstract should be submitted. The paper should not exceed more than 6 pages.\n2) Soft copy of the technical paper and the abstract should be mailed to paper.pisbcredenz@gmail.com.\n3) The paper must strictly adhere to the IEEE format.\n4) Authors will get 15 minutes to deliver a presentation on their topic followed by a question - answer session.\n5) The presentation should be in power point format (.ppt or .pptx).",
  "1) NTH will be conducted twice during Credenz. Both the Treasure Hunt are conducted independently and will have a separate list of winners.\n2)The first hunt is to get the participants acquainted with the format of the online hunt and also with the wide variety of riddles and puzzles that they could come across in the main hunt.\n3) The second hunt, also the main Network Treasure Hunt has much higher stakes with some amazing prizes. This hunt will be longer than the previous hunt and will test the limits of the participants.\n4) The hunt is designed to be very intriguing and super fun to play."
];
