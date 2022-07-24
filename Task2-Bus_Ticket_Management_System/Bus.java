import java.util.*;
import java.io.*;

public class Bus
{
  private int seats;
  private int ch;
  private String name;
  private String number;
  private int check = 0;
  private String driverName;
  private String dp;
  private String ds;
  private String ac;
  private int NumberOfAc = 0;
  private String ac_range;
  private String userName;
  private String Pass;
  private String t_user;
  private String t_mail;
  private String t_ph;
  private String t_gender;
  private String t_seat="";
  private String s;
  private int sn;
  private String urec="";

  Scanner sc = new Scanner(System.in);
 
  public void Start()
  {
	String uname;
	String pass;
	System.out.print("\n------------------------------------\n");
	System.out.print("1.Admin Login\n2.User Login\n3.Exit");
	System.out.print("\n");
	System.out.print("------------------------------------\n");
	System.out.print("\nEnter Choice: ");
	ch = sc.nextInt();
	switch (ch)
	{
	case 1:
	  System.out.print("------------------------------------\n");
	  System.out.print("Enter Username: ");
	  uname = sc.next();
	  System.out.print("Enter Password: ");
	  pass = sc.next();
	  System.out.print("------------------------------------\n");
	  int check = CheckLog(uname, pass);
	  if (check == 1)
	  {
			System.out.print("Access granted");
			for (int i = 0; i < 10; i++)
			{
			  System.out.print("*");
			}
			System.out.print("\n------------------------------------\n");
			Menu();
	  }
	  else
	  { 
			System.out.print("\nSorry Invalid Credentials");
			Start();
	  }
	  break;
	case 2:
	  login();
	  break;
	case 3:
	  System.exit(0);
	  break;
	default:
	  System.out.print("Invalid choice...");
	  Start();
	  System.out.print("\n");
	}
  }
  public int CheckLog(String uname, String pass)
  {
    boolean flag = false;
	try 
	{
			File f1=new File("login.txt");
			Scanner Reader = new Scanner(f1);
			while (Reader.hasNextLine()) 
			{
				String str = Reader.nextLine();
				String[] data = str.split("\\s+");
				if(data[0].equals(uname) && data[1].equals(pass))
				{
					flag=true;
					break;
				}
	    }
	    Reader.close();
	}
	catch (FileNotFoundException e) 
	{
		System.out.println("An error has occurred.");
		// Start();
		e.printStackTrace();
    }
    if(flag)
  		return 1;
  	return 0;
 }

