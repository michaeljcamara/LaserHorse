size(480, 320); // size(width, height)

point(100, 100); //point(x,y)

rect(80, 150, 100, 20);  // rect(x_pos_TL, y_pos_TL, x_width, y_width)

ellipse(80, 150, 100, 20); // ellipse(x_pos_CN, y_pos_CN, x_width, y_width)

line(80, 150, 100, 20); // line(x_pos1, y_pos1, x_pos2, y_pos2)

triangle(200, 20, 250, 25, 225, 150); // triangle(x_pos1, y_pos1,x_pos2, y_pos2, x_pos3, y_pos3)

quad(200, 200, 225, 225, 250, 200, 225, 175); // quad(x1, y1, x2, y2, x3, y3, x4, y4)

//ellipse(100, 250, 100, 50);
//arc(100, 250, 100, 50, 1, 2); // arc((x_pos_CN, y_pos_CN, x_width, y_width, rad_start, rad_end)
//arc(100, 250, 100, 50, radians(90), radians(180));
arc(100, 250, 100, 50, PI, TWO_PI);
