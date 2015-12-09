/****************************************
 * Michael Camara
 * Honor Code Pledge: This work is mine unless otherwise cited
 * CMPSC 382
 * Final Project: LaserHorse
 ****************************************/

package edu.allegheny.laserhorse;

import android.app.Activity;
import android.os.Bundle;
import android.util.DisplayMetrics;

// Android program execution starts here
public class MainActivity extends Activity {
	
	private static int width, height;
	
	// This method is run immediately when the application is launched
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		
		// Create and set view to CustomView
		super.onCreate(savedInstanceState);
		CustomView view = new CustomView(this);
		setContentView(view);
		
		// Allow access to the user's screen information (width/height)
		DisplayMetrics metrics = new DisplayMetrics();
		getWindowManager().getDefaultDisplay().getMetrics(metrics);
		width = metrics.widthPixels;
		height = metrics.heightPixels;
	}
	
	// Get the width of the user's screen
	public static int getWidth() {
		return width;
	}
	
	// Get the height of the user's screen
	public static int getHeight() {
		return height;
	}
}