 public void Menu()
 {
	int ch;
	System.out.print("\n***Bus Reservation System***");
	System.out.print("\n");
	System.out.print("------------------------------------\n");
	System.out.print("1.Add Bus");
	System.out.print("\n");
	System.out.print("2.View Bus");
	System.out.print("\n");
	System.out.print("3.Edit Bus");
	System.out.print("\n");
	System.out.print("4.Delete Bus");
	System.out.print("\n");
	System.out.print("5.Logout");
	System.out.print("\n");
	System.out.print("6.Exit And Close");
	System.out.print("\n");
	System.out.print("------------------------------------\n");
	System.out.print("\nEnter Your Choice: ");
	ch=sc.nextInt();
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
		  System.exit(0);
		  break;
		default:
	  		System.out.println("Invalid Choice");
	  		Menu();
	}
}
public void NewBus()
{
	int match = 0;
	System.out.print("\n***Bus Reservation System***");
	System.out.print("\n");
	System.out.print("------------------------------------\n");
	System.out.print("Enter Bus Number: ");
	number = sc.next();
	int flag=0;
	//---------------------------------------------------------------------
	try
	{
	    BufferedReader br = new BufferedReader(new FileReader("bus.txt"));
	    String line;
 		while ((line = br.readLine()) != null) 
 		{
	    	String[] splitStr = line.split("\\s+");
			if(splitStr[0].equals(number))
			{
				flag=1;
				//System.out.println(line);
				continue;
        	}
 		}	
		br.close();
 		if(flag==1)
 		{
 			System.out.print("------------------------------------\n");
 			System.out.println("The Bus with this already exists !!!");
 			System.out.print("------------------------------------\n");
 			Menu(); 
 		}
	}
	catch(Exception e)
	{
		System.out.print("Error occurred");
		Menu();
	}
		//--------------------------------------------------------------------
	if(flag==0)
	{
		System.out.print("Enter Bus Name: ");
		name = sc.next();
		System.out.print("Enter number of seats: ");
		seats = sc.nextInt();
		String s=number+".txt";
		try 
	    {
	        FileWriter Writer4 = new FileWriter(s);
	        for(int i=1;i<=seats;i++)
	        {
	        	if(i%10==0)
	        		Writer4.write((i)+"\n");
	        	else
	        		Writer4.write((i)+" ");
	        }
	        Writer4.close();
    	}
        catch (IOException e) 
        {
            System.out.println("An error has occurred.");
            Menu();//----1
            e.printStackTrace();
        }
		System.out.print("Enter Sleeper(y/n): ");
		ac = sc.next();
		if (ac.equals("y"))
		{
		  System.out.print("How many Sleeper seats available: ");
		  NumberOfAc = sc.nextInt();
		  System.out.print("Enter Sleeper seats range(Separate by '-'): ");
		  ac_range = sc.next();
		}
 		System.out.print("Enter departure place: ");
 		dp=sc.next();
 		System.out.print("Enter destination place: ");
 		ds=sc.next();		
 		//System.out.print("NewBus");
	    try 
	    {
            FileWriter Writer = new FileWriter("bus.txt",true);
            Writer.write(number + " ");
            Writer.write(name+ " ");
            Writer.write(seats+ " ");
            Writer.write(ac+ " ");
            Writer.write(dp+ " ");
            Writer.write(ds+ " "+"\n");            
            Writer.close();
			System.out.print("------------------------------------\n");
            System.out.println("Successfully written.");
            Menu();
        }
        catch (IOException e) 
        {
            System.out.println("An error has occurred.");
            Menu();//----1
            e.printStackTrace();
        }
    }
}

public void ViewBus()
{
	int ch;
	System.out.print("Bus Reservation System\n");
	System.out.print("------------------------------------\n");
	System.out.print("\n");
	System.out.print("1.Single Bus");
	System.out.print("\n");
	System.out.print("2.All Buses");
	System.out.print("\n");
	System.out.print("3.Go Back");
	System.out.print("\n------------------------------------\n");
	System.out.print("\n");
	System.out.print("\nEnter Your Choice: ");
	ch=sc.nextInt();
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
	  		System.out.println("Invalid choice");
	  		Menu();//------------2
	}
 }

public void SingleBusView()
{
	 try (BufferedReader in = new BufferedReader(new FileReader("bus.txt"));)
	 {
	 	  System.out.print("Enter bus No: ");
	 		number=sc.next();
	 		ArrayList<String> lines = new ArrayList();
    	String line;
    // read lines in file
    	while ((line = in.readLine())!=null)
    	{
        	lines.add(line);
    	}
    	in.close();
	    for(String i: lines)
	    {
				String[] splitStr = i.split("\\s+");
				if(splitStr[0].equals(number))
				{
					System.out.print("\n------------------------------------\n");
					for(String str : splitStr)
							System.out.print(str+" ");					
					System.out.print("\n------------------------------------\n");
						break;
				}
	    }
	    Menu();
	}
	catch (Exception e) 
	{
		System.out.println("An error has occurred.");
		e.printStackTrace();
		Menu();//-----3
    }
	  	 	//	System.out.println("SingleBusView");
}

public void AllBusView()
{
try 
{
 	ArrayList<String> lines = new ArrayList();
	BufferedReader in = new BufferedReader(new FileReader("bus.txt"));
	String line;
// read lines in file
	while ((line = in.readLine())!=null)
	{
    	lines.add(line);
	}
	in.close();
	System.out.print("------------------------------------\n");
	System.out.print("B.no\t name\t Seats\t AC\t Dep\t Des\n");
	System.out.print("------------------------------------\n");
    for(String i: lines)
    {
    	System.out.println(i);
    }
    System.out.print("------------------------------------\n");
    Menu();
	}
	catch (Exception e) 
	{
		System.out.println("An error has occurred.");
		e.printStackTrace();
		Menu();//-----------4
	}
  	 	//	System.out.println("SingleBusView");
}

