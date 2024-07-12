import mysql.connector
from getpass import getpass

def create_database_connection():
    try:
        cnx = mysql.connector.connect(
            host='localhost',        # e.g., 'localhost' or an IP address
            user='root',    # the username for the database
            password='Newtonshiny@123',# the password for the database
            database='outpatientclinic' # the name of the database
        )
        if cnx.is_connected():
            return cnx
    except Error as e:
        print("Error while connecting to MySQL", e)
        return None

def demonstrate_views(cnx):
    while True:
        print("\nChoose an option to view information:")
        print("1. View Complete Patient Information")
        print("2. View Billing and Insurance Claims")
        print("3. View Medication Inventory")
        print("4. Return to Main Menu")

        choice = input("Enter your choice: ")
        if choice == '1':
            query_view(cnx, 'CompletePatientInformation')
        elif choice == '2':
            query_view(cnx, 'BillingInsuranceClaims')
        elif choice == '3':
            query_view(cnx, 'MedicationInventory')
        elif choice == '4':
            break
        else:
            print("Invalid choice. Please try again.")


def query_view(cnx, view_name):
    cursor = cnx.cursor()
    try:
        if view_name == 'CompletePatientInformation':
            first_name = input("Enter the patient's first name: ")
            last_name = input("Enter the patient's last name: ")
            query = ("SELECT * FROM CompletePatientInformation "
                     "WHERE FirstName = %s AND LastName = %s")
            cursor.execute(query, (first_name, last_name))

        elif view_name == 'BillingInsuranceClaims':
            payment_status = input("Enter payment status (Partial/Paid/Pending): ").lower()
            query = ("SELECT * FROM BillingInsuranceClaims "
                     "WHERE PaymentStatus = %s")
            cursor.execute(query, (payment_status,))

        elif view_name == 'MedicationInventory':
            medicine_name = input("Enter the medicine name: ")
            query = ("SELECT * FROM MedicationInventory "
                     "WHERE Name = %s")
            cursor.execute(query, (medicine_name,))
        
        rows = cursor.fetchall()
        if rows:
            for row in rows:
                print(row)
        else:
            print("No records found.")
    except mysql.connector.Error as err:
        print(f"An error occurred: {err}")
    finally:
        cursor.close()

def demonstrate_log_entries(cnx):
    print("\nViewing Log Entries")
    cursor = cnx.cursor()
    try:
        query = "SELECT * FROM log"
        cursor.execute(query)
        rows = cursor.fetchall()
        if rows:
            for row in rows:
                print(row)
        else:
            print("No log entries found.")
    except mysql.connector.Error as err:
        print(f"An error occurred: {err}")
    finally:
        cursor.close()


def check_login_receptionist(cnx, username, password, role_name):
    cursor = cnx.cursor()
    cursor.callproc('CheckReceptionistLogin', [username, password])
    # Since the stored procedure returns a result set, we fetch it like this:
    for result in cursor.stored_results():  # This loop will run once.
        login_result = result.fetchall()  # Fetch all results.
        if login_result:  # Non-empty results indicate a successful login.
            return True
        else:  # Empty results indicate no match was found.
            return False


def check_login_provider(cnx, username, password, role_name):
    cursor = cnx.cursor()
    cursor.callproc('CheckProviderLogin', [username, password])
    # Since the stored procedure returns a result set, we fetch it like this:
    for result in cursor.stored_results():  # This loop will run once.
        login_result = result.fetchall()  # Fetch all results.
        if login_result:  # Non-empty results indicate a successful login.
            return True
        else:  # Empty results indicate no match was found.
            return False


def perform_operation(cnx, operation, *args):
    cursor = cnx.cursor()
    try:
        cursor.callproc(operation, args)
        cnx.commit()  # Make sure to commit the transaction for insert, update, delete
        for result in cursor.stored_results():
            print(result.fetchall())  # Fetch and print the result set for view operations
    except mysql.connector.Error as err:
        print(f"An error occurred: {err}")
    finally:
        cursor.close()


def provider_operations(cnx):
    while True:
        print("\nSelect an operation:")
        print("1 - Create a new Medical record")
        print("2 - Update an existing Medical record")
        print("3 - View a Medical record")
        print("4 - Delete an existing Medical record")
        print("5 - Go back to login page")
        print("6 - Return to Main Menu")

        choice = input("Enter your choice: ")

        if choice == '1':
            # Create a new medical record
            patient_id = input("Patient ID: ")
            provider_id = input("Provider ID: ")
            date_of_visit = input("Date of Visit (YYYY-MM-DD): ")
            signs_symptoms = input("Signs and Symptoms: ")
            diagnosis = input("Discharge Diagnosis: ")
            prescription = input("Prescription: ")
            perform_operation(cnx, 'CreateMedicalRecord', patient_id, provider_id, date_of_visit, signs_symptoms, diagnosis, prescription)
            print("Created Successfully")
        
        elif choice == '2':
            # Update an existing medical record
            patient_id = input("Patient ID: ")
            date_of_visit = input("Date of Visit (YYYY-MM-DD): ")
            signs_symptoms = input("Updated Signs and Symptoms: ")
            diagnosis = input("Updated Discharge Diagnosis: ")
            prescription = input("Updated Prescription: ")
            perform_operation(cnx, 'UpdateExistingMedicalRecord', patient_id, date_of_visit, signs_symptoms, diagnosis, prescription)
            print("Updated Successfully")
        
        elif choice == '3':
            # View a medical record
            patient_id = input("Patient ID: ")
            date_of_visit = input("Date of Visit (YYYY-MM-DD): ")
            perform_operation(cnx, 'ViewMedicalRecord', patient_id, date_of_visit)
        
        elif choice == '4':
            # Delete an existing medical record
            patient_id = input("Patient ID: ")
            date_of_visit = input("Date of Visit (YYYY-MM-DD): ")
            perform_operation(cnx, 'DeleteMedicalRecord', patient_id, date_of_visit)
            print("Deleted Successfully")
        
        elif choice == '5':
            return "login"
        
        elif choice == '6':
            return "exit"
        
        else:
            print("Invalid choice. Please try again.")

