import java.sql.* ;
import java.util.Calendar;
import java.util.Locale;
import java.util.Scanner;


class VaccineApp
{
    public static void main ( String [ ] args ) throws SQLException
    {
        ///###############Unique table names.####################
        //Either the user supplies a unique identifier as a command line argument,
        //or the program makes one up.
        String tableName = "";
        int sqlCode=0;      // Variable to hold SQLCODE
        String sqlState="00000";  // Variable to hold SQLSTATE
        if ( args.length > 0 )
            tableName += args [ 0 ] ;
        else
            tableName += "exampletbl";

        //####################Register the driver.#########################
        // You must register the driver before you can use it.
        try { DriverManager.registerDriver ( new com.ibm.db2.jcc.DB2Driver() ) ; }
        catch (Exception cnfe){ System.out.println("Class not found"); }

        //####################DB Connection.##############################
        // This is the url you must use for DB2.
        //Note: This url may not valid now !
        //String url = "jdbc:db2://winter2021-comp421.cs.mcgill.ca:50000/cs421";
        String url = "jdbc:db2://localhost:6666/cs421";
        //REMEMBER to remove your user id and password before submitting your code!!
        String your_userid = "ykim112";
        String your_password = "cNC8ay2Y";
        //AS AN ALTERNATIVE, you can just set your password in the shell environment in the Unix (as shown below) and read it from there.
        //$  export SOCSPASSWD=yoursocspasswd
        if(your_userid == null && (your_userid = System.getenv("SOCSUSER")) == null)
        {
            System.err.println("Error!! do not have a password to connect to the database!");
            System.exit(1);
        }
        if(your_password == null && (your_password = System.getenv("SOCSPASSWD")) == null)
        {
            System.err.println("Error!! do not have a password to connect to the database!");
            System.exit(1);
        }
        Connection con = DriverManager.getConnection (url,your_userid,your_password) ;
        Statement statement = con.createStatement ( ) ;


        //####################main loop#########################
        Scanner sc = new Scanner(System.in);
        Boolean exitFlag = false;
        String input ="";
        while(!exitFlag) {
            System.out.println();
            System.out.println("VaccineApp Main Menu");
            System.out.println("1. Add a Person");
            System.out.println("2. Assign a slot to a Person");
            System.out.println("3. Enter Vaccination information");
            System.out.println("4. Exit Application");
            System.out.println();
            System.out.println("Please Enter your option");

            input = sc.next();
            switch(input) {
                case "1":
                    addPerson(con);
                    break;
                case "2":
                    assignSlot(con);
                    break;

                case "3":
                    enterVaccInfo(con);
                    break;

                case "4":
                    exitApp(con);
                    break;

                default:
                    System.out.print("please enter 1, 2, 3, or 4");
                    break;
            }
        }
        // Finally but importantly close the statement and connection
        statement.close ( ) ;
        con.close ( ) ;
    }


