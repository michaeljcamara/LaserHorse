package edu.allegheny.laserhorse;

import java.util.ArrayList;
import java.util.Iterator;

import edu.allegheny.model.Background;
import edu.allegheny.model.Horse;
import edu.allegheny.model.Orb;
import edu.allegheny.util.CollisionDetector;
import edu.allegheny.util.MyColors;
import android.annotation.SuppressLint;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Icon.OnDrawableLoadedListener;
import android.os.SystemClock;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.DragEvent;
import android.view.MotionEvent;
import android.view.SurfaceView;
import android.view.View;

@SuppressLint("NewApi")
public class CustomView extends View { //implements Runnable {//implements Runnable{

	private Rect myRect;
	private Paint paint;
	private static final int SQUARE_SIDE_LENGTH = 200;
//	private float newX = 1000, newY = 1000;
	private int newX = 200, newY = 500;
	public static int count = 0;
	private Path path,path2;
	private Horse horse;
	private Background background;
	private boolean isTouched = false;
	private Thread horseThread;
	private static int LASER_FREQ = 10;
	private static int ORB_FREQ = 100;
	private long prevLaserTime = 0, prevOrbTime = 0;
	
	private ArrayList<Orb> orbs; 
	private CollisionDetector detector;
	private Context context;
	
	

	@SuppressLint("NewApi")
	public CustomView(Context context) {
		super(context);
		this.context = context;
		orbs = new ArrayList<Orb>();
		detector = new CollisionDetector();

		myRect = new Rect(30, 30, SQUARE_SIDE_LENGTH, SQUARE_SIDE_LENGTH);
		paint = new Paint();
		paint.setColor(Color.MAGENTA);
		paint.setStyle(Paint.Style.STROKE);

		horse = new Horse();
		background = new Background();

		//		horseThread = new Thread(this, "Horse Thread");
		//		horseThread.start();
	}

	@Override
	protected void onDraw(Canvas canvas) {

		//		canvas.translate(newX, newY);		
		//		canvas.rotate((float)Math.sin(count/5.0)*10);
		//		canvas.translate(-newX, -newY);
		//		path.offset(newX, newY);
		//		path2.offset(newX, newY);
		//
		//		canvas.drawPath(path, paint);
		//		canvas.drawPath(path2,paint);
		//		path.offset(-newX, -newY);
		//		path2.offset(-newX, -newY);
		//		canvas.translate(newX, newY)
		
		background.update(canvas);
		
		paint.setColor(Color.LTGRAY);
		canvas.drawRect(new RectF(newX-200, newY-200, newX+275, newY+150), paint);
		
		canvas.save();
		canvas.translate(newX-250, newY-200);
		canvas.scale(0.5F, 0.5F);
		horse.update(canvas);

		//		canvas.translate(newX+500, newY+400);
		//		canvas.translate(-newX, -newY);
		//		canvas.translate(-newX*2, -newY*2);

		
		

		paint.setTextSize(70);
		paint.setColor(MyColors.BLACK);

//		canvas.drawText(Integer.toString(newX), 1500, 100, paint);
//		canvas.drawText(Integer.toString(newY), 1500, 300, paint);
		
		canvas.restore();
		
		
		if(isTouched == true && SystemClock.currentThreadTimeMillis() - prevLaserTime > LASER_FREQ) {
			horse.createLaser(canvas, detector, newX + 240, newY - 150);
			prevLaserTime = SystemClock.currentThreadTimeMillis();
		}
		
		if(SystemClock.currentThreadTimeMillis() - prevOrbTime > ORB_FREQ) {
			Orb orb = new Orb();
			orbs.add(orb);
			prevOrbTime = SystemClock.currentThreadTimeMillis();
		}
		
		horse.shootLasers(canvas);
		
		Iterator<Orb> orbIterator = orbs.iterator();
		
		while(orbIterator.hasNext()) {
			Orb orb = orbIterator.next();
			orb.update(canvas);
			
			if(detector.checkCollision(context, orb) == true) {
				background.addOrb(orb);
				orbIterator.remove();
			}
		}
		
		invalidate();
		//checkCollisions();
			
	}


	@Override
	public boolean onTouchEvent(MotionEvent event) {
		// Draw rect so it is centered around touch
//		isTouched = true;
		if(event.getAction() == MotionEvent.ACTION_UP) {
			isTouched = false;
		}
		else {
			isTouched = true;
		}
		newX = (int) event.getX();
		newY = (int) event.getY();

		invalidate(); // Let system know there has been change in CustomView, do onDraw again
		return true; // Indicates that a touch event was handled
		
	}
}
