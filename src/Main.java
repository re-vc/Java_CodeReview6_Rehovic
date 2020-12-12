public class Main {
    static DataAccess dataAccess;

    public static void main(String[] args) {
        try {
            dataAccess = new DataAccess();
        } catch (Exception e) {
            e.printStackTrace();
        }
        new Menu(dataAccess);
        try {
            dataAccess.closeDB();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}