package edu.allegheny.model;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.Random;

import edu.allegheny.util.MyColors;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;

public class Background {

	private Paint paint;
	private ArrayList<Orb> orbs;

	public Background() {
		paint = new Paint();
		orbs = new ArrayList<Orb>();
	}

	public void update(Canvas canvas) {
		canvas.drawColor(MyColors.DARK_GRAY);

		Iterator<Orb> orbIterator = orbs.iterator();
		//		for(Orb orb : orbs) {
		while(orbIterator.hasNext()) {
			Orb orb = orbIterator.next();
			if(orb.getX() + orb.getRadius()*2 <= 0) {
				orbIterator.remove();
			}
			else {

				int color = orb.getColor();

				float [] hsv = new float[3];
				Color.colorToHSV(color, hsv);
				hsv[1] *= 0.2;
				color = Color.HSVToColor(hsv);

//				Random rand = new Random();
//				int randNum = rand.nextInt(5) + 1;
				orb.decreaseX(1);
//				orb.decreaseX(randNum);

				paint.setColor(color);
				canvas.drawCircle(orb.getX(), orb.getY(), 100, paint);
			}
		}
	}

	public void addOrb(Orb orb) {
		orbs.add(orb);
	}
}
