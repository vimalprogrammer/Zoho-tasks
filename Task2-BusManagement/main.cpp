#include <bits/stdc++.h>   
#include <conio.h>   
#include <windows.h>  
#include <iomanip>    
#include <fstream>    

using namespace std;

class Bus
{
private:
  int seats, freeseats, ch, check = 0;
  int t_seats, t_freeseats;
  string number, name, driverName, dp, ds;
  string ac;
  int NumberOfAc=0;
  string ac_range;
  string userName, Pass;
  string t_number, t_name, t_driverName, t_dp, t_ds;
  fstream file, file1, file2, file3;

public:
  void Start()
  {
    system("cls");
    string uname, pass;
    cout<<"------------------------------------\n";
    cout << "1.Admin Login\n2.Exit" << endl;
    cout<<"------------------------------------\n";
    cout<<"\nEnter Choice: ";
    cin >> ch;
    switch (ch)
    {
    case 1:
    relogin:
      system("cls");
      cout<<"------------------------------------\n";
      cout << "Enter Username: ";
      cin >> uname;
      cout << "Enter Password: " ;
      cin >> pass;
      cout<<"------------------------------------\n";
      check = CheckLog(uname, pass);
      if (check == 1)
      {
        cout << "Access granted";
        for (int i = 0; i < 10; i++)
        {
          cout << "*";
        }
        Menu();
      }
      else
      {
        cout << "Sorry Invalid Credentials";
        goto relogin;
      }
      break;
    case 2:
      exit(0);
      break;
    default:
      cout << "Invalid choice..." << endl;
    }
  }
  int CheckLog(string uname, string pass)
  {
    file3.open("login.txt", ios::in);
    while (!file3.eof())
    {
      if (!file3.eof())
      {
        file3 >> userName >> Pass;
        if (uname == userName && pass == Pass)
        {
          file3.close();
          return 1;
        }
      }
    }
    file3.close();
    return 0;
  }