def receptionist_operations(cnx):
    while True:
        print("\nSelect an operation:")
        print("1 - Create a new appointment")
        print("2 - Update an existing appointment")
        print("3 - View an appointment")
        print("4 - Delete an existing appointment")
        print("5 - Go back to login page")
        print("6 - Return to Main Menu")

        choice = input("Enter your choice: ")

        if choice == '1':
            # Create a new appointment
            patient_id = input("Patient ID: ")
            provider_id = input("Provider ID: ")
            facility_id = input("Facility ID: ")
            date_of_visit = input("Date of Visit (YYYY-MM-DD): ")
            time_of_visit = input("Time of Visit (HH:MM): ")
            reason_for_visit = input("Reason for Visit: ")
            perform_operation(cnx, 'CreateAppointment', patient_id, provider_id, facility_id, date_of_visit, time_of_visit, reason_for_visit)
            print("Appointment created successfully.")
        
        elif choice == '2':
            # Update an existing appointment
            patient_id = input("Patient ID: ")
            provider_id = input("New Provider ID: ")
            facility_id = input("New Facility ID: ")
            date_of_visit = input("Date of Visit (YYYY-MM-DD): ")
            time_of_visit = input("New Time of Visit (HH:MM): ")
            reason_for_visit = input("New Reason for Visit: ")
            perform_operation(cnx, 'UpdateAppointment', patient_id, provider_id, facility_id, date_of_visit, time_of_visit, reason_for_visit)
            print("Appointment updated successfully.")
        
        elif choice == '3':
            # View an appointment
            patient_id = input("Patient ID: ")
            date_of_visit = input("Date of Visit (YYYY-MM-DD): ")
            perform_operation(cnx, 'ViewAppointment', patient_id, date_of_visit)
        
        elif choice == '4':
            # Delete an existing appointment
            patient_id = input("Patient ID: ")
            date_of_visit = input("Date of Visit (YYYY-MM-DD): ")
            perform_operation(cnx, 'DeleteAppointment', patient_id, date_of_visit)
            print("Appointment deleted successfully.")
        
        elif choice == '5':
            return "login"
        
        elif choice == '6':
            return "exit"
        
        else:
            print("Invalid choice. Please try again.")

def login(cnx):
    while True:  # Keep prompting for login until valid input or exit is chosen
        role = input("Enter your role (Provider/Receptionist): ").lower()
        if role not in ['provider', 'receptionist']:
            print("Invalid role. Please try again.")
            continue  # Continue the loop if the role is invalid
        username = input("Username: ")
        password = getpass("Password: ")  # Securely get the password without echoing

        if role == 'provider' and check_login_provider(cnx, username, password, role):
            print("Provider login successful.")
            return 'provider'  # Successfully logged in as provider
        elif role == 'receptionist' and check_login_receptionist(cnx, username, password, role):
            print("Receptionist login successful.")
            return 'receptionist'  # Successfully logged in as receptionist
        else:
            print("Login failed.")
            if input("Do you want to exit? (yes/no): ").lower() == 'yes':
                return "exit"  # Exit the login prompt

def main():
    cnx = create_database_connection()  # Initialize the database connection
    if cnx is None:
        print("Could not establish database connection.")
        return  # Exit the application if no connection could be established

    try:
        while True:
            print("\nMain Menu:")
            print("1. Demonstration of Stored Procedures with Role-Based Access & User Auth")
            print("2. Demonstration of Views")
            print("3. Demonstration of Log Entries")
            print("4. Exit the application")
            
            main_choice = input("Enter your choice: ")

            if main_choice == '1':
                result = login(cnx)  # Attempt to log in for stored procedures demonstration
                if result == 'exit':
                    continue
                elif result == 'provider':
                    op_result = provider_operations(cnx)  # Perform provider operations
                    if op_result == "exit":  # Check if provider_operations returned 'exit'
                        continue  # Go back to the main menu
                elif result == 'receptionist':
                    op_result = receptionist_operations(cnx)  # Perform receptionist operations
                    if op_result == "exit":  # Check if receptionist_operations returned 'exit'
                        continue  # Go back to the main menu

            elif main_choice == '2':
                demonstrate_views(cnx)

            elif main_choice == '3':
                demonstrate_log_entries(cnx)

            elif main_choice == '4':
                print("Exiting the application.")
                break  # Exit the main loop
            
            else:
                print("Invalid choice. Please try again.")

    finally:
        if cnx is not None and cnx.is_connected():
            cnx.close()  # Close the database connection when done


if __name__ == "__main__":
    main()



