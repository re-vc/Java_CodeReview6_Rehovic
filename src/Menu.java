import java.util.Scanner;

public class Menu {

    private static Scanner sc = new Scanner(System.in);

    public Menu(DataAccess dataAccess){
        System.out.println("+------------------------------------+");
        System.out.println("| The School                         |");
        System.out.println("+------------------------------------+");
        showMenu(dataAccess);
    }

    public void showMenu(DataAccess dataAccess){
        System.out.println(
                "1) Display all students.\n" +
                "2) Display all teachers.\n" +
                "3) Display all classes.\n" +
                "4) Display courses of a specific teacher.\n" +
                "0) Quit");

        System.out.println("Enter your choice: ");
        int getInput = Integer.parseInt(sc.next());
        switch (getInput){
            case 1:
                dataAccess.displayAllStudents();
                showMenu(dataAccess);
                break;
            case 2:
                dataAccess.displayAllTeachers();
                showMenu(dataAccess);
                break;
            case 3:
                dataAccess.displayAllClasses();
                showMenu(dataAccess);
                break;
            case 4:
                System.out.println("Enter teacher ID (0 = back): ");
                dataAccess.displayAllTeachersWithId();
                int teacherId = sc.nextInt();
                if (teacherId == 0){
                    showMenu(dataAccess);
                } else if(dataAccess.getAllTeachers().size() >= teacherId){
                    dataAccess.displayClassesOfTeacher(teacherId);
                    showMenu(dataAccess);
                } else{
                    System.out.println(teacherId + " is a wrong / unset teacher ID ");
                    showMenu(dataAccess);
                }
                break;
            case 0:
                System.out.println("Good bye.");
                return;

            default:
                System.out.println("Not a valid number!");
                showMenu(dataAccess);
                break;
        }
    }
}
