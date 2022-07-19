import java.util.*;
import java.io.BufferedWriter;
import java.io.FileWriter;

public class Main 
{
   static int vehType;
  public static void main(String[] arguments) 
  {
    Scanner sc = new Scanner(System.in);
    ParkSystem VehiclePark = new ParkSystem();
    CheckSlot check=new CheckSlot(VehiclePark); 
    while (true) 
    {
        System.out.println("Press 1 and enter total parking space");
        System.out.println("Press 2 and enter vehicle Number and Type");
        System.out.println("Press 3 and enter the Vehicle Number to need to be take");
        System.out.println("Press 4 to List the Parking System");
        System.out.println("Press 5 to The identify the place of the Vehicle");
        System.out.println("Press 0 to Exit\n");

        System.out.print("Enter Your Option: ");

        String input = sc.next();

        if(input.equals("1"))
        {
            try
            {
              VehiclePark.createSlot(80);
              System.out.println("\n---Created a parking slot with " + 80 + " slots---\n");
            }
            catch(Exception e)
            {
                System.out.println("\nInvalid Command - Parking Slot already Created\n");
            }
        }
        
        else if(input.equals("2"))
        {
            try
            {
              System.out.print("Enter Register No: ");
              String regNo = sc.next();
              System.out.print("Enter Vehicle Type(2/4): ");
              vehType=sc.nextInt();
		  if(vehType != 2 && vehType != 4)
			System.out.print("\nSorry, Only 2 or 4 Wheeler Vehicles allowed\n");
		  else
		  {
              Vehicle vehicle = new Vehicle(regNo);
              int allotedSlot = VehiclePark.allotSlot(vehicle);
              if (allotedSlot == -1) 
                System.out.println("\nSorry! Parking is full\n");
              else if (allotedSlot == -2) 
                System.out.println("\nThe Vehicle with this No. already exists\n");
              else 
              {
                if(allotedSlot<10)
                System.out.println("\nAllocated slot number: " + (allotedSlot + 1)+ " in Ground Floor 1\n");
                else if(allotedSlot>10 && allotedSlot<20)
                System.out.println("\nAllocated slot number: " + (allotedSlot + 1)+ " in Ground Floor 2\n");
                else if(allotedSlot%10==0 && allotedSlot!=20)
                {
                int floor=(allotedSlot/10)-2;
                System.out.println("\nAllocated slot number: " + (allotedSlot + 1)+ " in " +floor+ "th floor\n");
                }
                else
                {
                int floor=(allotedSlot/10)-1;                System.out.println("\nAllocated slot number: " + (allotedSlot + 1)+ " in "+ floor+ "th floor\n");
                }
              }
		  }
            }
              
            catch(Exception e)
            {   
                System.out.println("\nInvalid Command\n"+e);
                continue;
            }
        }
        
        else if(input.equals("3"))
        {
            try
            {
              System.out.print("Enter Vehicle position to take: ");
              int slot = sc.nextInt();
              VehiclePark.updateOccupiedSlots(slot-1, null);
              System.out.println("\nSlot number " + (slot) + " is free\n");
            }
            catch(ArrayIndexOutOfBoundsException ex)
            {
                System.out.println("\nBeyond the range - There is no such slot exists\n");
                continue;
            }
            catch(InputMismatchException ie)
            {
                System.out.println("\nInvalid Command\n"+ie);
                continue;
            }
            catch(Exception e)
            {
                System.out.println("\nInvalid Command\n"+e);
                continue;
            }
            
        }
        
        else if(input.equals("4"))
        {
              DisplayParking display=new DisplayParking(VehiclePark);
              try
              {
                display.displayStatus();
              }
              catch(Exception e)
              {
                System.out.println("\nInvalid Command\n"+e);
                continue;
              }
        }
          
        else if(input.equals("5"))
        {
          try
          {
            System.out.print("Enter Vehicle No to check the slot: ");
            String s=sc.next();
            int resSlot = check.getSlotNumberOfVehicle(s);
            int x=resSlot + 1;
            int floor=0;
            if (resSlot == -1) 
            {
              System.out.println("\nNo vehicle has this Register No\n");
            }
            else if(resSlot<10)
            {
                System.out.print("\nThe Vehicle is at Slot No: "+ x + " at Ground floor 1\n\n");
            }
            else if(resSlot>10 && resSlot<20 )
            {
                System.out.print("\nThe Vehicle is at Slot No: "+ x + " at Ground floor 2\n\n");
            }
            else if(resSlot%10==0 && resSlot!=20)
            {
                floor=(resSlot/10)-2;
                System.out.print("\nThe Vehicle is at Slot No: "+ x + " at "+floor+ " floor\n\n");
            }
            else
            {
                floor = (resSlot/10)-1;
                System.out.print("\nThe Vehicle is at Slot No: "+ x + " at "+floor+ " floor\n\n");
            }
          }
          
            catch(Exception e)
            {
                //System.out.println("FOR CAR "+resSlot);
                System.out.println("\nInvalid Command\n"+e);
                continue;
            }
        }
        else if(input.equals("0"))
        {
            try
            {
    		    System.exit(0);
            }
          
            catch(Exception e)
            {
                System.out.println("\nInvalid Command\n"+e);
                continue;
            }
        }
	else
	{
	System.out.println("\nEnter a Valid option \n");
	continue;
	}
    }
  }
}