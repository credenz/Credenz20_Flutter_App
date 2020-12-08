import 'dart:core';
import 'package:flutter/material.dart';

const List<AssetImage> eventimages = [
  AssetImage('images/clash1.png'),
  AssetImage('images/contraption.png'),
  AssetImage('images/cretronix.png'),
  AssetImage('images/enigma.png'),
  AssetImage('images/datawizwhite.png'),
  AssetImage('images/nth.png'),
  AssetImage('images/paper.png'),
  AssetImage('images/pixelate.png'),
  AssetImage('images/quiz.png'),
  AssetImage('images/revb.png'),
  AssetImage('images/roboliga.png'),
  AssetImage('images/xodia.png'),
];

const List<String> eventName=[
  "Clash","Contraption","Cretronix","Enigma","DataWiz","NTH","Paper Presentation","Pixelate","Quiz","Reverse Coding","Roboliga","Xodia"
];

const List<String> intro = [
  "Have you always dreamt of having your own business or product ?\n" +
      "B-Plan is the perfect platform for you to showcase your ideas before " +
      "a panel of the best marketing professionals!\n" +
      "Make a presentation describing your business idea, and get a chance to " +
      "win funding from the investors. \n\n" +
      "*Registration Fees:*\n" +
      "IEEE Members: 120/-\n" +
      "Non IEEE Members: 150/-",


  "Have you ever wondered how to apply toothpaste on your brush " +
      "in 20 steps? Ever wondered how to light a candle in 30 steps? Contraption " +
      "is all about, complexifying the simplest of " +
      "things you see around yourself. Its whole essence lies in a perfectly balanced mix of " +
      "innovation, creativity, relevance which results in profound entertainment.\n\n" +
      "<b>Registration Fees:</b>\n" +
      "IEEE Members: 180/-\n" +
      "Non-IEEE Members: 200/-",

  "Put your logical acumen and coding expertise to the " +
      "test as you clash with a round of perplexing MCQs followed " +
      "by a set of time-bound coding challenges, carefully designed to " +
      "assess your command over programming in the language of your choice- Python, C or C++. \n" +
      "\n" +
      "Showcase your technical proficiency as you have a go at competitive " +
      "coding with plenty to learn and nothing to lose.\n\n" +
      "<b>Registration Fees:</b>\n" +
      "IEEE Members: 80/- \n" +
      "Non-IEEE Members: 100/-",

  "Battle it out on the bread board!\n" +
      "\n" +
      "Challenge your brains to clear a test where you demonstrate your " +
      "knowledge in the field of electronics, physics, logical ability and build " +
      "a circuit by interpreting the hints provided.\n" +
      "\n" +
      "Prerequisites: Theoretical and practical knowledge in the field of " +
      "digital electronics, electrical circuits and physics.\n\n" +
      "<b>Registration Fees:</b>\n" +
      "IEEE Members: 120/- per team\n" +
      "Non-IEEE Members: 150/- per team",

  "An online treasure hunt where players find different " +
      "pieces of clues on various websites to solve a variety of puzzles. " +
      "Solve a set of riddles with important clues and get to the finish line before anyone can.\n" +
      "\n" +
      "Decrypt the encrypted, go along the trail and race " +
      "with others to win! This is your chance to know how good " +
      "you are with web and test your surfing skills. So, log on to our " +
      "website and solve your way through the questions.\n" +
      "\n" +
      "To start solving, visit nth.credenz.in \n" +
      "\n" +
      "<b>Registration Fees:</b> Free!",

  "A non-technical aptitude based event. An event everyone " +
      "can participate in and enjoy. Enigma presents to its players, " +
      "an array of brain tickling logical reasoning questions. Put your " +
      "mind to test and see where you stand among the crowd. May the wittiest triumph.\n\n" +
      "<b>Registration Fees:</b>\n" +
      "IEEE Members: 40/-\n" +
      "Non-IEEE Members: 50/-",

  "Get ready to set off on a journey with captivating questions " +
      "and puzzles on the way, led by a piquant quizmaster. \n" +
      "There are three quizzes lying in wait for you:\n" +
      "1. General Quiz: Test your knowledge about what's happening in the " +
      "world in this expansive quiz, ranging from Brexit to Chandrayaan. \n" +
      "2. MELA Quiz: The music, entertainment, literature and arts quiz is " +
      "hardly as easy as it sounds; with questions from Austen's works to the " +
      "newest Marvel movie, this is definitely for the pop culture buffs. \n" +
      "3. Biz Tech Quiz: Bring your A game to this quiz, where the knowledge of " +
      "marketing, business, economics and the latest technology will come in handy. \n" +
      "Can you beat these quizzes or be defeated by our questionnaire? \n\n" +
      "<b>Registration Fees:</b>\n" +
      "IEEE Members: 40/- per quiz\n" +
      "Non-IEEE Members: 50/- per quiz",


  "Paint your virtual canvas with the pixels of your artistry. " +
      "Let creativity fuse with the finesse of your vision as the beauty " +
      "of design integrates with technology. Come, digitalise your art and " +
      "let your mouse be your paint brush! \n\n" +
      "<b>Registration Fees:</b>\n" +
      "IEEE Members: 120/-\n" +
      "Non IEEE Members: 150/-",


  "For bot-makers and adrenaline chasers, comes an event which " +
      "will excite and leave you spellbound. Bring your bots and your " +
      "football skills to the field and battle it out to reign supreme. " +
      "Watch bots show extreme speed and agility combined with clever tactics " +
      "to score over their opponents.\n\n" +
      "<b>Registration Fees:</b>\n" +
      "IEEE Members: 160/-\n" +
      "Non- IEEE Members: 200/-",

  "Let the rise and fall of market shares bring out your inner businessman!\n" +
      "From the chaos due to the fluctuations in Sensex to the never ending trades, " +
      "get ready to take over the virtual stock market.\n" +
      "After all, every investment is one step closer to your dream bank balance!\n\n" +
      "<b>Registration Fees:</b>\n" +
      "IEEE Members: 40/-\n" +
      "Non IEEE Members : 50/-",

  "The intense programming competition where you code your bot to fight till the end!\n" +
      "Two bots will go head to head against each other in a fierce match. \n" +
      "May the best bot win!\n\n" +
      "<b>Registration Fees:</b> Free!",

  "An investment in knowledge always pays the best interest. \n" +
      "Compete against the most intellectual minds and their progressive ideas!\n" +
      "Paper presentation is the perfect platform for undergraduate/postgraduate students to " +
      "present technical papers with advanced perspectives while honing their skills of research " +
      "and creating new dimensions of technology!\n\n" +
      "<b>Registration Fees:</b>\n" +
      "IEEE Members: 180\n" +
      "Non IEEE Members: 200",

  "A coding competition to test your compilation " +
      "of the combinations of algorithms and conceptual understanding " +
      "of the programming languages C/C++. Combine logic and agility to " +
      "decipher given patterns and code to decode these sequences to find the final answer.\n\n" +
      "<b>Registration Fees:</b>\n" +
      "IEEE Members: 60/-\n" +
      "Non IEEE Members: 80/-",


  "Want to step into the world of data science? \n" +
      "\n" +
      "DataWiz gives you the perfect opportunity to test your machine " +
      "learning and data analytics skills. Analyse and find inherent patterns " +
      "in the dataset provided and make predictions with help of the models you make!\n\n" +
      "<b>Registration Fees:</b>\n" +
      "IEEE Members: 80/- \n" +
      "Non-IEEE Members: 100/-",


  "An aesthetically pleasing and user-friendly website is necessary to keep visitors engaged online.\n" +
      "If you think you have the flair to create such a site, WebWeaver is the competition for you!\n" +
      "A perfect integration of technology and creativity will lead you to win this competition.\n" +
      "\n" +
      "<b>Registration Fees:</b>\n" +
      "IEEE Members: 120/-\n" +
      "Non IEEE Members: 150/-"

];


