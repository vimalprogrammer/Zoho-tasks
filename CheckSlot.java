public class CheckSlot
{
    private ParkSystem VehiclePark;
    public CheckSlot(ParkSystem VehiclePark)
    {
        this.VehiclePark=VehiclePark;
    }

//   public int getSlotNumberOfCar(String regNo)
//   {
    //  Car arr[]= VehiclePark.getOccupiedSlots();
    //  int count=0;
    //  for(Car i:arr)
    //  {
    //      String s=String.valueOf(i.getRegNo());
    //      System.out.println(s);
    //  }
//      for(Car i: arr)
//      {
//          String s=String.valueOf(i.getRegNo());
//          if (i != null && s.equals(regNo)) 
//              return count;
//         count++;
//      }
//      return -1;
//   }

 public int getSlotNumberOfCar(String regNo) 
  {
    for (int i = 0; i < 80; i++) 
    {
      if (VehiclePark.occupiedSlots[i] != null && VehiclePark.occupiedSlots[i].getRegNo().equals(regNo)) 
        return i;
    }
    return -1;
}
  
  
//   public void displayStatus(){
//      Car arr[]= VehiclePark.getOccupiedSlots();
//      int count=0;
//      System.out.println("Slot No\t| Car");
//      for(Car i: arr){
//          if (i != null) 
//              System.out.println(count + 1 + "\t| " + i.getRegNo());
//         count++;
//      }
//   }
}