public void EditBus()
{
  try 
  {
  	System.out.print("Enter Bus No to Edit: ");
  	 number=sc.next();
     BufferedReader br = new BufferedReader(new FileReader("bus.txt"));
     String line;
     FileWriter Writer2 = new FileWriter("new.txt");
     int flag=0;
     while ((line = br.readLine()) != null) 
     {
	    String[] splitStr = line.split("\\s+");
		if(splitStr[0].equals(number))
		{
			flag=1;
			line="";
			line+=number+" ";
			System.out.print("Enter New Bus Name: ");
			name = sc.next();
			line=line+name+" ";
			System.out.print("Edit number of seats: ");
			seats = sc.nextInt();
			line=line+seats+" ";
			System.out.print("Edit Sleeper(y/n): ");
			ac = sc.next();
			line=line+ac+" ";
			if (ac.equals("yes"))
			{
			  System.out.print("Edit Sleeper seats available: ");
			  NumberOfAc = sc.nextInt();
			  System.out.print("Edit Sleeper seats range(Separate by '-'): ");
			  ac_range = sc.next();
			}
	 		System.out.print("Edit departure place: ");
	 		dp=sc.next();
			line=line+dp+" ";
	 		System.out.print("Edit destination place: ");
	 		ds=sc.next();	
			line=line+ds+" ";
            System.out.println("\nSuccessfully modified !");
 		} 
		Writer2.write(line+"\n");
	}
	Writer2.close();
	if(flag==0)
		System.out.println("No Record Found");
 	PrintWriter pw = new PrintWriter("bus.txt");
	pw.close();

	BufferedReader br3 = new BufferedReader(new FileReader("new.txt"));
    FileWriter Writer3 = new FileWriter("bus.txt",true);
	String cpy;
	while((cpy=br3.readLine())!=null)
	{
		Writer3.write(cpy+"\n");
	}
	br3.close();
	Writer3.close();
	Menu();
	}

catch (IOException e) 
{
	System.out.println("An error has occurred.");
	Menu();//-----------4
	e.printStackTrace();
}
}

public void DeleteBus()
{
    try 
    {
    	System.out.print("Enter Bus No to delete: ");
	 	number=sc.next();
	 	int flag=0;
        FileWriter Writer1 = new FileWriter("new.txt");
	    BufferedReader br = new BufferedReader(new FileReader("bus.txt"));
	    String line;
 		while ((line = br.readLine()) != null) 
 		{
	    	String[] splitStr = line.split("\\s+");
			if(splitStr[0].equals(number))
			{
				flag=1;
				//System.out.println(line);
				continue;
        	}
    		Writer1.write(line+"\n");
    		System.out.println(line);
 		}	
 		if(flag==0)
 			System.out.println("No Record Found"); 
 		Writer1.close();

 		PrintWriter pw = new PrintWriter("bus.txt");
		pw.close();

		BufferedReader br2 = new BufferedReader(new FileReader("new.txt"));
        FileWriter Writer2 = new FileWriter("bus.txt",true);
		String cpy;
		while((cpy=br2.readLine())!=null)
		{
			Writer2.write(cpy+"\n");
		}
		br2.close();
		Writer2.close();
		Menu();
 	}

    catch (IOException e) 
    {
        System.out.println("An error has occurred.");
        Menu();//--------5
        e.printStackTrace();
    }  
}




public void SignUp()
{
		System.out.print("\n***New User Register***");
		System.out.print("\n");
		System.out.print("------------------------------------\n");
		System.out.print("Enter Firstname: ");
		String fname = sc.next();
		System.out.print("Enter Lastname: ");
		String lname = sc.next();
		System.out.print("Enter email: ");
		String email = sc.next();
		System.out.print("Enter phone: ");
		String phone = sc.next();
		System.out.print("Enter Gender: ");
		String gender = sc.next();
		System.out.print("Enter password: ");
		String pass = sc.next();


	    try 
	    {
            FileWriter Writer3 = new FileWriter("user.txt",true);
            Writer3.write(fname + " ");
            Writer3.write(lname+ " ");
            Writer3.write(email+ " ");
            Writer3.write(phone+ " ");
            Writer3.write(gender+ " ");
            Writer3.write(pass+ " "+"\n");            
            Writer3.close();
            System.out.println("Successfully written.");
            login();
        }

        catch (IOException e) 
        {
            System.out.println("An error has occurred.");
            Menu();//----1
            e.printStackTrace();
        }	
}


