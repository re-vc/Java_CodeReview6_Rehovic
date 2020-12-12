import java.sql.*;
import java.util.*;

public class DataAccess {

    private Connection connection;
    private final String url = "jdbc:mysql://localhost:3306/cr7_peter";

    public DataAccess() throws SQLException, ClassNotFoundException {
        java.lang.Class.forName("com.mysql.cj.jdbc.Driver");
        System.out.println("Connecting to database...");
        Credentials credentials = new Credentials();
        connection = DriverManager.getConnection(url, credentials.getUser(), credentials.getPassword());
    }

    public ArrayList<Student> getAllStudents() {
        String sql = "SELECT * FROM students";
        ArrayList <Student> studentList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String surname = rs.getString("surname");
                String email = rs.getString("email");
                studentList.add(new Student(id, name, surname, email));
            }
            rs.close();
            preparedStatement.close();
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return studentList;
    }

    public ArrayList<Teacher> getAllTeachers(){
        String sql = "SELECT * FROM teachers";
        ArrayList <Teacher> teacherList = new ArrayList<>();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String surname = rs.getString("surname");
                String email = rs.getString("email");
                teacherList.add(new Teacher(id, name, surname, email));
            }
            rs.close();
            preparedStatement.close();
        } catch (Exception e){
            e.printStackTrace();
        }
        return teacherList;
    }

    public ArrayList<Class> getAllClasses(){
        String sql = "SELECT * FROM classes";
        ArrayList <Class> classList = new ArrayList<>();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                classList.add(new Class(id, name));
            }
            rs.close();
            preparedStatement.close();
        } catch (Exception e){
            e.printStackTrace();
        }
        return classList;
    }

    public HashMap<ArrayList<Class>, Teacher> getClassesOfTeacher(int teacherId){

        String sql_classes = "SELECT classes.id, classes.name FROM teachersclassesrelation " +
                "JOIN classes ON classes.id = teachersclassesrelation.fk_class_id " +
                "WHERE teachersclassesrelation.fk_teacher_id = ?";
        String sql_name = "SELECT * FROM teachers WHERE teachers.id= ?";
        ArrayList <Class> classList = new ArrayList<>();
        HashMap <ArrayList<Class>, Teacher> classTeacher = new HashMap<>();

        try {
            PreparedStatement pst1 = connection.prepareStatement(sql_classes);
            pst1.setInt(1, teacherId);
            ResultSet rs1 = pst1.executeQuery();

            while (rs1.next()) {
                int classId = rs1.getInt("id");
                String className = rs1.getString("name");
                classList.add(new Class(classId, className));
            }

            PreparedStatement pst2 = connection.prepareStatement(sql_name);
            pst2.setInt(1, teacherId);
            ResultSet rs2 = pst2.executeQuery();
            rs2.next();
            String name = rs2.getString("name");
            String surname = rs2.getString("surname");
            String email = rs2.getString("email");
            Teacher teacher = new Teacher(teacherId, name, surname, email);
            classTeacher.put(classList, teacher);

            rs1.close();
            rs2.close();
            pst1.close();
            pst2.close();
        } catch (Exception e){
            e.printStackTrace();
        }
        return classTeacher;
    }

    public void displayAllStudents(){
        ArrayList <Student> studentList = getAllStudents();
        System.out.println("All Students:");
        for (Student student : studentList) {
            System.out.println(student.getSurname() + ", " + student.getName() + ", " + student.getEmail());
            System.out.println("STUDENT ID: " + student.getId() + "\n");
        }
    }

    public void displayAllTeachers(){
        ArrayList <Teacher> teacherList = getAllTeachers();
        System.out.println("All Teachers:");
        for (Teacher teacher: teacherList){
            System.out.println(teacher.getSurname() + ", " + teacher.getName() + ", " + teacher.getEmail());
            System.out.println("TEACHER ID: " + teacher.getId() + "\n");
        }
    }
    public void displayAllClasses(){
        ArrayList <Class> classList = getAllClasses();
        System.out.println("All Classes:");
        for (Class classA : classList){
            System.out.println(classA.getName());
            System.out.println("CLASS ID: " + classA.getId() + "\n");
        }
    }

    public void displayAllTeachersWithId(){
        ArrayList <Teacher> teacherList = getAllTeachers();
        for (Teacher teacher : teacherList){
            System.out.println("ID " + teacher.getId() + ": " + teacher.getFullName());
        }
    }

    public void displayClassesOfTeacher(int teacherId){
        HashMap<ArrayList<Class>, Teacher> classTeacher = getClassesOfTeacher(teacherId);
        for (Teacher teacher: classTeacher.values()){
            System.out.println(teacher.getFullName() + " teaches: ");
        }

        for (ArrayList <Class> classes: classTeacher.keySet()){
            for (Class classA: classes){
                System.out.println(classA);
            }
        }
        System.out.println();
    }

    public void closeDB() throws SQLException {
        System.out.println("Closing connection...");
        connection.close();
    }
}
