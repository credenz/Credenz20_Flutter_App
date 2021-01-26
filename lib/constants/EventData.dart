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
  "Put your logical acumen and coding expertise to the test as you clash with a round of perplexing MCQs followed by a set of time-bound coding challenges, carefully designed to assess your command over programming in the language of your choice- Python, C or C++. Showcase your technical proficiency as you have a go at competitive coding with plenty to learn and nothing to lose." +
      "*Registration Fees:*\n" +
      "IEEE Members: 60/-\n" +
      "Non IEEE Members: 80/-",

  "A coding competition to test your compilation of the combinations of algorithms and conceptual understanding of the programming languages C/C++. Combine logic and agility to decipher given patterns and code to decode these sequences to find the final answer." +
      "Registration Fees:\n" +
      "IEEE Members: 60/-\n" +
      "Non-IEEE Members: 80/-",

  "Get ready to paint virtual canvas with your creative and thoughtful designs! Come, digitalise your art and let your mouse be your brush." +
      "\nRegistration Fees: \n" +
      "IEEE Members: 120/- \n" +
      "Non-IEEE Members: 150/-",

  "Challenge your brains to clear a test where you demonstrate your knowledge in the field of electronics,physics, logical ability and build a circuit by interpreting the hints provided. \n Prerequisites: Theoretical and practical knowledge in the field of digital electronics, electrical circuits and physics." +
      "\nRegistration Fees: \n" +
      "IEEE Members: 40/- per team\n" +
      "Non-IEEE Members: 50/- per team",



  "Ever dreamt of having your own business or a product? B-Plan is the perfect platform for you! A perfect presentation describing your business idea will help you grab a chance to win funding from the investors. So showcase your ideas before a panel of best marketing professionals." +
      "\n" +
      "\nRegistration Fees: \n" +
      "IEEE Members: 100/- \n" +
      "Non-IEEE Members: 120/-",


  "Let the rise and fall of market shares bring out your inner businessman! Get an insight in the field of Investment banking, corporate financing and trading to take over the virtual stock market. After all, every investment is one step closer to your dream bank balance!" +
      "\nRegistration Fees: \n" +
      "IEEE Members: 40/-\n" +
      "Non-IEEE Members: 50/-",

  "Get ready to set off on a journey to the world of data science. DataWiz gives you an opportunity to test your machine learning and data analytics skills, work on datasets to analyse and make predictions using your models. Datawiz is a week-long machine learning competition hosted on Kaggle. The participants can form teams of up to 3 members and submit their predicted data values. The team with the highest accuracy on the leaderboard at the end of the week will be declared as winners." +
      "\nRegistration Fees: \n" +
      "IEEE Members: 40/-\n" +
      "Non-IEEE Members: 50/-",

  "Are you diligent enough to face the mind-boggling questions which will push your logical reasoning to its limits? Then do not miss this amazing opportunity. Enigma is a logical reasoning based questionnaire, which will test your aptitude, thinking capability, response time and mental ability. Get ready to put your Grey Cells to work! "
      +
      "\nRegistration Fees: \n" +
      "IEEE Members: 40/-\n" +
      "Non IEEE Members: 50/-",


  "Brainstorm on the questions ranging from Greek mythology to world politics, from Shakespeare to business gurus. Set out on a voyage through mind-boggling questions captained by a witty quiz master. Flex your IQ in a set of three quizzes, designed to be a battle of wits."+
      "\nRegistration Fees: \n" +
      "IEEE Members: 40/-\n" +
      "Non- IEEE Members: 50/-",


  "An aesthetically pleasing and user-friendly website is necessary to keep visitors engaged online. If you think you have the flair to create such a site, WebWeaver is the competition for you! A perfect integration of technology and creativity will lead you to win this competition."+
      "\nRegistration Fees: \n" +
      "IEEE Members: 60/-\n" +
      "Non IEEE Members : 80/-",

  "An investment in knowledge always pays the best interest.Compete against the most intellectual minds and their progressive ideas!Paper presentation is the perfect platform for undergraduate/postgraduate students to present technical papers with advanced perspectives while honing their skills of research and creating new dimensions of technology!  "+
      "\nRegistration Fees: \n" +
      "IEEE Members: 180/-\n" +
      "Non IEEE Members : 200/-",



  "Network Treasure Hunt is an online treasure hunt where participants follow a trail of clues, surfing a range of websites to decipher the puzzles.Tread carefully along your way, solving a series of strategic clues, watching out for the concealed misdirection.Decrypt the clues, enjoy the hunt and race your way to the finish to win some exciting goodies!This is your chance to put your logic and reasoning to test. So, log on to our website and be a Sherlock for a day!"+
      "\nRegistration Fees:  Free!",


];

