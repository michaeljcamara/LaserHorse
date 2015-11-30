package edu.allegheny.laserhorse;

import android.app.Activity;
import android.os.Bundle;
import android.util.DisplayMetrics;
import android.util.Log;

public class SecondActivity extends Activity {
	
	private static int width, height;
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		// TODO Auto-generated method stub
		super.onCreate(savedInstanceState);
		
		CustomView view = new CustomView(this);
		setContentView(view);
		
		DisplayMetrics metrics = new DisplayMetrics();
		getWindowManager().getDefaultDisplay().getMetrics(metrics);
//		Log.d("ApplicationTagName", "Display width in px is " + metrics.widthPixels);
		
		width = metrics.widthPixels;
		height = metrics.heightPixels;
	}
	
	public static int getWidth() {
		return width;
	}
	
	public static int getHeight() {
		return height;
	}

//	@Override
//	public void run() {
////		super.run
//		count++;
//	}
//	
//	@Override
//	public void onStart() {
//		super.onStart();
//		count++;
//	}
//
//	@Override
//	public void onResume() {
//		super.onResume();
//		count++;
//	}
}
