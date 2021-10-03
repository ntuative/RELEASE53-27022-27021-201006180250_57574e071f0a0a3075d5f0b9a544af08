package com.sulake.core.assets
{
   import com.sulake.core.assets.loaders.IAssetLoader;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.events.EventDispatcher;
   
   public class AssetLoaderStruct extends EventDispatcher implements IDisposable
   {
       
      
      private var var_694:IAssetLoader;
      
      private var var_1394:String;
      
      public function AssetLoaderStruct(param1:String, param2:IAssetLoader)
      {
         super();
         var_1394 = param1;
         var_694 = param2;
      }
      
      public function get assetLoader() : IAssetLoader
      {
         return var_694;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(var_694 != null)
            {
               if(true)
               {
                  var_694.dispose();
                  var_694 = null;
               }
            }
            super.dispose();
         }
      }
      
      public function get assetName() : String
      {
         return var_1394;
      }
   }
}