const List<String> contact = ["Sudhanshu Bhoi: +91 8975167862" +
    "Neelanjney Pilarisetty:91 8087084718",

  "Isha Pardikar:" + " +91-9309116833",

  "Ajay Kadam:" + " 91-8669286645" +
      "Saumitra Kulkarni:" + "+91-8806850222",

  "Rajavi Kakade:" + " +91-7798130523" +
      "Rohit Nagotkar:" + " +91-8668297216",

  "Amol Gandhi:" + " +91-928413533" +
      "Piyusha Gumte:" + " +91-7745000663",

  "Vansh Kaul:" + " +91-9370663915" +
      "Hritik Zutshi:" + " +91-7701864159",

  "Sudhanshu Bhoi: +91 8975167862" +
      "Neelanjney Pilarisetty:91 8087084718",

  "Isha Pardikar:" + " +91-9309116833",

  "Ajay Kadam:" + " 91-8669286645" +
      "Saumitra Kulkarni:" + "+91-8806850222",
  "Rajavi Kakade:" + " +91-7798130523" +

      "Rohit Nagotkar:" + " +91-8668297216",
  "Amol Gandhi:" + " +91-928413533" +

      "Piyusha Gumte:" + " +91-7745000663",

  "Vansh Kaul:" + " +91-9370663915" +
      "Hritik Zutshi:" + " +91-7701864159"

];