public int CheckLog2(String uname, String pass)
{
   boolean flag = false;
	 try 
	 {
		File f1=new File("user.txt");
		Scanner Reader = new Scanner(f1);
		while (Reader.hasNextLine()) 
		{
			String str = Reader.nextLine();
			String[] data = str.split("\\s+");
			if(data[0].equals(uname) && data[5].equals(pass))
			{
				t_user=uname;
				t_mail=data[2];
				t_ph=data[3];
				t_gender=data[4];
				flag=true;
				break;
			}
        }
	    Reader.close();
	    if(!flag)
	    {
	    	System.out.println("\nInvalid Credentials\n");
	    	login();
	    }

	}
	catch (FileNotFoundException e) 
	{

		System.out.println("Invalid Credentials.");
		// Start();
		e.printStackTrace();
	}
    if(flag)
  		return 1;
  	return 0;
}


public void logout()
{
    System.out.print("\n1.Logout\n2.Exit\n");
	System.out.print("Enter Choice : ");
	int ch=sc.nextInt();
	switch(ch)
	{
		case 1:
			login();
			break;
		case 2:
			System.exit(0);
			break;
		default:
			System.out.print("Invalid choice...");
		    logout();
		    System.out.print("\n");
	}
}

void confirmTkt(String num)
{
	boolean flag=false;
	String sn1="";
	s="";
	try
	{
		BufferedReader br = new BufferedReader(new FileReader("bus.txt"));
		String line;
		while ((line = br.readLine()) != null) 
		{
			String[] splitStr = line.split("\\s+");
			if(splitStr[0].equals(num))
			{
				System.out.print("***Choose Seat Number***\n");
				try 
 				{
 					s=num+".txt";
					BufferedReader in = new BufferedReader(new FileReader(s));
					String line1,s2="",t_r="";
			    	while ((line1 = in.readLine())!=null)
			    	{
			        	System.out.print(line1+"\n");
			    	}

					System.out.print("Choose Seat: ");
					sn=sc.nextInt();
					sn1=String.valueOf(sn);
					in.close();

					BufferedReader in1 = new BufferedReader(new FileReader(s));					
					String line2;
			    	while ((line2 = in1.readLine())!=null)
			    	{
			        	String[] data=line2.split("\\s+");
			        	for(String j:data)
			        	{
			        		if(j.equals(sn1))
			        		{
			        			flag=true;
			        			//System.out.println("flag truuuuuueee");
			        		}
			        	}
			    	}

					in1.close();
				}
			    catch (IOException e) 
			    {
			        System.out.println("An error has occurred.");
			        userCase();
			        e.printStackTrace();
			    } 
			}
		}
		br.close();
	}
	catch (Exception e) 
	{
		System.out.println("An error has occurred.");
		// Start();
		e.printStackTrace();
    }

    if(flag)
    {
		try
		{
	        File path=new File(s);
	        int f=0;
	        FileReader fin=new FileReader(path);
	        String b=sn1+"";
	        String sr="";
	        int n;
	        while((n=fin.read())!=-1)
	        {
	            String str="";
	            while(n!=32 && n!=13 && n!=10 )
	            {
	                //System.out.println(n);
	                str+=(char)n;
	                //System.out.println("str "+str);
	                n=fin.read();
	            }
	            if(b.equals(str))
	            {
	                str+="B";
	                f=1;
	            }
	            if(n==10)
	                sr+=str+"\n";
	            else
	                sr+=str+" ";
	        }
	        // if(f==1)
	        urec=String.valueOf(t_user);
	        urec="user"+urec+".txt";
		    BufferedWriter br3 = new BufferedWriter(new FileWriter(urec));
			br3.write(t_user+"\n");
			br3.write(t_ph+"\n"); 
			br3.write(t_mail+"\n"); 
			br3.write(sn+"\n");
			br3.close();

	        System.out.println("**Ticket Booked Successfully**");
	        // else
	        // 		System.out.println("**Ticket Not Available**");
	        fin.close();
	        FileWriter fout=new FileWriter(s);
	        fout.write(sr);
	        fout.close();
	        ViewTicket();
	    }
		catch (Exception e) 
		{
			System.out.println("An error has occurred.");
			// Start();
			e.printStackTrace();
	    }
	}
	else
	{
		System.out.println("\nSorry! Ticket Not Available\n");
		userCase();
	}

}

