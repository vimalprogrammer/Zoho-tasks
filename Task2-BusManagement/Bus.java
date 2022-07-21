import java.util.*;
import java.io.*;

public class Bus 
{
  public int seats;
  public int freeseats;
  public int ch;
  public int check = 0;
  public String number;
  public String name;
  public String driverName;
  public String dp;
  public String ds;
  public String ac;
  public int NumberOfAc = 0;
  public String ac_range;
  public String userName;
  public String Pass;


  Scanner sc = new Scanner(System.in);
 
  public void Start()
  {
	String uname;
	String pass;
	System.out.print("------------------------------------\n");
	System.out.print("1.Admin Login\n2.Exit");
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
			Menu();
	  }
	  else
	  { 
			System.out.print("Sorry Invalid Credentials");
			Start();
	  }

	  break;
	case 2:
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
		System.out.print("Enter Bus Name: ");
		name = sc.next();
		System.out.print("Enter number of seats: ");
		seats = sc.nextInt();
		freeseats = seats;
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
            FileWriter Writer
                = new FileWriter("bus.txt",true);
            Writer.write(number + " ");
            Writer.write(name+ " ");
            Writer.write(seats+ " ");
            Writer.write(ac+ " ");
            Writer.write(dp+ " ");
            Writer.write(ds+ " "+"\n");            
            Writer.close();
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

public void ViewBus()
{
		int ch;
		System.out.print("Bus Reservation System");
		System.out.print("\n");
		System.out.print("1.Single Bus");
		System.out.print("\n");
		System.out.print("2.All Buses");
		System.out.print("\n");
		System.out.print("3.Go Back");
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
	 try 
	 {
	 	  System.out.print("Enter bus No: ");
	 		number=sc.next();
	 		ArrayList<String> lines = new ArrayList();
    	BufferedReader in = new BufferedReader(new FileReader("bus.txt"));
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
					for(String str : splitStr)
							System.out.print(str+" ");					

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
	    for(String i: lines)
	    {
	    	System.out.println(i);
	    }
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
					freeseats = seats;
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
		            System.out.println("Successfully modified");
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
}