const List<String> contact = [
  "Tanmay Nale: +91-9969108722\n" + "Pranjal Newalkar: +91 95529 50492",
  "Sanket Landge: +91 70209 83032\nKaustubh Odak: +91 96502 11332",
  "Shreya Deshpande: +91 7588404218",
  "Ajay Kompalwad: +91 8668460490\nAkshay Satpute: +91 7057602590",
  "Janhavi Bagul: +91 9970004781\nManasi Thonte: +91 9561118320\nSampreeti Saha: +91 9168743366",
  "Muffadal Diwan: +91 7073152539\nKrishiv Mewani: +91 9158087902",
  "Sudhanshu Bhoi: +91 8975167862" + "Neelanjney Pilarisetty:91 8087084718",
  "Isha Pardikar:" + " +91-9309116833",
  "Ajay Kadam:" + " 91-8669286645" + "Saumitra Kulkarni:" + "+91-8806850222",
  "Rajavi Kakade:" + " +91-7798130523" + "Rohit Nagotkar:" + " +91-8668297216",
  "Amol Gandhi:" + " +91-928413533" + "Piyusha Gumte:" + " +91-7745000663",
  "Vansh Kaul:" + " +91-9370663915" + "Hritik Zutshi:" + " +91-7701864159"
];

const List<String> judging = [
  "1. Identifies a business opportunity. " +
      "2. Innovation, and Creativity involved. " +
      "3. Technical and Economical Feasibility. " +
      "4. Originality of the idea. " +
      "5. Business Acumen of the Participants. " +
      "" +
      "Decisions of the judges will be final and shall be respected. ",
  "1. Design of your machine." +
      "2. Number of steps involved in it." +
      "3. Number of different types of energy conversions involved." +
      "4. Aesthetic of machine." +
      "5. Presentation." +
      "6. Innovation." +
      "7. Will test elementary knowledge of applied physics of team." +
      "8. Team management skills will also be tested.",
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
  "1) A maximum of 2 candidates pursuing undergraduate program at their institution are allowed per team.\n2) Marking scheme will be declared on spot.",
  "1)Candidate pursuing undergraduate course at any institute is allowed to participate.\n2)Participants can register online on the official Credenz website.\n3)Each participant should have their own laptop and internet connection facility.",
  "1)  Each team can consist of maximum 3 members.\n2) Participants will be provided with credentials to join tinkercad for the 2nd round.\n3) Participants can use datasheets for the components they are using and are supposed to provide a link of the same.",
  "1) A maximum of three candidates per plan pursuing undergraduate/graduate/postgraduate program at their institution will be allowed per team.\n2) Proposed business plan should not be in violation of any intellectual property rights.",
  "1) Every Participating candidate should be pursuing Undergraduate/Graduate courses.\n2) Participants should have their own college ID cards.",
  "1)Each team of students may consist of a maximum of 3 participants.\n2)One account per participant\n3)Signing In on Kaggle through Multiple accounts is prohibited.\n4)No private sharing outside teams.\n5)No private sharing outside teams.\n6)Privately sharing code or data outside of teams is not permitted.\n7)Results should be reproducible to be eligible for prizes.",
  "1. A maximum of 2 candidates pursuing under-graduate program at " +
      "their institution are allowed per team. \n\n" +
      "2. All the participants should bring receipt and valid I-cards while " +
      "coming for the contest. A participant without an I-card will NOT be allowed " +
      "for the contest and the respective team will be disqualified.\n\n" +
      "3. Marking Scheme will be declared on the spot.",
  "1. Participants playing in a group, if any ,must not play from multiple accounts.\n\n" +
      "2. Use of Google and any other website for related searches is permitted.",
  "1. A team of maximum 3 is permissible for the event." +
      "2. Use of any front end framework is permitted." +
      "3. You are allowed to use any language but readymade " +
      "template must not be used." +
      "4. WordPress is not allowed." +
      "5. All teams shall have to get their own laptops on the day of " +
      "the competition. It is advisable to get a high speed data card (even " +
      "though net connection will be provided), for your convenience." +
      "6. All the participants should bring receipt and valid I-cards " +
      "while coming for the contest. A single team member without an " +
      "I-card will result in the disqualification of the entire team.",
  "1. A team of maximum three\n\n" +
      "candidates pursuing undergraduate/" +
      "postgraduate program are allowed.\n\n" +
      "2. All the participants should bring valid " +
      "I-Cards while coming for the contest. No one without I-Card will be allowed " +
      "for the contest and the team will be " +
      "disqualified.\n\n" +
      "3. The presentation should not be longer than 10 minutes."
];