  void Menu()
  {
    int ch;
  Menu:
    system("cls");
    cout << "***Bus Reservation System***" << endl;
    cout<<"------------------------------------\n";
    cout << "1.Add Bus" << endl
         << "2.View Bus" << endl
         << "3.Edit Bus" << endl
         << "4.Delete Bus" << endl
         << "5.Logout" << endl
         << "6.Exit And Close" << endl
         <<"------------------------------------\n"
         <<"\nEnter Your Choice: ";
    cin >> ch;
    switch (ch)
    {
    case 1:
      NewBus();
      break;
    case 2:
      ViewBus();
      break;
    case 3:
      EditBus();
      break;
    case 4:
      DeleteBus();
      break;
    case 5:
      Start();
      break;
    case 6:
      system("cls");
      exit(0);
      break;
    default:
      cout << "Invalid Choice" << endl;
      goto Menu;
    }
  }
  void NewBus()
  {

  newbus:
    system("cls");
    int match = 0;
    cout << "***Bus Reservation System***" << endl;
    cout<<"------------------------------------\n";
    cout << "Enter Bus Number: ";
    cin >> number;
    cout << "Enter Bus Name: ";
    cin >> name;
    cout << "Enter Driver Name: ";
    cin >> driverName;
    cout << "Enter number of seats: ";
    cin >> seats;
    freeseats = seats;
    cout<< "Enter AC or Non-AC(Yes/No): ";
    cin>>ac;
    transform(ac.begin(), ac.end(), ac.begin(), ::tolower);
    if(ac=="yes")
    {
      cout<<"How many AC seats available: ";
      cin>>NumberOfAc;
      cout<<"Enter AC seats From & to(Separate by '-'): ";
      cin>>ac_range;
    }
    cout << "Enter departure place: ";
    cin >> dp;
    cout << "Enter destination place: ";
    cin >> ds;
    cout<<"------------------------------------\n";
    file.open("bus.txt", ios::in);
    if (!file)
    {
      cout << "File doesn't exist" << endl;
      file.close();
      file.open("bus.txt", ios::out | ios::app);
      file << number << " " << name << " " << seats << " " << driverName << " " << freeseats << " " << dp << " " << ds;
      file.close();
      cout << "New record file created successfully and bus data added" << endl;
    }
    else
    {
      file.close();
      file.open("bus.txt", ios::in);
      while (!file.eof())
      {
        file >> t_number >> t_name >> t_seats >> t_driverName >> t_freeseats >> t_dp >> t_ds;
        if (number == t_number)
        {
          match++;
          break;
        }
        file >> t_number >> t_name >> t_seats >> t_driverName >> t_freeseats >> t_dp >> t_ds;
      }
      file.close();
      if (match == 0)
      {
        file.open("bus.txt", ios::out | ios::app);
        file << endl
             << number << " " << name << " " << seats << " " << driverName << " " << freeseats << " " << dp << " " << ds;
        file.close();
      }
      else
      {
        cout << "Duplicate Bus Found";
        getch();
        Menu();
      }
    }
    cout << "New Bus Created Successfully" << endl;
    getch();
    Menu();
  }
  void ViewBus()
  {
    number = "", name = "", driverName = "", dp = "", ds = "";
  viewBus:
    system("cls");
    int ch;
    cout << "Bus Reservation System" << endl;
    cout << "1.Single Bus" << endl
         << "2.All Buses" << endl
         << "3.Go Back" << endl
         <<"\nEnter Your Choice: ";
    cin >> ch;
    switch (ch)
    {
    case 1:
      SingleBusView();
      break;
    case 2:
      AllBusView();
      break;
    case 3:
      Menu();
      break;
    default:
      cout << "Invalid Choice" << endl;
      goto viewBus;
    }
  }
  void SingleBusView()
  {
    number = "", name = "", driverName = "", dp = "", ds = "";
    system("cls");
    int match = 0;
    cout << "***Bus Reservation System***" << endl;
    file.open("bus.txt");
    if (!file)
    { 
      cout << "No Record Exists" << endl;
      file.close();
    }
    else
    {
      std::ifstream file("bus.txt");
      cout << "Enter Bus Number To View: ";
      cin >> number;
      cout << left << setw(20) << "Bus Name" << setw(20) << "Bus Number" << setw(20) << "Driver Name" << setw(20) << "No Of Seats" << setw(20) << "FreeSeats" << setw(20) << "Departure Place" << setw(20) << "Destination" << endl;
      while (!file.eof())
      {
        if (!file.eof())
        {
          file >> t_number >> t_name >> t_seats >> t_driverName >> t_freeseats >> t_dp >> t_ds;
          if (number == t_number)
          {
            cout << left << setw(20) << t_name << setw(20) << t_number << setw(20) << t_driverName << setw(20) << t_seats << setw(20) << t_freeseats << setw(20) << t_dp << setw(20) << t_ds << endl;
            match = 1;
            file.close();
            break;
          }
        }
        else
        {
        }
      }
      file.close();
      if (match == 0)
      {
        cout << "No Record Found" << endl;
      }
    }
    file.close();
    getch();
    Menu();
  }
  void AllBusView()
  {
    number = "", name = "", driverName = "", dp = "", ds = "";
    system("cls");
    cout << "***Bus Reservation System***" << endl;
    file.open("bus.txt", ios::in);
    if (!file)
    {
      cout << "No Record Exists" << endl;
      file.close();
    }
    else
    {
      cout << left << setw(20) << "Bus Number" << setw(20) << "Bus Name" << setw(20) << "Driver Name" << setw(20) << "Seats" << setw(20) << "FreeSeats" << setw(20) << "Departure" << setw(20) << "Destination" << endl;
      while (!file.eof())
      {
        if (!file.eof())
        {
          file >> number >> name >> seats >> driverName >> freeseats >> dp >> ds;
          cout << left << setw(20) << number << setw(20) << name << setw(20) << driverName << setw(20) << seats << setw(20) << freeseats << setw(20) << dp << setw(20) << ds << endl;
        }
        else
        {
        }
      }
      file.close();
    }
    getch();
    Menu();
  }
  void EditBus()
  {
    number = "", name = "", driverName = "", dp = "", ds = "";
    system("cls");
    string numbertobeedited;
    int match = 0;
    cout << "Enter the number of the bus to be edited: ";
    cin >> numbertobeedited;
    file1.open("bus.txt", ios::in);
    file2.open("newbus.txt", ios::out | ios::trunc);
    if (!file1)
    {
      cout << "No Bus Records found" << endl;
      file1.close();
      file2.close();
      remove("newbus.txt");
      getch();
    }
    else
    {
      while (!file1.eof())
      {
        if (!file1.eof())
        {
          file1 >> t_number >> t_name >> t_seats >> t_driverName >> t_freeseats >> t_dp >> t_ds;
          if (numbertobeedited == t_number)
          {
            cout<<"------------------------------------\n";
            cout << "Enter new name for the bus: " ;
            cin >> t_name;
            cout << "Enter new driver's name for the bus: ";
            cin >> t_driverName;
            cout << "Enter new number of seats for the bus: ";
            cin >> t_seats;
            t_freeseats = t_seats;
            cout << "Enter new departure place: ";
            cin >> t_dp;
            cout << "Enter new destination place: ";
            cin >> t_ds;
            cout<<"------------------------------------\n";
            file2 << endl
                  << t_number << " " << t_name << " " << t_seats << " " << t_driverName << " " << t_freeseats << " " << t_dp << " " << t_ds;
            match = 1;
          }
          else
          {
            file2 << endl
                  << t_number << " " << t_name << " " << t_seats << " " << t_driverName << " " << t_freeseats << " " << t_dp << " " << t_ds;
          }
        }
      }
    }
    file1.close();
    file2.close();
    if (match == 0)
    {
      cout << "No record exists for this bus" << endl;
      remove("newbus.txt");
    }
    else
    {
      remove("bus.txt");
      rename("newbus.txt", "bus.txt");
    }

    getch();
    Menu();
  }

  void DeleteBus()
  {
    system("cls");
    string numberme;
    int exist = 0;
    cout << "Enter the Bus No. that you want it to get deleted: ";
    cin >> numberme;
    file1.open("bus.txt", ios::in);
    file2.open("temp.txt", ios::out | ios::trunc);
    if (!file1)
    {
      cout << "No Bus Records found" << endl;
      file1.close();
      file2.close();
      remove("temp.txt");
  
    }
    else
    {
      while (!file1.eof())
      {
        if (!file1.eof())
        {
          file1 >> t_number >> t_name >> t_seats >> t_driverName >> t_freeseats >> t_dp >> t_ds;
          if (t_number != numberme)
          {
            file2 << endl
                  << t_number << " " << t_name << " " << t_seats << " " << t_driverName << " " << t_freeseats << " " << t_dp << " " << t_ds;
          }

          else
            exist = 1;
        }
        else
        {
        }
      }
    }
    file2.close();
    file1.close();
    if (exist == 1)
    {
      cout << "Bus deleted Successfully";
      remove("bus.txt");
      rename("temp.txt", "bus.txt");
    }
    else
    {
      cout << "No such bus exists" << endl;
      remove("temp.txt");
    }

    Menu();
  }
};

int main()
{
  int ch, ch2;
  Bus b;
  b.Start();
  return 0;
}