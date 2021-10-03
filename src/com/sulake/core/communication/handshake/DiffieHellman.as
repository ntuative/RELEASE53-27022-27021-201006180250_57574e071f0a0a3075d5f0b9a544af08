package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.utils.ErrorReportStorage;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_1429:BigInteger;
      
      private var var_653:BigInteger;
      
      private var var_1681:BigInteger;
      
      private var var_1680:BigInteger;
      
      private var var_2298:BigInteger;
      
      private var var_2299:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         var_1429 = param1;
         var_1681 = param2;
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return var_2298.toRadix(param1);
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         var_1680 = new BigInteger();
         var_1680.fromRadix(param1,param2);
         var_2298 = var_1680.modPow(var_653,var_1429);
         return getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return var_2299.toRadix(param1);
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         ErrorReportStorage.addDebugData("DiffieHellman","Prime: " + var_1429.toString() + ",generator: " + var_1681.toString() + ",secret: " + param1);
         var_653 = new BigInteger();
         var_653.fromRadix(param1,param2);
         var_2299 = var_1681.modPow(var_653,var_1429);
         return true;
      }
   }
}