    //################ Add a Person #############################################################
    //a new person is registering with the system.
    //allow the user to enter the relevant information
    //if the user's Health insurance number is already associated with someone
    //the application should stop adding the new person
    //respond with an appropriate message to the user
    //prompt the user whether they wish to update the existing Person information associated with
    //the number with the newly entered detail.
    //if the user chooses to do so, the existing information is updated.
    //otherwise no action taken
    //##########################################################################################
    private static void addPerson(Connection con)  {
        int sqlCode=0;      // Variable to hold SQLCODE
        String sqlState="00000";  // Variable to hold SQLSTATE
        try {
            Statement statement = con.createStatement();
            Scanner sc = new Scanner(System.in);
            System.out.println("please Enter health insurance number");
            String healthINSNR = sc.nextLine();
            String querySQL = "SELECT HEALTH_INSURANCE_NUMBER, PNAME FROM PERSON WHERE HEALTH_INSURANCE_NUMBER = " + healthINSNR;
            ResultSet rs = statement.executeQuery(querySQL);

            if(rs.next()) {
                String name = rs.getString("PNAME");
                String HIN = rs.getString("health_insurance_number");

                System.out.println("Hello " + name);
                System.out.println("Do you wish to update the information?");
                String answer = sc.nextLine().toLowerCase();

                if(answer.equals("yes")) {
                    Boolean exitFlag = false;
                    //design choice:
                    //it makes sense
                    //to change name - new name
                    //to change gender - come out
                    //to change job
                    //to change phone number
                    //to change address
                    //the rest(health insurance num, date of birth, register date, category name...)
                    //needs to be verified before trusting the user.
                    while(!exitFlag) {
                        Boolean flag = false;
                        System.out.println("what would you like to update?");
                        System.out.println("your choices are: ");
                        System.out.println("Enter A for name");
                        System.out.println("Enter B for gender");
                        System.out.println("Enter C for profession");
                        System.out.println("Enter D for phone number");
                        System.out.println("Enter E for address");
                        System.out.println("Enter F for exit");
                        System.out.println("For other inquiries please contact our main office");

                        String updateChoice = sc.nextLine().toUpperCase();
                        int healthInsuranceNumber = Integer. parseInt(HIN);

                        switch(updateChoice) {

                            case "A":
                                System.out.println("please enter your new name");
                                String changedName = sc.nextLine();


                                String update = "UPDATE PERSON SET PNAME=?  WHERE health_insurance_number=? ";
                                PreparedStatement stmt = con.prepareStatement(update);

                                stmt.setString(1, changedName);
                                stmt.setInt(2, healthInsuranceNumber);

                                stmt.executeUpdate();
                                break;
                            case "B":
                                System.out.println("please enter your gender");
                                String yourGender = sc.nextLine();

                                String updateGender = "UPDATE PERSON SET PGENDER=?  WHERE health_insurance_number=? ";
                                PreparedStatement stmtGender = con.prepareStatement(updateGender);

                                stmtGender.setString(1, yourGender);
                                stmtGender.setInt(2, healthInsuranceNumber);

                                stmtGender.executeUpdate();
                                break;
                            case "C":
                                System.out.println("please enter your profession");
                                String yourProfession = sc.nextLine();

                                String updateProfession = "UPDATE PERSON SET profession=?  WHERE health_insurance_number=? ";
                                PreparedStatement stmtProfession = con.prepareStatement(updateProfession);

                                stmtProfession.setString(1, yourProfession);
                                stmtProfession.setInt(2, healthInsuranceNumber);

                                stmtProfession.executeUpdate();
                                break;
                            case "D":
                                System.out.println("please enter your phone number");
                                String yourPhoneNumberInString = sc.nextLine();
                                int yourPhoneNumber = Integer.parseInt(yourPhoneNumberInString);
                                String updatePhoneNumber = "UPDATE PERSON SET phone_number=?  WHERE health_insurance_number=? ";
                                PreparedStatement stmtPhoneNumber = con.prepareStatement(updatePhoneNumber);

                                stmtPhoneNumber.setInt(1, yourPhoneNumber);
                                stmtPhoneNumber.setInt(2, healthInsuranceNumber);

                                stmtPhoneNumber.executeUpdate();
                                break;
                            case "E":
                                System.out.println("please enter your new address");
                                String yourAddress = sc.nextLine();

                                String updateAddress = "UPDATE PERSON SET address=?  WHERE health_insurance_number=? ";
                                PreparedStatement stmtAddress = con.prepareStatement(updateAddress);

                                stmtAddress.setString(1, yourAddress);
                                stmtAddress.setInt(2, healthInsuranceNumber);

                                stmtAddress.executeUpdate();
                                break;
                            case "F":
                                System.out.println("Exiting now");
                                flag = true;
                                break;
                        }
                        if(flag) {
                            break;
                        }
                    }


                }
                else if(answer.equals("no")){
                    System.out.println("No action has been taken");
                }

            }
            else {
                System.out.println("Hello Welcome to our system.");
                System.out.println("We are so happy we are collecting your data!");

                System.out.println("Enter your name");
                String yourName = sc.nextLine();
                String yourNameForDB = "'" + yourName + "'";

                System.out.println("Enter your gender");
                String yourSex = sc.nextLine();
                String yourSexForDB = "'" + yourSex + "'";



                System.out.println("Enter your date of birth");
                String yourDate = sc.nextLine();
                Date date=Date.valueOf(yourDate);//converting string into sql date
                String dateForDB = "'" + date + "'";


                System.out.println("Enter your address");
                String yourAddress = sc.nextLine();
                String yourAddressForDB = "'" + yourAddress + "'";


                System.out.println("Enter your phone number");
                String yourPhoneNumber = sc.nextLine();
                int yourPN = Integer.parseInt(yourPhoneNumber);

                java.util.Date todayDate = new java.util.Date();
                java.sql.Date registerDate = new java.sql.Date(todayDate.getTime());

                String rdateForDB = "'" + registerDate + "'";


                System.out.println("Enter your prorfession");
                String yourProfession = sc.nextLine();
                String yourProfessionForDB = "'" + yourProfession + "'";


                System.out.println("Enter your physical proximity priority");
                String physical = sc.nextLine();
                String physicalForDB = "'" + physical + "'";


                System.out.println("are you immunologically compromised?");
                String immun = sc.nextLine();
                String immunForDB = "'" + immun + "'";

                System.out.println("How would you identify yourself?");
                System.out.println("================================");
                System.out.println("Health Care Worker");
                System.out.println("Elder");
                System.out.println("Teacher");
                System.out.println("Essential Service Worker");
                String cname = sc.nextLine();
                String cnameForDB = "'" + cname + "'";

                String insert = "INSERT INTO PERSON VALUES (" + healthINSNR +","+ yourNameForDB +","+yourSexForDB+","+dateForDB+","+yourAddressForDB+","+yourPN+","+rdateForDB+","+yourProfessionForDB+","+physicalForDB+","+immunForDB+","+cnameForDB+")";
                statement.executeUpdate ( insert ) ;


            }

        }
        catch(SQLException e) {
            sqlCode = e.getErrorCode(); // Get SQLCODE
            sqlState = e.getSQLState(); // Get SQLSTATE

            // Your code to handle errors comes here;
            // something more meaningful than a print would be good
            System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
            System.out.println(e);
        }


    }


