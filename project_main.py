import PySimpleGUI as sg
import mysql.connector
import re
### Global variables ###
isRunning = True
startup = True
sg.theme("Reddit")
level_access = None


#########################################################################
#########   Creates login window to acquire user credentials   ##########
#########################################################################

#Creates login window, which accepts a username and password
#Offers user option to login or exit
#If exit selected, program ends
#If login selected, Compares username to one stored in database, and returns appropriate password
    #compares password to one entered, if correct, allows access to main window
def startupSequence(startup):
    global level_access
    while(startup):
        #layout for login page
        loginLayout = [
            [sg.Text("Enter user credentials", font=('Helvetica', 18))],
            [sg.Text("Username", size=(15, 1), font=('Helvetica', 12)), sg.Input(size=(30, 1), key='-USERNAME-')],
            [sg.Text("Password", size=(15, 1), font=('Helvetica', 12)), sg.Input(size=(30, 1), key='-PASSWORD-', password_char="*")],
            [sg.Button('Login', size=(10, 2)), sg.Button('Exit', size=(10, 2))]
        ]
        loginWindow = sg.Window("Login", loginLayout)
        event, values = loginWindow.read()
        loginWindow.close()
        if event in (sg.WINDOW_CLOSED, 'Exit'):
            break
        elif event == "Login":
            #grab and store values in input boxes
            username, password = values['-USERNAME-'], values['-PASSWORD-']
            #if both inputs boxes are not empty
            if username and password:
                try:
                    adConn = mysql.connector.connect(host='localhost', database='active_directory', username='root',password='password')
                    adCursor = adConn.cursor()
                    #SQL query to find associated password from active directory based on username input
                    sql = "SELECT password, Level_access FROM user_directory WHERE username = %s;"

                    U = (str(username),)
                    adCursor.execute(sql, U)
                    adResult = adCursor.fetchone()

                    # Extract password and Level_access values from the query result
                    if adResult:
                        testPassword = "{}".format(adResult[0])
                        level_access = adResult[1]  # Store Level_access value in the global variable
                        adCursor.close()
                        adConn.close()

                    #if password matches stored password, continue on to home page
                    if password == testPassword:
                        #sg.Popup("Login successful")
                        runProgram = True
                        loginWindow.close()
                        return runProgram
                        break
                    else:
                        sg.Popup("Invalid password")
                        continue
                    
                    
                except Exception as e:
                    sg.Popup(e)
            #if either input box is empty
            elif username == "" or password == "":
                sg.Popup("Please enter a username and password")
                continue
    runProgram = False
    return runProgram

###########################################################################
# Following section of functions open various windows for user operations #
###########################################################################

###################################################
# Level 0 Access required for following functions #
###################################################

### START VIEW FUNCTIONS ###

#All the functions that will perform desired processes selected from homepage and routed via figureItOut
def viewCurrentPatients():
    #sg.Popup("It works")
    conn = mysql.connector.connect(host='localhost', database='ptinfo_db', username='root', password='password')
    vwCPLayout = [
        [sg.Text("All current patients", font=('Helvetica', 18))],
        [sg.Multiline(size=(100, 20), key='-VWCPVIEW-', font=('Helvetica', 12))],
        [sg.Button("Exit", size=(10, 2))]
    ]
    cursor = conn.cursor()
    sql = "SELECT Patient_ID, First_name, Last_name, Age, Gender, Phone_number, Email_address, Active_date, Inactive_date, Primary_Physician_ID, Insurance_Provider_ID FROM vw_all_patients;"
    cursor.execute(sql)
    result = cursor.fetchall()
    window = sg.Window("Current Patients", vwCPLayout, finalize=True, resizable=False)
    patientList = []
    #patientList.append("First Name: \tLast Name: \tAge: \tGender: \tPhone Number: \tActive Date: \tInactive Date: \tPrimary Physician ID: \tInsurance Provider ID: \n")
    for (Patient_ID, First_name, Last_name, Age, Gender, Phone_number, Email_address, Active_date, Inactive_date, Primary_Physician_ID, Insurance_Provider_ID) in result:
        x = f"""{Patient_ID}
        First Name: {First_name} | Last Name: {Last_name} 
        Age: {Age} | Gender: {Gender} 
        Phone #: {Phone_number} | Email: {Email_address} 
        Active Date: {Active_date} | Inactive Date: {Inactive_date} 
        Primary Physician ID: {Primary_Physician_ID} 
        Insurance Provider ID: {Insurance_Provider_ID}\n\n"""
        patientList.append(x)
    for i in patientList:
        window['-VWCPVIEW-'].update(i, append=True)
    event, values = window.read()
    cursor.close()
    conn.close()
    if event in (sg.WINDOW_CLOSED, "Exit"):
        window.close()


