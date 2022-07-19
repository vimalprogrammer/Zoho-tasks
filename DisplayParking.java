import java.io.BufferedWriter;
import java.io.FileWriter;

public class DisplayParking extends ParkSystem
{
   private ParkSystem VehiclePark;
    public DisplayParking(ParkSystem VehiclePark)
    {
        this.VehiclePark=VehiclePark;
    }
//   public void displayStatus() 
//   {
//     System.out.println();
//     System.out.println("Slot No\t| Vehicle");
    
//     for (int i = 0; i < totalNumberOfSlots; i++) 
//     {
//       if (occupiedSlots[i] != null) 
//         System.out.println(i + 1 + "\t| " + occupiedSlots[i].getRegNo());
//     }
//     System.out.println();
//   }
  
  
  public void displayStatus() throws Exception
  {
     Vehicle arr[]= VehiclePark.getOccupiedSlots();
     int count=1;
     System.out.println("Slot No\t| Bike\t| Floor");
     System.out.println("--------------------------------------------------------------");
     int floor=0;
     for(Vehicle i: arr)
     {
        if (count<=10)
        {
            if(i==null)
                System.out.println(count + "\t| " + "FREE" + "\t| "+ "Ground Floor 1");
            else
                System.out.println(count + "\t| " + i.getRegNo()+ "\t| "+ "Ground Floor 1");
        }
        else if (count>10 && count <=20) 
        {
            if(i==null)
                System.out.println(count + "\t| " + "FREE" + "\t| "+ "Ground Floor 2");
            else
                System.out.println(count + "\t| " + i.getRegNo()+ "\t| "+ "Ground Floor 2");
        }
        
        if(count==21)
        {
            System.out.println("\nSlot No\t| vehicle\t| Floor");
            System.out.println("--------------------------------------------------------------");
        }
        if (count>=21) 
        {
            floor=(count/10)-1;
            if(count%10!=0)
            {   
                if(i==null)
                    System.out.println(count + "\t| " + "FREE" + "\t| "+ floor +"th floor\n");
                else
                    System.out.println(count + "\t| " + i.getRegNo()+ "\t| "+ floor +"th floor\n");
            }
            else
            {
                floor--;
                if(i==null)
                    System.out.println(count + "\t| " + "FREE" + "\t| "+ floor +"th floor\n");
                else
                    System.out.println(count + "\t| " + i.getRegNo()+ "\t| "+ floor +"th floor\n");    
            }
        }
        if(count%10==0)
            System.out.println("--------------------------------------------------------------");
        count++;
    }
        BufferedWriter writer = new BufferedWriter(new FileWriter("myfile.txt", false));
        for (int i = 0; i < 80; i++) 
        {
         if (VehiclePark.occupiedSlots[i] != null) 
         {
             writer.write(VehiclePark.occupiedSlots[i].getRegNo());
             writer.newLine();  
         }
        }
        writer.flush();
  }
}