    //################ Assign a slot to a PERSON #############################################################
    //PERSON has to be assigned to a slot
    //prompt the user for any necessary input
    //and update the slot allocation information in the database
    //the application should not allow the user to assign a slot to this Person
    //if the said Person has already taken the required number of shots for that particular brand of vaccine.
    //assume that a person is never vaccinated by two different brands
    //do not assign a slot if that is already given to someone else
    //or is in the past(a slot from a day that is before current date
    //##########################################################################################

    public static void assignSlot(Connection con) {
        int sqlCode=0;      // Variable to hold SQLCODE
        String sqlState="00000";  // Variable to hold SQLSTATE
        try {
            Statement statement = con.createStatement();
            Scanner sc = new Scanner(System.in);
            System.out.println("please Enter health insurance number");
            String healthINSNR = sc.nextLine();

            String querySQL = "SELECT COUNT(*) AS IF_VACC FROM PERSON, PERSON_SLOT_ASSIGNMENT WHERE(PERSON.HEALTH_INSURANCE_NUMBER = PERSON_SLOT_ASSIGNMENT.HEALTH_INSURANCE_NUMBER AND PERSON.HEALTH_INSURANCE_NUMBER=" + healthINSNR + ")GROUP BY PERSON.HEALTH_INSURANCE_NUMBER";
            ResultSet rsHIN = statement.executeQuery(querySQL);
            int count = 0;
            if(rsHIN.next()) {
                count = rsHIN.getInt(1);

            };
            if(count >= 2) {
                System.out.println("You have already received the recommended dose(s)!");
            }
            else {
                java.util.Date todayDate = new java.util.Date();
                java.sql.Date registerDate = new java.sql.Date(todayDate.getTime());


                String querySQL2 = "SELECT SLOT.SLOT_ID, SLOT.ADATE, SLOT.SLOT_TIME, SLOT.LOCATION_NAME from SLOT WHERE IF_ASSIGNED = 0";
                ResultSet rs22 = statement.executeQuery(querySQL2);
                while(rs22.next())
                {
                    Date date = rs22.getDate("ADATE");
                    String dateForDB = "'" + date + "'";
                    java.util.Date todayDate2 = new java.util.Date();
                    java.sql.Date assignDate = new java.sql.Date(todayDate2.getTime());

                    String assignDateForDB = "'" + assignDate + "'";

                    if(date.compareTo(todayDate) >= 0) {
                        int id = rs22.getInt("slot_id");
                        String time = rs22.getString("slot_time");
                        String timeForDB = "'" + time + "'";

                        String location = rs22.getString("location_name");
                        String locationForDB = "'" + location + "'";

                        System.out.println("The following slot is available");
                        System.out.println("id: " + id);
                        System.out.println("location: " + location);
                        System.out.println("date: " + date);
                        System.out.println("time: " + time);
                        System.out.println();

                        System.out.println("Would you like to pick this slot?");
                        String answer = sc.nextLine().toLowerCase();
                        boolean flag = false;

                        if(answer.equals("yes")) {
                            //insert the value here
                            flag = true;
                            int if_assigned = 1;
                            int healthInsuranceNumber = Integer. parseInt(healthINSNR);

                            String insert = "INSERT INTO PERSON_SLOT_ASSIGNMENT VALUES(" + if_assigned +","+ healthINSNR +","+assignDateForDB+","+id+","+timeForDB+","+dateForDB+","+locationForDB+")";
                            statement.executeUpdate (insert) ;

                            String updateSQL = "UPDATE SLOT SET IF_ASSIGNED="+if_assigned+" WHERE" + "(SLOT_ID="+id+" AND SLOT_TIME="+timeForDB+" AND ADATE="+dateForDB+" AND LOCATION_NAME="+locationForDB+")";
                            statement.executeUpdate(updateSQL);

                            System.out.println("the slot has been assigned to you!");
                            break;
                        }
                        else if(answer.equals("no")) {
                            System.out.println("searching for the new slot");
                        }
                        if(flag) {
                            break;
                        }
                    }
                }


            }

        }
        catch(SQLException e) {
            sqlCode = e.getErrorCode(); // Get SQLCODE
            sqlState = e.getSQLState(); // Get SQLSTATE

            // Your code to handle errors comes here;
            // something more meaningful than a print would be good
            System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
            System.out.println(e);
        }

    }