def viewPhysicians():
    #sg.Popup("It works")
    conn = mysql.connector.connect(host='localhost', database='ptinfo_db', username='root', password='password')
    vwCPLayout = [
        [sg.Text("All current physicians", font=('Helvetica', 18))],
        [sg.Multiline(size=(100, 20), key='-VWCPVIEW-', font=('Helvetica', 12))],
        [sg.Button("Exit", size=(10, 2))]
    ]

    cursor = conn.cursor()
    sql = "SELECT Physician_ID, First_name, Last_name, Physician_phone, Name, Street_address, City, State, Location_phone FROM vw_all_physicians;"
    cursor.execute(sql)
    result = cursor.fetchall()
    window = sg.Window("Current Physicians", vwCPLayout, finalize=True, resizable=False)
    patientList = []
    for (Physician_ID, First_name, Last_name, Physician_phone, Name, Street_address, City, State, Location_phone) in result:
        x = f"""{Physician_ID}
        First Name: {First_name} | Last Name: {Last_name} 
        Physician Phone #: {Physician_phone} |  Location Name: {Name} 
        Address: {Street_address} | City: {City} | State: {State} 
        Location Phone #: {Location_phone}\n\n"""
        patientList.append(x)
    for i in patientList:
        window['-VWCPVIEW-'].update(i, append=True)
    event, values = window.read()
    cursor.close()
    conn.close()
    if event in (sg.WINDOW_CLOSED, "Exit"):
        window.close()

def viewAcceptedInsuranceProviders():
    #sg.Popup("It works")
    conn = mysql.connector.connect(host='localhost', database='ptinfo_db', username='root', password='password')
    vwCPLayout = [
        [sg.Text("Accepted Insurance Providers", font=('Helvetica', 18))],
        [sg.Multiline(size=(100, 20), key='-VWCPVIEW-', font=('Helvetica', 12))],
        [sg.Button("Exit", size=(10, 2))]
    ]
    cursor = conn.cursor()
    sql = "SELECT Insurance_Provider_ID, Name, Street_address, City, State, Phone_number FROM vw_accepted_insurance_providers;"
    cursor.execute(sql)
    result = cursor.fetchall()
    window = sg.Window("Accepted Insurance Providers", vwCPLayout, finalize=True, resizable=False)
    patientList = []
    for (IP_ID, IP_Name, St_Addr, City, State, PH_Num) in result:
        x = f"""{IP_ID}
        Name: {IP_Name} 
        Address: {St_Addr} | City: {City} | State: {State} 
        Phone #: {PH_Num}\n\n"""
        patientList.append(x)
    for i in patientList:
        window['-VWCPVIEW-'].update(i, append=True)
    event, values = window.read()
    cursor.close()
    conn.close()
    if event in (sg.WINDOW_CLOSED, "Exit"):
        window.close()

def viewPatientBalances():
    #sg.Popup("It works")
    conn = mysql.connector.connect(host='localhost', database='ptinfo_db', username='root', password='password')
    vwCPLayout = [
        [sg.Text("Current Balances", font=('Helvetica', 18))],
        [sg.Multiline(size=(100, 20), key='-VWCPVIEW-', font=('Helvetica', 12))],
        [sg.Button("Exit", size=(10, 2))]
    ]
    cursor = conn.cursor()
    sql = "SELECT Patient_ID, Account_ID, First_name, Last_name, Balance, Phone_number FROM vw_all_balances;"
    cursor.execute(sql)
    result = cursor.fetchall()
    window = sg.Window("Current Balances", vwCPLayout, finalize=True, resizable=False)
    patientList = []
    for (Patient_ID, Account_ID, First_name, Last_name, Balance, Phone_number) in result:
        x = f"""{Patient_ID}
        Account ID: {Account_ID} 
        First Name: {First_name} | Last Name: {Last_name} 
        Balance: {Balance} 
        Phone #: {Phone_number}\n\n"""
        patientList.append(x)
    for i in patientList:
        window['-VWCPVIEW-'].update(i, append=True)
    event, values = window.read()
    cursor.close()
    conn.close()
    if event in (sg.WINDOW_CLOSED, "Exit"):
        window.close()

