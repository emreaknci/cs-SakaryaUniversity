
package a321$_.$_as;

import java.util.*;

public class Deneme<T, S > {
	public int x;
	public int y;

	public Deneme(int x, int y) {
		this.x = x;
		this.y = y;
	}


	public <B extends Deneme> int x2y2(B d) {
		int s = -x + 55 + x++ - ++x + (+x);
		return x * x + y * y;
	}


	public double karakok() {
		Deneme<Integer, 
				ArrayList<Double>> s = new Deneme(1, 2);
		Deneme<Integer, ArrayList<Double>> s1 = new Deneme(1, 2);
		Deneme<Integer, ArrayList<Double>> s2 = new Deneme(1, 2); 
		if (x > y)
			return 0.0;
		if (x < y) 
			return 1.0;
		if (x < y && ((+x / 5) < x ^ (6 >= 8 && (((+(x) >= y))))))
			return 0.0;
		if (x > -y)
			return 1.0;
		ArrayList<HashMap<$Klass, _BB_>> asd; 
		x += +x;
		x = +x++;
		double ss = .5;
		x &= x << 8;
		x = x & 8;
		x = x | 8;
		x |= x | x >>> 8 | x;
		x = x ^ 8 | ~x;
		x = x ^ +8 << x >> x - -x;
		x = x % +8 + -x;
		char[] sss = { '\u7505', '\"', '"' };
		String xs = "x = x & 8;\n" + "		x = x | 8;\n" + "		x =\" x | 8 | x;\n" + "		x = x ^ 8 | x;\n"
				+ "		x = x % +8 - - x;" + "asd" + 5 + +5 + "gdf";
		return Math.sqrt((double) x2y2(s)); 
	}

	@interface as {
		String sd();

	}

	interface F<A> {

	}

	class $Klass {
	}

	class _BB_ {
	}

	public double log2() {
		x = + ++x;
		x = x-- - - --x;
		return Math.log(((double) x) / y);
	}

	@Override
	public boolean equals(Object obj) {
		boolean ss = false;
		boolean s1 = ss ^ !false;
		ss &= !false;
		if (obj != null && obj instanceof Deneme) {
			return +(-((Deneme) obj).x) == this.x && !(((Deneme) obj).y == +this.y);
		}
		return false;
	}
}