const List<String> structure = [
  "Round 1: Send your abstract to bplan.credenz19@gmail.com. " +
      "Top 7 (+3 waiting) teams will be shortlisted for the next round. " +
      "Round 2.1:  A 12 minute presentation of your plan to panel of judges and audience. " +
      "Round 2.2:  React to a business situation." +
      "Answer the questions on approaches towards hurdles, opportunities, feasibility, and exit plan. " +
      "Top 3 teams will be awarded with cash prizes. " +
      "The best team will further get an opportunity to pitch their idea to investors and get incubation at PICT E-Cell.",
  "1. Round 1: " +
      "Problem Statement will be released on website 15 days prior to the event." +
      "Participants have to mail their abstract to email id:" +
      "contraption.credenz19@gmail.com" +
      "2. Round 2: " +
      "Best abstracts will be shortlisted from the first round. These teams will be allowed to " +
      "come to college and demonstrate their machine and present their innovation.",
  "1. There are TWO rounds per group: " +
      "1.1. Elimination Round (MCQ's Round)" +
      "1.2. Coding Round (Final Round)" +
      "2. Owing to the vast nature of the programming language, the event will be " +
      "conducted in two categories, Junior Level and Senior Level." +
      "3. The competition will test the participants' programming skills and knowledge of C/C++ and Python." +
      "4. Python Language option will be available only for First Year (FE) participants." +
      "5. Teams can register at the registration desk on the day of the event, " +
      "1 hour prior to the event. Teams can also register at desks put up at various colleges in Pune." +
      "6. The Second Round structure will be declared on the spot. " +
      "7. NOTE: Only one computer will be provided to each team.",
  "Round 1: Send your abstract to bplan.credenz19@gmail.com. " +
      "Top 7 (+3 waiting) teams will be shortlisted for the next round. " +
      "Round 2.1:  A 12 minute presentation of your plan to panel of judges and audience. " +
      "Round 2.2:  React to a business situation." +
      "Answer the questions on approaches towards hurdles, opportunities, feasibility, and exit plan. " +
      "Top 3 teams will be awarded with cash prizes. " +
      "The best team will further get an opportunity to pitch their idea to investors and get incubation at PICT E-Cell.",
  "1. Round 1: " +
      "Problem Statement will be released on website 15 days prior to the event." +
      "Participants have to mail their abstract to email id:" +
      "contraption.credenz19@gmail.com" +
      "2. Round 2: " +
      "Best abstracts will be shortlisted from the first round. These teams will be allowed to " +
      "come to college and demonstrate their machine and present their innovation.",
  "1. There are TWO rounds per group: " +
      "1.1. Elimination Round (MCQ's Round)" +
      "1.2. Coding Round (Final Round)" +
      "2. Owing to the vast nature of the programming language, the event will be " +
      "conducted in two categories, Junior Level and Senior Level." +
      "3. The competition will test the participants' programming skills and knowledge of C/C++ and Python." +
      "4. Python Language option will be available only for First Year (FE) participants." +
      "5. Teams can register at the registration desk on the day of the event, " +
      "1 hour prior to the event. Teams can also register at desks put up at various colleges in Pune." +
      "6. The Second Round structure will be declared on the spot. " +
      "7. NOTE: Only one computer will be provided to each team.",
  "Round 1: Send your abstract to bplan.credenz19@gmail.com. " +
      "Top 7 (+3 waiting) teams will be shortlisted for the next round. " +
      "Round 2.1:  A 12 minute presentation of your plan to panel of judges and audience. " +
      "Round 2.2:  React to a business situation." +
      "Answer the questions on approaches towards hurdles, opportunities, feasibility, and exit plan. " +
      "Top 3 teams will be awarded with cash prizes. " +
      "The best team will further get an opportunity to pitch their idea to investors and get incubation at PICT E-Cell.",
  "1. Round 1: " +
      "Problem Statement will be released on website 15 days prior to the event." +
      "Participants have to mail their abstract to email id:" +
      "contraption.credenz19@gmail.com" +
      "2. Round 2: " +
      "Best abstracts will be shortlisted from the first round. These teams will be allowed to " +
      "come to college and demonstrate their machine and present their innovation.",
  "1. There are TWO rounds per group: " +
      "1.1. Elimination Round (MCQ's Round)" +
      "1.2. Coding Round (Final Round)" +
      "2. Owing to the vast nature of the programming language, the event will be " +
      "conducted in two categories, Junior Level and Senior Level." +
      "3. The competition will test the participants' programming skills and knowledge of C/C++ and Python." +
      "4. Python Language option will be available only for First Year (FE) participants." +
      "5. Teams can register at the registration desk on the day of the event, " +
      "1 hour prior to the event. Teams can also register at desks put up at various colleges in Pune." +
      "6. The Second Round structure will be declared on the spot. " +
      "7. NOTE: Only one computer will be provided to each team.",
  "Round 1: Send your abstract to bplan.credenz19@gmail.com. " +
      "Top 7 (+3 waiting) teams will be shortlisted for the next round. " +
      "Round 2.1:  A 12 minute presentation of your plan to panel of judges and audience. " +
      "Round 2.2:  React to a business situation." +
      "Answer the questions on approaches towards hurdles, opportunities, feasibility, and exit plan. " +
      "Top 3 teams will be awarded with cash prizes. " +
      "The best team will further get an opportunity to pitch their idea to investors and get incubation at PICT E-Cell.",
  "1. Round 1: " +
      "Problem Statement will be released on website 15 days prior to the event." +
      "Participants have to mail their abstract to email id:" +
      "contraption.credenz19@gmail.com",
  "1. There are TWO rounds per group: " +
      "1.1. Elimination Round (MCQ's Round)" +
      "1.2. Coding Round (Final Round)" +
      "2. Owing to the vast nature of the programming language, the event will be " +
      "conducted in two categories, Junior Level and Senior Level." +
      "3. The competition will test the participants' programming skills and knowledge of C/C++ and Python." +
      "4. Python Language option will be available only for First Year (FE) participants." +
      "5. Teams can register at the registration desk on the day of the event, " +
      "1 hour prior to the event. Teams can also register at desks put up at various colleges in Pune." +
      "6. The Second Round structure will be declared on the spot. " +
      "7. NOTE: Only one computer will be provided to each team."
];