const List<String> judging = ["1. Identifies a business opportunity. " +
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

  "1. The competition will test participants programming skills and knowledge of C/C++. " +
      "2. Time and cost efficiency of the code.",
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

  "1. The competition will test participants programming skills and knowledge of C/C++. " +
      "2. Time and cost efficiency of the code."


];

const List<String> rules = [
  "1. A team of maximum three members (UG/PG) are allowed to participate.\n" +
      "2. Proposed Business Plan should not violate any intellectual property rights.\n" +
      "3. All the participants must present a receipt and valid ID during the contest.\n" +
      "4. Violation of any rule might lead to disqualification of the team at any stage of the competition.\n",

  "1. A team of max. four members is allowed to participate.\n\n" +
      "2. Machine should be of dimensions 8*8*8 feet (maximum).\n\n" +
      "3. Minimum 10 steps should be involved to complete the task otherwise " +
      "team will be disqualified. However there is no constrain on maximum number of steps.\n\n" +
      "4. Use memory devices in minimum 3  steps.\n\n" +
      "5. Photo should be revealed at the end and not displayed already.\n\n" +
      "6. Minimum 4 different energy conversions should be implemented in machine. " +
      "Otherwise team will be disqualified.\n\n" +
      "7. Machine should perform the task in maximum 4 minutes.\n\n" +
      "8. Machine should not take support of any four walls and ceiling.\n\n" +
      "9. Teams have to submit abstract and flowchart in prescribed format well before " +
      "the deadline of first round.\n\n" +
      "10. Maximum of three trials/chances will be given to any team. For every other " +
      "chance/trial there will be deduction of points.\n\n" +
      "11. For every next chance reset time of 15 minutes will be given to team.\n\n" +
      "12. Only one team member is allowed to interact with the machine once the evaluation " +
      "has begun. This includes resetting the machine during the run. This means only one " +
      "person will be allowed inside the arena.\n\n" +
      "13. However, if the team goes for another run, the restriction of one person inside " +
      "the arena is uplifted until the machine is ready for the other run.\n\n" +
      "14. That person will explain about the machine and each step going on to judges.\n\n" +
      "15. Each step in the machine should be considered as the transfer of one energy into " +
      "another. A step is considered to accomplish when there is energy transformation. Example " +
      "ball coming down from the wedge and hitting the domino is considered a step. In this " +
      "potential energy of ball gets converted into kinetic energy while coming down and when " +
      "it hits the domino, it transfers its energy into domino.\n\n" +
      "16. Identical transfers of energy in succession should be considered one step. For eg., " +
      "a set of dominos falling into each other should be considered one step. While technically " +
      "each single domino falling is a step, stating one hundred steps for hundred dominos is " +
      "repetitive and against the spirit of Rube Goldberg.\n\n" +
      "17. You can use any material for making of your machine provided in any case, they does " +
      "not lead damage to arena and other machines. Otherwise it will lead to disqualification of team.\n\n" +
      "18. Hazardous materials are not allowed and any gas or any explosives are also not allowed.\n\n" +
      "19. We will not provide you any material for making of your Machine.\n\n" +
      "20. However basic stationary materials will be provided to you.\n\n" +
      "21. You have to bring extension boards of your own.\n\n" +
      "22. Bring 2 copies of abstract when you perform in college.\n\n" +
      "23. No animal should be used.\n\n" +
      "24. Organizers have the right to change a rule or all if they feel.",

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
      "3. The presentation should not be longer than 10 minutes.",


  "1. A team of maximum three members (UG/PG) are allowed to participate.\n" +
      "2. Proposed Business Plan should not violate any intellectual property rights.\n" +
      "3. All the participants must present a receipt and valid ID during the contest.\n" +
      "4. Violation of any rule might lead to disqualification of the team at any stage of the competition.\n",

  "1. A team of max. four members is allowed to participate.\n\n" +
      "2. Machine should be of dimensions 8*8*8 feet (maximum).\n\n" +
      "3. Minimum 10 steps should be involved to complete the task otherwise " +
      "team will be disqualified. However there is no constrain on maximum number of steps.\n\n" +
      "4. Use memory devices in minimum 3  steps.\n\n" +
      "5. Photo should be revealed at the end and not displayed already.\n\n" +
      "6. Minimum 4 different energy conversions should be implemented in machine. " +
      "Otherwise team will be disqualified.\n\n" +
      "7. Machine should perform the task in maximum 4 minutes.\n\n" +
      "8. Machine should not take support of any four walls and ceiling.\n\n" +
      "9. Teams have to submit abstract and flowchart in prescribed format well before " +
      "the deadline of first round.\n\n" +
      "10. Maximum of three trials/chances will be given to any team. For every other " +
      "chance/trial there will be deduction of points.\n\n" +
      "11. For every next chance reset time of 15 minutes will be given to team.\n\n" +
      "12. Only one team member is allowed to interact with the machine once the evaluation " +
      "has begun. This includes resetting the machine during the run. This means only one " +
      "person will be allowed inside the arena.\n\n" +
      "13. However, if the team goes for another run, the restriction of one person inside " +
      "the arena is uplifted until the machine is ready for the other run.\n\n" +
      "14. That person will explain about the machine and each step going on to judges.\n\n" +
      "15. Each step in the machine should be considered as the transfer of one energy into " +
      "another. A step is considered to accomplish when there is energy transformation. Example " +
      "ball coming down from the wedge and hitting the domino is considered a step. In this " +
      "potential energy of ball gets converted into kinetic energy while coming down and when " +
      "it hits the domino, it transfers its energy into domino.\n\n" +
      "16. Identical transfers of energy in succession should be considered one step. For eg., " +
      "a set of dominos falling into each other should be considered one step. While technically " +
      "each single domino falling is a step, stating one hundred steps for hundred dominos is " +
      "repetitive and against the spirit of Rube Goldberg.\n\n" +
      "17. You can use any material for making of your machine provided in any case, they does " +
      "not lead damage to arena and other machines. Otherwise it will lead to disqualification of team.\n\n" +
      "18. Hazardous materials are not allowed and any gas or any explosives are also not allowed.\n\n" +
      "19. We will not provide you any material for making of your Machine.\n\n" +
      "20. However basic stationary materials will be provided to you.\n\n" +
      "21. You have to bring extension boards of your own.\n\n" +
      "22. Bring 2 copies of abstract when you perform in college.\n\n" +
      "23. No animal should be used.\n\n" +
      "24. Organizers have the right to change a rule or all if they feel.",

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