void checkTktAv(String dep,String des)
{
	int flag=0;
	try
	{
		BufferedReader br = new BufferedReader(new FileReader("bus.txt"));
		String line;
		System.out.print("----------------------------------------\n");
		System.out.println("B.no B.Name Seats AC Dep Des");
		System.out.print("----------------------------------------\n");
		while ((line = br.readLine()) != null) 
		{
			String[] splitStr = line.split("\\s+");
			if(splitStr[4].equals(dep) && splitStr[5].equals(des))
			{
				System.out.print(line+"\n");
				flag=1;
			}
		}

		if(flag==0)
		{
			System.out.println("\n***No Bus found on this route\n");
			BookTicket();
		}
		else
		{
			String t_number;
			System.out.println("Enter the bus number of your choice: ");
			t_number=sc.next();
			System.out.println("Press 'y' to see the ticket availabilities: ");
			String confirm=sc.next();
			if(confirm.equals("y"))
			{
				confirmTkt(t_number);
			}
		}
		br.close();
	}
	catch (Exception e) 
	{
		System.out.println("An error has occurred.");
		// Start();
		e.printStackTrace();
    }
}

public void ViewTicket()
{
	try
	{
		BufferedReader br4=new BufferedReader(new FileReader("user"+t_user+".txt"));
		String line3;
		System.out.println("----------------------------------");
		System.out.print("Name\tPhone\tEmail\tTicket No\n");
		while((line3=br4.readLine())!=null)
		{
			System.out.print(line3+"\t");
		}
		System.out.print("\n");
		br4.close();
		userCase();
	}
	catch (Exception e) 
	{
		System.out.println("\nNo Ticket Booked\n");
		 userCase();
		//e.printStackTrace();
    }

}

public void BookTicket()
{
	String dep,des;
	System.out.print("Enter departure Place: ");
	dep=sc.next();
	System.out.print("Enter destination Place: ");
	des=sc.next();
	checkTktAv(dep,des);
}


public void userCase()
{
	System.out.print("1.View Ticket\n2.Book Ticket\n3.Go Back\n");	
	System.out.print("Enter choice: ");
	int uch;
	uch=sc.nextInt();
	switch (uch)
    {
	    case 1:
	      ViewTicket();
	      break;
	    case 2:
	      BookTicket();
	      break;
	    case 3:
	      Start();
	      break;
	    default:
	      System.out.println("\nInvalid Choice\n");
	      userCase();
   }
}

public void userlogin(int check)
{
	if (check == 1)
	{
		System.out.print("Access granted");
		for (int i = 0; i < 10; i++)
		{
		  System.out.print("*");
		}
		System.out.println("\nLogin Successfull");
		System.out.print("------------------------------------\n");
		userCase();
	}
	else
	{ 
		System.out.print("**Sorry Invalid Credentials\n");
		System.out.print("------------------------------------\n");
		login();
	}
}

public void login()
{
	System.out.print("\n1.Sign in\n2.New User Registration\n3.Go Back");
	System.out.print("\n------------------------------------\n");
	System.out.print("\nEnter Choice: ");
	ch = sc.nextInt();
	switch (ch)
	{
		case 1:
		  System.out.print("------------------------------------\n");
		  System.out.print("Enter Username: ");
		  String uname1 = sc.next();
		  System.out.print("Enter Password: ");
		  String upass = sc.next();
		  System.out.print("------------------------------------\n");
		  int check = CheckLog2(uname1, upass);
		  userlogin(check);
		  break;
		case 2:
			SignUp();
			break;
		case 3:
			login();
			break;
		default:
		    System.out.print("Invalid choice...");
		    login();
		    System.out.print("\n");
	}

	}
}
