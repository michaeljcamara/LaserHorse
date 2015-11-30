package edu.allegheny.model;

import java.util.Random;

import edu.allegheny.laserhorse.SecondActivity;
import edu.allegheny.util.MyColors;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Rect;

public class Orb {

	private int x, y, radius;
	private Paint paint;
	private int color;
	
	public Orb() {
//		this.x = x;
//		this.y = y;
		
		Random rand = new Random();
		paint = new Paint();
		
		radius = 50; 
		x = SecondActivity.getWidth() + radius;
		y = (int) (SecondActivity.getHeight() * 0.05 + rand.nextInt(SecondActivity.getHeight()) * 0.8);
		
		
		switch(rand.nextInt(5)) {
		case 0:
			color = MyColors.BRIGHT_YELLOW;
			break;
		case 1:
			color = MyColors.BRIGHT_BLUE;
			break;
		case 2:
			color = MyColors.BRIGHT_MAGENTA;
			break;
		case 3:
			color = MyColors.BRIGHT_ORANGE;
			break;
		case 4:
			color = MyColors.BRIGHT_CYAN;
			break;
		}
	}
	
	public void update(Canvas canvas) {
		
		x -= 3;

		paint.setColor(color);
		paint.setStyle(Paint.Style.FILL);
		canvas.drawCircle(x, y, radius, paint);
		paint.setColor(MyColors.BLACK);
		paint.setStrokeWidth(5);
		paint.setStyle(Paint.Style.STROKE);
		canvas.drawCircle(x, y, radius, paint);
	}
	
	public int getX() {
		return x;
	}
	
	public int getY() {
		return y;
	}
	
	public int getRadius() {
		return radius;
	}
	
	public int getColor() {
		return color;
	}
	
	public void decreaseX(int amt) {
		x -= amt;
	}
}
