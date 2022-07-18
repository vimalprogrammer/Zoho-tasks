public class CheckSlot
{
    private ParkSystem CarParker;
    public CheckSlot(ParkSystem CarParker)
    {
        this.CarParker=CarParker;
    }

  public int getSlotNumberOfCar(String regNo)
  {
     Car arr[]= CarParker.getOccupiedSlots();
     int count=0;
     for(Car i: arr)
     {
         String s=String.valueOf(i.getRegNo());
         if (i != null && s.equals(regNo)) 
             return count;
        count++;
     }
     return -1;
  }
//  public int getSlotNumberOfCar(String regNo) 
//   {
//     for (int i = 0; i < totalNumberOfSlots; i++) 
//     {
//       if (occupiedSlots[i] != null && occupiedSlots[i].getRegNo().equals(regNo)) 
//         return i;
//     }
//     return -1;
// }
  
  
//   public void displayStatus(){
//      Car arr[]= CarParker.getOccupiedSlots();
//      int count=0;
//      System.out.println("Slot No\t| Car");
//      for(Car i: arr){
//          if (i != null) 
//              System.out.println(count + 1 + "\t| " + i.getRegNo());
//         count++;
//      }
//   }
}



1. FLOOR
2. 