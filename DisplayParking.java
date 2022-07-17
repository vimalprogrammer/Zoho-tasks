public class DisplayParking
{
   private ParkSystem CarParker;
    public DisplayParking(ParkSystem CarParker)
    {
        this.CarParker=CarParker;
    }
//   public void displayStatus() 
//   {
//     System.out.println();
//     System.out.println("Slot No\t| Car");
    
//     for (int i = 0; i < totalNumberOfSlots; i++) 
//     {
//       if (occupiedSlots[i] != null) 
//         System.out.println(i + 1 + "\t| " + occupiedSlots[i].getRegNo());
//     }
//     System.out.println();
//   }
  
  
  public void displayStatus()
  {
     Car arr[]= CarParker.getOccupiedSlots();
     int count=0;
     System.out.println("Slot No\t| Car");
     for(Car i: arr)
     {
         if (i != null) 
             System.out.println(count + 1 + "\t| " + i.getRegNo());
        count++;
     }
  }
}