class Knight {

  Knight() {
  }

  void drawKnight() {
    pushStyle();
    fill(125);
    curveTightness(0.75);


    //Legs
    beginShape();
    curveVertex(477, 336);
    curveVertex(477, 336);
    curveVertex(453, 423);
    curveVertex(565, 484);
    curveVertex(521, 640);
    curveVertex(614, 694);
    curveVertex(637, 684);
    curveVertex(631, 653);
    curveVertex(594, 627);
    curveVertex(638, 492);
    curveVertex(655, 451);
    curveVertex(629, 420);
    curveVertex(579, 355);
    curveVertex(579, 355);
    endShape(CLOSE);




    // Torso
    beginShape();
    curveVertex(446, 181);
    curveVertex(446, 181);
    curveVertex(451, 144);
    curveVertex(512, 145);
    curveVertex(576, 173);
    curveVertex(603, 208);
    curveVertex(581, 356);
    curveVertex(478, 336);
    curveVertex(478, 336);
    endShape(CLOSE);

    // Lance
    pushStyle();
    fill(255,0,0);
    beginShape();
    vertex(189, 260);
    vertex(189, 300);
    vertex(1289, 285);
    vertex(1289, 275);
    endShape(CLOSE);
    popStyle();

    // Arm
    beginShape();
    curveVertex(475, 146);
    curveVertex(447, 185);
    curveVertex(461, 232);
    curveVertex(426, 298);
    curveVertex(460, 333);
    curveVertex(547, 337);
    curveVertex(619, 329);
    curveVertex(645, 282);
    curveVertex(630, 262);
    curveVertex(621, 290);
    curveVertex(611, 264);
    curveVertex(604, 292);
    curveVertex(589, 269);
    curveVertex(588, 292);
    curveVertex(515, 293);
    curveVertex(531, 239);
    curveVertex(555, 195);
    curveVertex(544, 158);
    endShape(CLOSE);


    // Cape
    pushStyle();
    fill(160, 16, 16);
    beginShape();
    curveVertex(575, 172);
    curveVertex(563, 141);
    curveVertex(523, 120);
    curveVertex(480, 108);
    curveVertex(429, 130);
    curveVertex(378, 185);
    curveVertex(360, 222);
    curveVertex(322, 355);
    curveVertex(288, 454);
    curveVertex(304, 512);
    curveVertex(329, 497);
    curveVertex(353, 521);
    curveVertex(393, 506);
    curveVertex(417, 523);
    curveVertex(444, 492);
    curveVertex(470, 277);
    curveVertex(517, 182);
    endShape(CLOSE);
    popStyle();


    // Helmet
    beginShape();
    curveVertex(497, 130);
    curveVertex(497, 130);
    curveVertex(480, 72);
    curveVertex(498, 37);
    curveVertex(543, 18);
    curveVertex(586, 24);
    curveVertex(614, 51);
    curveVertex(615, 79);
    curveVertex(520, 58);    // left up
    curveVertex(597, 150);  // bottom right
    curveVertex(616, 83);
    curveVertex(596, 132);
    curveVertex(571, 170);
    curveVertex(571, 170);
    endShape(CLOSE);

// Visor
pushStyle();
strokeWeight(5);
beginShape();
vertex(615, 79);
 vertex(520, 58);    // left up
  vertex(597, 150);  // bottom right
endShape(CLOSE);

line(553, 66, 553, 98);
line(576, 72, 576, 123);
line(598, 76, 598, 140);
popStyle();

    popStyle();
  }
}