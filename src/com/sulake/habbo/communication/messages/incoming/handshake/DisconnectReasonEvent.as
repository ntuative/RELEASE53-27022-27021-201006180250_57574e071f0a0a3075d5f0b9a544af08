package com.sulake.habbo.communication.messages.incoming.handshake
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.handshake.DisconnectReasonParser;
   
   public class DisconnectReasonEvent extends MessageEvent implements IMessageEvent
   {
      
      public static const const_1571:int = 5;
      
      public static const const_1706:int = 113;
      
      public static const const_1675:int = 29;
      
      public static const const_1633:int = 0;
      
      public static const const_1574:int = 102;
      
      public static const const_1554:int = 25;
      
      public static const const_1536:int = 20;
      
      public static const const_1585:int = 116;
      
      public static const const_1591:int = 114;
      
      public static const const_1549:int = 101;
      
      public static const const_1480:int = 108;
      
      public static const const_1587:int = 112;
      
      public static const const_1580:int = 100;
      
      public static const const_1558:int = 24;
      
      public static const const_1199:int = 10;
      
      public static const const_1501:int = 111;
      
      public static const const_1687:int = 23;
      
      public static const const_1665:int = 26;
      
      public static const const_1187:int = 2;
      
      public static const const_1660:int = 22;
      
      public static const const_1570:int = 17;
      
      public static const const_1582:int = 18;
      
      public static const const_1649:int = 3;
      
      public static const const_1492:int = 109;
      
      public static const const_1381:int = 1;
      
      public static const const_1523:int = 103;
      
      public static const const_1481:int = 11;
      
      public static const const_1528:int = 28;
      
      public static const const_1698:int = 104;
      
      public static const const_1596:int = 13;
      
      public static const const_1553:int = 107;
      
      public static const const_1520:int = 27;
      
      public static const const_1609:int = 118;
      
      public static const const_1538:int = 115;
      
      public static const const_1684:int = 16;
      
      public static const const_1638:int = 19;
      
      public static const const_1569:int = 4;
      
      public static const const_1671:int = 105;
      
      public static const const_1629:int = 117;
      
      public static const const_1562:int = 119;
      
      public static const const_1613:int = 106;
      
      public static const const_1667:int = 12;
      
      public static const const_1628:int = 110;
       
      
      public function DisconnectReasonEvent(param1:Function)
      {
         super(param1,DisconnectReasonParser);
      }
      
      public function get reason() : int
      {
         return (this.var_7 as DisconnectReasonParser).reason;
      }
      
      public function get reasonString() : String
      {
         switch(reason)
         {
            case const_1381:
            case const_1199:
               return "banned";
            case const_1187:
               return "concurrentlogin";
            default:
               return "logout";
         }
      }
   }
}
