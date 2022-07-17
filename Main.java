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
      System.out.println("Enter 1 -to- Create total parking space");
      System.out.println("Enter 2 -to- park the Vehicle(Make sure to enter the vehicle number)");
      System.out.println("Enter 3 -to- take the Vehicle((Make sure to enter the vehicle number)");
      System.out.println("Enter 4 -to- List the Parking System");
      System.out.println("Enter 5 -to- The identify the place of the Vehicle");
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
          System.out.println();
          System.out.println("---Created a parking slot with " + args[1] + " slots---");
          System.out.println();
          break;
        }
        catch(Exception e)
        {
            System.out.println();
            System.out.println("Invalid Command"+e);
            System.out.println();
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
            System.out.println();
            System.out.println("Sorry! Parking is full");
            System.out.println();
            break;
          }
          System.out.println();
          System.out.println("Allocated slot number: " + (allotedSlot + 1));
          System.out.println();
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
          System.out.println();
          System.out.println("Slot number " + (slot + 1) + " is free");
          System.out.println();
        }
        catch(ArrayIndexOutOfBoundsException ex)
        {
            System.out.println();
            System.out.println("Beyond the range - There is no such slot exists ");
            System.out.println();
            continue;
        }
        catch(Exception e)
        {
            System.out.println();
            System.out.println("Invalid Command"+e);
            System.out.println();
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
              System.out.println();
              System.out.println("Not found");
              System.out.println();
              break;
            }
            System.out.println();
            System.out.print("The car is at location ");
            System.out.println(resSlot + 1);
            System.out.println();
            break;
          }
          
        catch(Exception e)
        {
            System.out.println();
            System.out.println("Invalid Command"+e);
            System.out.println();
            continue;
        }
        default:
            System.out.println();
            System.out.println("Invalid Command");
            System.out.println();
      }
    }
  }
}