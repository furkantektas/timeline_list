import 'package:flutter/material.dart';

class Doodle {
  final String name;
  final String time;
  final String content;
  final String doodle;
  final Color iconBackground;
  final Icon icon;

  const Doodle(
      {required this.name,
      required this.time,
      required this.content,
      required this.doodle,
      required this.icon,
      required this.iconBackground});
}

const List<Doodle> doodles = [
  Doodle(
      name: "Al-Sufi (Azophi)",
      time: "903 - 986",
      content:
          "One of Al-Sufi's greatest works involved fact-checking the Greek astronomer Ptolemy's measurements of the brightness and size of stars. In the year 964 AD, Al-Sufi published his findings in a book titled Kitab al-Kawatib al-Thabita al-Musawwar, or The Book of Fixed Stars. In many cases, he confirmed Ptolemy’s discoveries, but he also improved upon his work by illustrating the constellations and correcting some of Ptolemy’s observations about the brightness of stars.",
      doodle:
          "https://www.google.com/logos/doodles/2016/abd-al-rahman-al-sufis-azophi-1113th-birthday-5115602948587520-hp2x.jpg",
      icon: Icon(Icons.star, color: Colors.white),
      iconBackground: Colors.cyan),
  Doodle(
      name: "Abu al-Wafa’ al-Buzjani",
      time: "940 - 998",
      content:
          "Abu al-Wafa' is an innovator whose contributions to science include one of the first known introductions to negative numbers, and the development of the first quadrant, a tool used by astronomers to examine the sky. His pioneering work in spherical trigonometry was hugely influential for both mathematics and astronomy.",
      doodle:
          "https://www.google.com/logos/doodles/2015/abu-al-wafa-al-buzjanis-1075th-birthday-5436382608621568-hp2x.jpg",
      icon: Icon(Icons.exposure, color: Colors.white),
      iconBackground: Colors.redAccent),
  Doodle(
      name: "Al-Hasan Ibn al-Haytham",
      time: "c. 965 - c. 1040",
      content:
          "Ibn al-Haytham was the first to explain through experimentation that vision occurs when light bounces on an object and then is directed to one's eyes. He was also an early proponent of the concept that a hypothesis must be proved by experiments based on confirmable procedures or mathematical evidence—hence understanding the scientific method five centuries before Renaissance scientists.",
      doodle:
          "https://www.google.com/logos/doodles/2013/alhazens_1048th_birthday-1974005-hp.jpg",
      icon: Icon(Icons.visibility, color: Colors.black87, size: 32.0),
      iconBackground: Colors.pinkAccent),
  Doodle(
      name: "Al-Bīrūnī",
      time: "973 - 1050",
      content:
          "Biruni is regarded as one of the greatest scholars of the Golden Age of Muslim civilisation and was well versed in physics, mathematics, astronomy, and natural sciences, and also distinguished himself as a historian, chronologist and linguist. He studied almost all fields of science and was compensated for his research and strenuous work. Royalty and powerful members of society sought out Al-Biruni to conduct research and study to uncover certain findings.",
      doodle: "https://www.google.com/logos/2012/al_biruni-2012-hp.jpg",
      icon: Icon(Icons.account_balance, color: Colors.black87),
      iconBackground: Colors.amber),
  Doodle(
      name: "Ibn Sina (Avicenna)",
      time: "980 - 1037",
      content:
          "Avicenna (Ibn Sīnā) was a Persian polymath who is regarded as one of the most significant physicians, astronomers, thinkers and writers of the Islamic Golden Age. He has been described as the father of early modern medicine. Of the 450 works he is known to have written, around 240 have survived, including 150 on philosophy and 40 on medicine.\nHis most famous works are The Book of Healing, a philosophical and scientific encyclopedia, and The Canon of Medicine, a medical encyclopedia which became a standard medical text at many medieval universities and remained in use as late as 1650. In 1973, Avicenna's Canon Of Medicine was reprinted in New York.\nBesides philosophy and medicine, Avicenna's corpus includes writings on astronomy, alchemy, geography and geology, psychology, Islamic theology, logic, mathematics, physics and works of poetry.",
      doodle:
          "https://www.google.com/logos/doodles/2018/ibn-sinas-1038th-birthday-5768556863029248.2-l.png",
      icon: Icon(Icons.healing, color: Colors.white),
      iconBackground: Colors.green),
  Doodle(
      name: "Ibn Rushd (Averroes)",
      time: "1126 - 1198",
      content:
          "Averroes was an Andalusian philosopher and thinker who wrote about many subjects, including philosophy, theology, medicine, astronomy, physics, Islamic jurisprudence and law, and linguistics. His philosophical works include numerous commentaries on Aristotle, for which he was known in the West as The Commentator. He also served as a judge and a court physician for the Almohad Caliphate.",
      doodle:
          "https://www.google.com/logos/doodles/2014/averroes-888th-birthday-born-1126-5645446378684416-hp.jpg",
      icon: Icon(Icons.blur_circular, color: Colors.white),
      iconBackground: Colors.indigo),
  Doodle(
      name: "Nasir al-Din Tusi",
      time: "1201 - 1274",
      content:
          "Tusi was a Persian polymath, architect, philosopher, physician, scientist, and theologian. He is often considered the creator of trigonometry as a mathematical discipline in its own right. Ibn Khaldun (1332–1406) considered Al-Tusi to be the greatest of the later Persian scholars.",
      doodle:
          "https://www.google.com/logos/2013/nasir_al-din_al-tusis_812th_birthday-1054005-hp.jpg",
      icon: Icon(Icons.category, color: Colors.white),
      iconBackground: Colors.pinkAccent),
  Doodle(
      name: "Ibn Battuta",
      time: "1304 - 1368",
      content:
          "Over a period of thirty years, Ibn Battuta visited most of the Islamic world and many non-Muslim lands, including North Africa, the Horn of Africa, West Africa, the Middle East, Central Asia, Southeast Asia, South Asia and China. Near the end of his life, he dictated an account of his journeys, titled A Gift to Those Who Contemplate the Wonders of Cities and the Marvels of Travelling (Tuḥfat an-Nuẓẓār fī Gharāʾib al-Amṣār wa ʿAjāʾib al-Asfār), usually simply referred to as The Travels (Rihla). This account of his journeys provides a picture of a medieval civilisation that is still widely consulted today.",
      doodle: "https://www.google.com/logos/2012/battuta11-hp.jpg",
      icon: Icon(Icons.navigation, color: Colors.white, size: 32.0),
      iconBackground: Colors.deepPurpleAccent),
  Doodle(
      name: "Ibn Khaldun",
      time: "1332 - 1406",
      content:
          "He is widely considered as a forerunner of the modern disciplines of historiography, sociology, economics, and demography.\nHe is best known for his book, the Muqaddimah or Prolegomena ('Introduction'). The book influenced 17th-century Ottoman historians like Kâtip Çelebi, Ahmed Cevdet Pasha and Mustafa Naima, who used the theories in the book to analyse the growth and decline of the Ottoman Empire. Also, 19th-century European scholars acknowledged the significance of the book and considered Ibn Khaldun to be one of the greatest philosophers of the Middle Ages.",
      doodle: "https://www.google.com/logos/2011/ibn11-hp.jpg",
      icon: Icon(Icons.supervised_user_circle, color: Colors.white),
      iconBackground: Colors.teal),
  Doodle(
      name: "Piri Reis",
      time: "1465 - 1553",
      content:
          "He is primarily known today for his maps and charts collected in his Kitab-ı Bahriye (Book of Navigation), a book that contains detailed information on navigation, as well as very accurate charts (for their time) describing the important ports and cities of the Mediterranean Sea. He gained fame as a cartographer when a small part of his first world map (prepared in 1513) was discovered in 1929 at the Topkapı Palace in Istanbul. His world map is the oldest known Turkish atlas showing the New World, and one of the oldest maps of America still in existence anywhere (the oldest known map of America that is still in existence is the map drawn by Juan de la Cosa in 1500). Piri Reis' map is centered on the Sahara at the latitude of the Tropic of Cancer.",
      doodle:
          "https://www.google.com/logos/2013/500th_anniversary_of_the_piri_reis_map-1696005-hp.jpg",
      icon: Icon(Icons.map, color: Colors.white, size: 32.0),
      iconBackground: Colors.blue),
];