    //################ Enter Vaccination information ##################################
    //record the system that a certain person was vaccinated
    //record appropriate information for this
    //-the nurse, vial info, slot - complete details
    //stop the entry from being made if the vial is from a vaccine brand
    //that's different from previously applied vaccine brand for that person

    //##################################################################################

    public static void enterVaccInfo(Connection con) {
        int sqlCode3=0;      // Variable to hold SQLCODE
        String sqlState3="00000";  // Variable to hold SQLSTATE
        try {
            Statement statement = con.createStatement();
            Scanner sc = new Scanner(System.in);
            System.out.println("please Enter health insurance number");
            String healthINSNR = sc.nextLine();
            String querySQL = "SELECT NURSE.NNAME, SLOT_ADMINISTER_BY_NURSE.canadian_nurse_license_number, VIAL.VACCINE_NAME, VIAL.VIAL_NR, VIAL.SLOT_ID, VIAL.SLOT_TIME, VIAL.ADATE, VIAL.LOCATION_NAME " +
                    "FROM VIAL, PERSON_SLOT_ASSIGNMENT, SLOT_ADMINISTER_BY_NURSE, NURSE " +
                    "WHERE SLOT_ADMINISTER_BY_NURSE.canadian_nurse_license_number = NURSE.candian_nurse_license_number " +
                    "AND PERSON_SLOT_ASSIGNMENT.SLOT_ID = SLOT_ADMINISTER_BY_NURSE.SLOT_ID AND " +
                    "VIAL.SLOT_ID = PERSON_SLOT_ASSIGNMENT.SLOT_ID AND VIAL.SLOT_TIME = PERSON_SLOT_ASSIGNMENT.SLOT_TIME AND VIAL.ADATE = PERSON_SLOT_ASSIGNMENT.ADATE AND VIAL.LOCATION_NAME = PERSON_SLOT_ASSIGNMENT.LOCATION_NAME AND PERSON_SLOT_ASSIGNMENT.HEALTH_INSURANCE_NUMBER= " + healthINSNR;
            ResultSet rs3 = statement.executeQuery(querySQL);
            String edgeCase = "Pfizer-BioNTec";

            int count = 0;

            boolean newUser = true;
            boolean needSecondDose = false;
            while(rs3.next()) {

                String name = rs3.getString("VACCINE_NAME");

                if(name.equals(edgeCase)) {
                    count +=1;
                    if(count >= 2) {
                        System.out.println("you received two already");
                        newUser =false;
                        needSecondDose = false;
                    }
                    else{
                        System.out.println("still one more");
                        needSecondDose = true;
                    }
                }
                else{
                    //for this version one is good enough
                    System.out.println("you already received one");
                    newUser =false;
                }
            }
            if(newUser) {
                System.out.println("Hello! please answer the following questions with a nurse");
                System.out.println("Hello Nurse! Thank you for your service! what's your license number?");

                String nuseNumber = sc.nextLine();
                int nurseLicNumberForDB = Integer.parseInt(nuseNumber);
//                int nurse_number = 1064;

                System.out.println("What's the user's appointment number?");
                String appointmentNumber = sc.nextLine();
                int appointmentNumberForDB = Integer.parseInt(appointmentNumber);

                System.out.println("Which vaccine would the user like to receive?");
                String vaccineBrand = sc.nextLine();
                String dbFoVaccBrand = "'" + vaccineBrand + "'";

                if(needSecondDose) {
                    while(vaccineBrand != edgeCase) {
                        System.out.println("You've recieved a Pfizer-BioNTec vaccine");
                        System.out.println("Your second vaccine needs to be a Pfizer-BioNTec vaccine");

                        System.out.println("We need to make sure the first dose you've received is Pfizer-BioNTec vaccine");
                        System.out.println("Please type in Pfizer-BioNTec vaccine");
                        vaccineBrand = sc.nextLine();
                    }
                }

                System.out.println("What's the vial number of the vaccine the user will receive?");
                String vialNumber = sc.nextLine();
                int vialNumberForDB = Integer.parseInt(vialNumber);

                System.out.println("What's the batch number of the vial was in with?");
                String batchNumber = sc.nextLine();
                int batch_nr = Integer.parseInt(batchNumber);

                System.out.println("What's the slot id of the slot the user assigned with?");
                String slotNumber = sc.nextLine();
                int slotNumberForDB = Integer.parseInt(slotNumber);


                System.out.println("What's the time the user will be vaccinated?");
                String vaccTime = sc.nextLine();
                String dbForSlotTime = "'"+vaccTime+"'";

                System.out.println("What's the date the user will be vaccinated?");
                String adate = sc.nextLine();
                String dbForadate = "'"+adate+"'";

                System.out.println("What's the location the user will be vaccinated?");
                String location = sc.nextLine();
                String dbForLocation = "'"+location+"'";




                String insertNurse = "INSERT INTO SLOT_ADMINISTER_BY_NURSE VALUES(" +slotNumberForDB+","+dbForSlotTime+","+dbForadate+","+dbForLocation+","+nurseLicNumberForDB+")";
                statement.executeUpdate (insertNurse) ;

                String insert = "INSERT INTO VIAL VALUES(" + appointmentNumberForDB +","+ vialNumberForDB +","+slotNumberForDB+","+dbForSlotTime+","+dbForadate+","+dbForLocation+","+ batch_nr+","+dbFoVaccBrand+")";
                statement.executeUpdate ( insert ) ;

                System.out.println("Thank you. The data was entered into our database.");

            }



        }
        catch(SQLException e) {
            sqlCode3 = e.getErrorCode(); // Get SQLCODE
            sqlState3 = e.getSQLState(); // Get SQLSTATE

            // Your code to handle errors comes here;
            // something more meaningful than a print would be good
            System.out.println("Code: " + sqlCode3 + "  sqlState: " + sqlState3);
            System.out.println(e);
        }

    }
    public static void exitApp(Connection con) {

    }

}