def viewPatientDebts():
    #sg.Popup("It works")
    conn = mysql.connector.connect(host='localhost', database='ptinfo_db', username='root', password='password')
    vwCPLayout = [
        [sg.Text("All Debts", font=('Helvetica', 18))],
        [sg.Multiline(size=(100, 20), key='-VWCPVIEW-', font=('Helvetica', 12))],
        [sg.Button("Exit", size=(10, 2))]
    ]
    cursor = conn.cursor()
    sql = "SELECT Patient_ID, Account_ID, First_name, Last_name, Balance, Phone_number, Email_address FROM vw_patient_debts;"
    cursor.execute(sql)
    result = cursor.fetchall()
    window = sg.Window("Current Debts", vwCPLayout, finalize=True, resizable=False)
    patientList = []
    for (Patient_ID, Account_ID, First_name, Last_name, Balance, Phone_number, Email_address) in result:
        x = f"""{Patient_ID}
        Account ID: {Account_ID} 
        First Name: {First_name} | Last Name: {Last_name} 
        Balance: {Balance} 
        Phone #: {Phone_number} | Email: {Email_address}\n\n"""
        patientList.append(x)
    for i in patientList:
        window['-VWCPVIEW-'].update(i, append=True)
    event, values = window.read()
    cursor.close()
    conn.close()
    if event in (sg.WINDOW_CLOSED, "Exit"):
        window.close()

def viewNYPatients():
    #sg.Popup("It works")
    conn = mysql.connector.connect(host='localhost', database='ptinfo_db', username='root', password='password')
    vwCPLayout = [
        [sg.Text("NY Patients", font=('Helvetica', 18))],
        [sg.Multiline(size=(100, 20), key='-VWCPVIEW-', font=('Helvetica', 12))],
        [sg.Button("Exit", size=(10, 2))]
    ]
    cursor = conn.cursor()
    sql = "SELECT Patient_ID, First_name, Last_name, Street_address, City, State FROM vw_ny_patients;"
    cursor.execute(sql)
    result = cursor.fetchall()
    window = sg.Window("NY Patients", vwCPLayout, finalize=True, resizable=False)
    patientList = []
    for (Patient_ID, First_name, Last_name, Street_address, City, State) in result:
        x = f"""{Patient_ID}
        First Name: {First_name} | Last Name: {Last_name} 
        Address: {Street_address} | City: {City} | State: {State}\n\n"""
        patientList.append(x)
    for i in patientList:
        window['-VWCPVIEW-'].update(i, append=True)
    event, values = window.read()
    cursor.close()
    conn.close()
    if event in (sg.WINDOW_CLOSED, "Exit"):
        window.close()

### END VIEW SECTION ###


###################################################
# Level 1 Access required for following functions #
###################################################

### START PATIENTS SECTION ###

