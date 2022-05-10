package core;

public class Araclar {
	private static final int sure=200;

    public static void bekle(int sure){
        try
        {
            Thread.sleep(sure);
        }
        catch(InterruptedException ex)
        {
            Thread.currentThread().interrupt();
        }
    }

    public static void bekle(){
        try
        {
            Thread.sleep(sure);
        }
        catch(InterruptedException ex)
        {
            Thread.currentThread().interrupt();
        }
    }
}
