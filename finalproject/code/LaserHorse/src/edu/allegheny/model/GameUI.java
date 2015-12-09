/****************************************
 * Michael Camara
 * Honor Code Pledge: This work is mine unless otherwise cited
 * CMPSC 382
 * Final Project: LaserHorse
 ****************************************/

package edu.allegheny.model;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Paint.Align;
import edu.allegheny.laserhorse.MainActivity;
import edu.allegheny.util.MyColors;

// Control how information is displayed on screen for lives/power level/score
public class GameUI {
	
	// Custom paint object for GameUI
	private Paint paint;
	
	// The three variables being displayed by the UI
	private int score, numLives, numPowerups;
	
	// String representations of numLives and numPowerups
	private StringBuilder lifeString, powerupString;
	
	// Initialize all variables
	public GameUI() {
		paint = new Paint();
		score = 0;
		numPowerups = 0;
		numLives = 5;
		lifeString = new StringBuilder(" X X X X X");
		powerupString = new StringBuilder(" _ _ _ _ _ _ _ _ _ _");
	}
	
	// Display most recent available information for the user's score, number of lives
	// and number of pickups obtained
	public void update(Canvas canvas) {
		
		// Create slightly transparent white rectangle on top of screen
		paint.setTextSize(70);
		paint.setStyle(Paint.Style.FILL);
		paint.setColor(MyColors.WHITE);
		paint.setAlpha(175);
		canvas.drawRect(0, 0, MainActivity.getWidth(), 100, paint);
		paint.setAlpha(255);
		
		// Display score, lives, powerups on top of this rectangle
		drawScore(canvas);
		drawLives(canvas);
		drawPowerups(canvas);
	}
	
	// Draw score in top right corner
	public void drawScore(Canvas canvas) {
		paint.setTextAlign(Align.CENTER);
		paint.setColor(MyColors.BLACK);
		canvas.drawText("Score: " + Integer.toString(score), MainActivity.getWidth() - 175, 75, paint);
	}
	
	// Draw lives in top left corner
	public void drawLives(Canvas canvas) {
		paint.setTextAlign(Align.LEFT);
		paint.setColor(MyColors.BLACK);
		canvas.drawText("Lives:" + lifeString, 25, 75, paint);	
	}
	
	// Draw power level (ie number of powerups picked up) in top center
	public void drawPowerups(Canvas canvas) {
		paint.setTextAlign(Align.CENTER);
		paint.setColor(MyColors.DARK_GREEN);
		canvas.drawText("Power:" + powerupString, MainActivity.getWidth()/2F, 75, paint);
	}
	
	// Adjust score positively or negatively
	public void adjustScore(int num) {
		score += num;
	}
	
	// Retrieve the current number of lives
	public int getLives() {
		return numLives;
	}
	
	// Adjust number of lives and string representation
	public void adjustLives(int num) {
		if(numLives > 0) {
			numLives += num;
			lifeString.replace(numLives * 2 + 1, numLives * 2 + 2, "_");
		}
	}
	
	// Adjust number of powerups and string representation	
	public void adjustPowerups(int num) {
		if(numPowerups < 10) {
			numPowerups += num;
			powerupString.replace(numPowerups * 2 - 1, numPowerups * 2, "X");
		}
	}
	
	// Display simple game over screen when number of lives decreases to zero
	public void gameOver(Canvas canvas) {
		paint.setTextSize(180);
		paint.setTextAlign(Align.CENTER);
		paint.setStyle(Paint.Style.FILL);
		paint.setColor(MyColors.WHITE);
		paint.setAlpha(175);
		canvas.drawRect(0, 0, MainActivity.getWidth(), MainActivity.getHeight(), paint);
		paint.setAlpha(255);
		paint.setColor(MyColors.BLACK);
		canvas.drawText("GAME OVER!", MainActivity.getWidth() / 2, MainActivity.getHeight() / 3, paint);
		canvas.drawText("Your Score: " + score, MainActivity.getWidth()/2, MainActivity.getHeight()/3 + 250, paint);
		paint.setTextSize(100);
		canvas.drawText("(Touch To Restart)", MainActivity.getWidth()/2, MainActivity.getHeight()/3 + 500, paint);
	}
	
	// Display simple title screen when activity is launched for the first time 
	public void showTitle(Canvas canvas) {
		paint.setTextSize(130);
		paint.setTextAlign(Align.CENTER);
		paint.setStyle(Paint.Style.FILL);
		paint.setColor(MyColors.WHITE);
		paint.setAlpha(200);
		canvas.drawRect(0, 0, MainActivity.getWidth(), MainActivity.getHeight(), paint);
		paint.setAlpha(255);
		paint.setColor(MyColors.BLACK);
		canvas.drawText("LASER HORSE", MainActivity.getWidth() / 2, MainActivity.getHeight() / 2.5F, paint);
		paint.setTextSize(100);
		canvas.drawText("(Touch To Start)", MainActivity.getWidth()/2, MainActivity.getHeight()/3 + 550, paint);
	}
}