def addPatient():
    #g.Popup("It works")
    conn = mysql.connector.connect(host='localhost', database='ptinfo_db', username='root', password='password')
    cursor = conn.cursor()
    physicianList = []
    insuranceList = []
    sqlPhys = "SELECT physician_id FROM physicians"
    cursor.execute(sqlPhys)
    result = cursor.fetchall()
    for x in result:
        physicianList.append(x)
    sqlIns = "SELECT insurance_provider_id FROM insurance_provider"
    cursor.execute(sqlIns)
    result = cursor.fetchall()
    for y in result:
        insuranceList.append(y)
    
    addPatientLayout = [
    [sg.Text("Patient Information", font=('Helvetica', 20, 'bold'))],
    [sg.Text("Patient ID (1xxxxxxxx)", font=('Helvetica', 14), auto_size_text=True), 
     sg.Input(size=(30, 1), key='-PATIENTID-', font=('Helvetica', 14))],
    [sg.Text("First Name", font=('Helvetica', 14), auto_size_text=True), 
     sg.Input(size=(30, 1), key='-FIRSTNAME-', font=('Helvetica', 14)), 
     sg.Text("Last Name", font=('Helvetica', 14), auto_size_text=True), 
     sg.Input(size=(30, 1), key='-LASTNAME-', font=('Helvetica', 14))],
    [sg.Text("Age", font=('Helvetica', 14), auto_size_text=True), 
     sg.Input(size=(30, 1), key='-AGE-', font=('Helvetica', 14)), 
     sg.Text("Gender", font=('Helvetica', 14), auto_size_text=True), 
     sg.Input(size=(30, 1), key='-GENDER-', font=('Helvetica', 14))],
    [sg.Text("Phone Number (digits only)", font=('Helvetica', 14), auto_size_text=True), 
     sg.Input(size=(30, 1), key='-PHONENUMBER-', font=('Helvetica', 14)), 
     sg.Text("Email Address", font=('Helvetica', 14), auto_size_text=True), 
     sg.Input(size=(30, 1), key='-EMAILADDRESS-', font=('Helvetica', 14))],
    [sg.Text("Active Date (YYYY-MM-DD)", font=('Helvetica', 14), auto_size_text=True), 
     sg.Input(size=(30, 1), key='-ACTIVEDATE-', font=('Helvetica', 14)), 
     sg.Text("Inactive Date (YYYY-MM-DD)", font=('Helvetica', 14), auto_size_text=True), 
     sg.Input(size=(30, 1), key='-INACTIVEDATE-', default_text="9999-12-31", font=('Helvetica', 14))],
    [sg.Text("Primary Physician ID (3xxxxxxxx)", font=('Helvetica', 14), auto_size_text=True), 
     sg.Input(size=(30, 1), key='-PRIPHYID-', font=('Helvetica', 14))],
    [sg.Text("Insurance Provider ID (4xxxxxxxx)", font=('Helvetica', 14), auto_size_text=True), 
     sg.Input(size=(30, 1), key='-INSPROID-', font=('Helvetica', 14))],
    [sg.Text("--------------------------------------", font=('Helvetica', 14))],
    [sg.Text("Account Information", font=('Helvetica', 20, 'bold'))],
    [sg.Text("Account ID (9xxxxxxxx)", font=('Helvetica', 14), auto_size_text=True), 
     sg.Input(size=(30, 1), key='-ACCOUNTID-', font=('Helvetica', 14))],
    [sg.Text("Balance", font=('Helvetica', 14), auto_size_text=True), 
     sg.Input(size=(30, 1), key='-BALANCE-', font=('Helvetica', 14))],
    [sg.Button('Submit', size=(10, 2)), sg.Button('Cancel', size=(10, 2))]
]
    addPatientWindow = sg.Window("Add Patient", addPatientLayout, resizable=True)
    while True:
        event, values = addPatientWindow.read()
        if event in (sg.WINDOW_CLOSED, 'Cancel'):
            addPatientWindow.close()
            break
        elif event == "Submit":
            try:
                for i in values:
                    if values[i] == "":
                        raise Exception("All fields must be filled")
                if values['-INACTIVEDATE-'] == "Optional":
                    sql1 = "INSERT INTO patients (Patient_ID, First_Name, Last_Name, Age, Gender, Phone_Number, Email_address, Active_Date, Primary_Physician_ID, Insurance_Provider_ID) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s);"
                    val1 = (values['-PATIENTID-'], values['-FIRSTNAME-'], values['-LASTNAME-'], values['-AGE-'], values['-GENDER-'], values['-PHONENUMBER-'], values['-EMAILADDRESS-'], values['-ACTIVEDATE-'], values['-PRIPHYID-'], values['-INSPROID-'])
                else:
                    sql1 = "INSERT INTO patients VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s);"
                    val1 = (values['-PATIENTID-'], values['-FIRSTNAME-'], values['-LASTNAME-'], values['-AGE-'], values['-GENDER-'], values['-PHONENUMBER-'], values['-EMAILADDRESS-'], values['-ACTIVEDATE-'], values['-INACTIVEDATE-'], values['-PRIPHYID-'], values['-INSPROID-'])
                cursor.execute(sql1, val1)
                sql2 = "INSERT INTO ACCOUNTS VALUES (%s, %s, %s);"
                val2 = (values['-ACCOUNTID-'], values['-PATIENTID-'], values['-BALANCE-'])
                cursor.execute(sql2, val2)
                conn.commit()
                cursor.close()
                conn.close()
                addPatientWindow.close()
            except Exception as e:
                sg.popup_error(f'Error: {e}')
    addPatientWindow.close()

