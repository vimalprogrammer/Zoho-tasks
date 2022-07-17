import java.util.*;

public class Main 
{
   static int vehType;
  public static void main(String[] arguments) 
  {
    Scanner sc = new Scanner(System.in);
    ParkSystem CarParker = new ParkSystem();
    while (true) 
    {
      System.out.println("Press 1 and enter total parking space");
      System.out.println("Press 2 and enter vehicle Number and Type");
      System.out.println("Press 3 and enter the Vehicle Number to need to be take");
      System.out.println("Press 4 to List the Parking System");
      System.out.println("Press 5 to The identify the place of the Vehicle");
      System.out.print("\n");
      String input = sc.nextLine();
      String args[] = input.split(" ");
      String choice = args[0];
      
      switch (choice) 
      {
        case "1":
        try
        {
          CarParker.createSlot(Integer.valueOf(args[1]));
          System.out.println("\n---Created a parking slot with " + args[1] + " slots---\n");
          break;
        }
        catch(Exception e)
        {
            System.out.println("\nInvalid Command\n"+e);
            continue;
        }
        
        case "2":
        try
        {
          String regNo = args[1];
          vehType=Integer.parseInt(args[2]);
          
          Car car = new Car(regNo);
          int allotedSlot = CarParker.allotSlot(car);
          if (allotedSlot == -1) 
          {
            System.out.println("\nSorry! Parking is full\n");
            break;
          }
          System.out.println("\nAllocated slot number: " + (allotedSlot + 1)+"\n");
          break;
        }
        
        catch(Exception e)
        {   
            System.out.println();
            System.out.println(e);
            System.out.println();
            continue;
        }
        
        case "3":
        try
        {
          int slot = Integer.valueOf(args[1]) - 1;
          CarParker.updateOccupiedSlots(slot, null);
          System.out.println("\nSlot number " + (slot + 1) + " is free\n");
        }
        catch(ArrayIndexOutOfBoundsException ex)
        {
            System.out.println("\nBeyond the range - There is no such slot exists\n");
            continue;
        }
        catch(Exception e)
        {
            System.out.println("\nInvalid Command\n"+e);
            continue;
        }
        break;
        case "4":
          DisplayParking display=new DisplayParking(CarParker);
          try
          {
            display.displayStatus();
            break;
          }
          catch(Exception e)
          {
            System.out.println();
            System.out.println(e);
            System.out.println();
            continue;
          }
          
        case "5":
          try
          {
            CheckSlot check=new CheckSlot(CarParker); 
            int resSlot = check.getSlotNumberOfCar(args[1]);
            if (resSlot == -1) 
            {
              System.out.println("\nNot found\n");
              break;
            }
            System.out.print("\nThe car is at location");
            System.out.println(resSlot + 1);
            break;
          }
          
        catch(Exception e)
        {
            System.out.println("\nInvalid Command\n"+e);
            continue;
        }
        default:
            System.out.println("\nInvalid Command\n");
      }
    }
  }
}