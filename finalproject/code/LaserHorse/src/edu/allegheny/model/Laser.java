package edu.allegheny.model;

import edu.allegheny.util.MyColors;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Rect;

public class Laser {
	
	private int x, y, width, height;
	int yUp, yDown;
	private static Paint laserPaint = new Paint();
	private boolean collided;

	public Laser(int x, int y) {
		this.x = x;
		this.y = y;
		
		width = 50;
		height = 20;
		
		collided = false;

		laserPaint.setColor(MyColors.BRIGHT_RED);
		laserPaint.setStyle(Paint.Style.FILL);
		
		yUp = y - 5;
		yDown = y + 5;
	}
	
	public void update(Canvas canvas) {//, Paint paint) {
		
		x += 10;
		
		yUp -= 5;
		yDown += 5;

		canvas.drawRect(new Rect(x,y,x+width,y+height), laserPaint);
//		canvas.drawRect(new Rect(x,yUp,x+width,yUp+height), laserPaint);
//		canvas.drawRect(new Rect(x,yDown,x+width,yDown+height), laserPaint);
	}
	
	public int getX() {
		return x;
	}

	public int getY() {
		return y;
	}

	public int getWidth() {
		return width;
	}

	public int getHeight() {
		return height;
	}
	
	public void setCollided(boolean status) {
		collided = status;
	}
	
	public boolean hasCollided() {
		return collided;
	}
}