def updatePatient():
    #sg.Popup("It works")
    conn = mysql.connector.connect(host='localhost', database='ptinfo_db', username='root', password='password')
    cursor = conn.cursor()
    updatePatientLayout = [
    [sg.Text("Enter Original Values to Update:", size=(30,1), font=('Helvetica', 12)), sg.Input(size=(30,1), font=('Helvetica', 12), key='-OLDVALUE-')],
    [sg.Text("Enter New Values:", size=(30,1), font=('Helvetica', 12)), sg.Input(size=(30,1), font=('Helvetica', 12), key='-NEWVALUE-')],
    [sg.Button('Submit', font=('Helvetica', 12)), sg.Button('Cancel', font=('Helvetica', 12))]
]
    updatePatientWindow = sg.Window("Update patient", updatePatientLayout, resizable=True)
    while True:
        event, values = updatePatientWindow.read()
        if event in (sg.WINDOW_CLOSED, 'Cancel'):
            updatePatientWindow.close()
            break
        elif event == "Submit":
            try:           
                for i in values:
                    if values[i] == "":
                        raise Exception("All fields must be filled") 
                update_sql = "UPDATE patients SET " + values['-NEWVALUE-'] + " WHERE " + values['-OLDVALUE-']
                cursor.execute(update_sql)        
                conn.commit()
                cursor.close()
                conn.close()
                updatePatientWindow.close()
            except Exception as e:
                sg.popup_error(f'Error: {e}')
    updatePatientWindow.close()

def removePatient():
    #sg.Popup("It works")
    conn = mysql.connector.connect(host='localhost', database='ptinfo_db', username='root', password='password')
    cursor = conn.cursor()
    removePatientLayout = [
    [sg.Text("Enter Criteria:", size=(15,1), font=('Helvetica', 12)), sg.Input(size=(30,1), font=('Helvetica', 12), key='-DELETECRITERIA-')],
    [sg.Button('Submit', font=('Helvetica', 12)), sg.Button('Cancel', font=('Helvetica', 12))]
]
    removePatientWindow = sg.Window("Remove patient", removePatientLayout, resizable=True)
    while True:
        event, values = removePatientWindow.read()
        if event in (sg.WINDOW_CLOSED, 'Cancel'):
            removePatientWindow.close()
            break
        elif event == "Submit":
            try:
                for i in values:
                    if values[i] == "":
                        raise Exception("All fields must be filled")
                remove_sql = "DELETE FROM patients WHERE " + values['-DELETECRITERIA-']
                cursor.execute(remove_sql)        
                conn.commit()
                cursor.close()
                conn.close()
                removePatientWindow.close()
            except Exception as e:
                sg.popup_error(f'Error: {e}')
    removePatientWindow.close()

### END PATIENTS SECTION ###


###################################################
# Level 2 Access required for following functions #
###################################################

# CUSTOM SQL FUNCTION
# allow users to write their own sql code to run
def customQuery():
    layout = [
        [sg.Text("Query Window")],
        [sg.Multiline(size=(60, 10), key="-QUERY-")],
        [sg.Text("Result Window")],
        [sg.Multiline(size=(60, 10), key="-RESULT-")],
        [sg.Button("Execute"), sg.Button("Exit")]
    ]

    window = sg.Window("Custom Query", layout)
    conn = mysql.connector.connect(host='localhost', database='ptinfo_db', username='root', password='password')
    cursor = conn.cursor()
    while True:
        event, values = window.read()
        if event == sg.WIN_CLOSED or event == "Exit":
            break
        try:
            query = values["-QUERY-"].strip()
            queries = query.split(";")
            results = []
            for q in queries:
                if q.strip():
                    cursor.execute(q)
                    result = cursor.fetchall()
                    results.append(result)
            window["-RESULT-"].update("")
            for r in results:
                window["-RESULT-"].print(r)
        except Exception as e:
                sg.popup_error(f'Error: {e}')
    cursor.close()
    conn.close()
    window.close()

def accessDatabase():
    conn = mysql.connector.connect(host='localhost', database='ptinfo_db', username='root', password='password')
    cursor = conn.cursor()
    #sg.popup("it works")
    layout = [
        [sg.Multiline(size=(60, 10), key="-QUERY-")],
        [sg.Button("Execute"), sg.Button("Exit")],
    ]

    window = sg.Window("Access Database", layout)

    while True:
        event, values = window.read()
        if event == sg.WIN_CLOSED or event == "Exit":
            break
        try:
            sql = values["-QUERY-"].strip().split(';')
            for statement in sql:
                cursor.execute(statement)
                conn.commit()
            sg.popup("Successful")
        except Exception as e:
                sg.popup_error(f'Error: {e}')
        
    window.close()
    cursor.close()
    conn.close()




#########################################################################
##########    Logic to determin appropriate function to call  ###########
#########################################################################

#determines what was pressed and goes to appropriate form
def figureItOut(event, levelAccess):
    #sg.Popup("You made it to figure it out")
    if event == 'Current Patients':
        viewCurrentPatients()
    elif event == 'Physicians':
        viewPhysicians()
    elif event == 'Accepted Insurance Providers':
        viewAcceptedInsuranceProviders()
    elif event == 'Patient Balances':
        viewPatientBalances()
    elif event == 'Patient Debts':
        viewPatientDebts()
    elif event == 'NY Patients':
        viewNYPatients()
    elif event == 'Add Patient':
        if levelAccess >= 1:
            addPatient()
        else:
            sg.popup("Access Denied")            
    elif event == 'Update Patient':
        if levelAccess >= 1:
            updatePatient()
        else:
            sg.popup("Access Denied")
    elif event == 'Remove Patient':
        if levelAccess >= 1:
            removePatient()
        else:
            sg.popup("Access Denied")
    elif event == 'Custom Query':
        if levelAccess >= 2:
            customQuery()
        else:
            sg.popup("Access Denied")
    elif event == 'Access Database':
        if levelAccess >= 2:
            accessDatabase()
        else:
            sg.popup("Access Denied")




#########################################################################
########     Main Function - Displays home page after login    ##########
#########################################################################

#main function, always runs on start of file
#activates starup sequence function to obtain user credentials for login
#if login successful, creates and opens homepage window
#allow user access to forms for various processes needed in this project
def main(isRunning, startup):
    global level_access
    runProgram = startupSequence(startup)
    levelAccess = level_access
    #sg.popup("Level of access: " + str(levelAccess))
    #print(runProgram)
    reLogin = False
    while(isRunning):
        if reLogin == True:
            startup = True
            runProgram = startupSequence(startup)
            levelAccess = level_access
            #sg.popup("Level of access: " + str(levelAccess))
            reLogin = False
        if runProgram == False:
            break
        elif runProgram == True:
            homeLayout = [
                [sg.Text("Welcome", font=('Helvetica', 18))],
                #[sg.Text("Please select a process", font=('Helvetica', 12))],
                [sg.Text("Level 0 Access", font=('Helvetica', 14))],
                [sg.Button('Current Patients', size=(15, 2)), sg.Button('Physicians', size=(15, 2)), sg.Button('Accepted Insurance Providers', size=(25, 2))],
                [sg.Button('Patient Balances', size=(15, 2)), sg.Button('Patient Debts', size=(15, 2)), sg.Button('NY Patients', size=(15, 2))],
                [sg.Text("", size=(30, 1))],
                [sg.Text("Level 1 Access", font=('Helvetica', 14))],
                [sg.Button('Add Patient', size=(15, 2)), sg.Button('Update Patient', size=(15, 2)), sg.Button('Remove Patient', size=(25, 2))],
                [sg.Text("", size=(30, 1))],
                [sg.Text("Level 2 Access", font=('Helvetica', 14))],
                [sg.Button('Custom Query', size=(15, 2)), sg.Button('Access Database', size=(15, 2))],
                [sg.Text("", size=(30, 1))],
                [sg.Button('Exit', size=(15, 2)), sg.Push(), sg.Button('Logout', size=(15, 2))],
            ]
            homeWindow = sg.Window("Homepage", homeLayout)
            event, values = homeWindow.read()
            if event == 'Logout':
                homeWindow.close()
                reLogin = True
                isRunning = True
                continue
            elif event in (sg.WINDOW_CLOSED, 'Exit'):
                isRunning = False
                homeWindow.close()
                break
            else:
                homeWindow.close()
                figureItOut(event, levelAccess)
                continue
    homeWindow.close()

#Main function call to get everything started
main(isRunning, startup)