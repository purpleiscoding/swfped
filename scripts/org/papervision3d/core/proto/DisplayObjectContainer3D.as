package org.papervision3d.core.proto
{
   import flash.events.EventDispatcher;
   import flash.utils.Dictionary;
   import org.papervision3d.objects.DisplayObject3D;
   
   public class DisplayObjectContainer3D extends EventDispatcher
   {
      private var _childrenTotal:int;
      
      public var root:DisplayObjectContainer3D;
      
      protected var _children:Dictionary;
      
      protected var _childrenByName:Object;
      
      public function DisplayObjectContainer3D()
      {
         super();
         this._children = new Dictionary(false);
         this._childrenByName = new Dictionary(true);
         this._childrenTotal = 0;
      }
      
      public function addChild(param1:DisplayObject3D, param2:String = null) : DisplayObject3D
      {
         param2 = param2 || param1.name || String(param1.id);
         this._children[param1] = param2;
         this._childrenByName[param2] = param1;
         ++this._childrenTotal;
         param1.parent = this;
         param1.root = this.root;
         return param1;
      }
      
      private function findChildByName(param1:String, param2:DisplayObject3D = null) : DisplayObject3D
      {
         var _loc3_:DisplayObject3D = null;
         var _loc4_:DisplayObject3D = null;
         param2 ||= DisplayObject3D(this);
         if(!param2)
         {
            return null;
         }
         if(param2.name == param1)
         {
            return param2;
         }
         for each(_loc3_ in param2.children)
         {
            _loc4_ = findChildByName(param1,_loc3_);
            if(_loc4_)
            {
               return _loc4_;
            }
         }
         return null;
      }
      
      public function getChildByName(param1:String, param2:Boolean = false) : DisplayObject3D
      {
         if(param2)
         {
            return findChildByName(param1);
         }
         return this._childrenByName[param1];
      }
      
      public function get numChildren() : int
      {
         return this._childrenTotal;
      }
      
      public function addChildren(param1:DisplayObject3D) : DisplayObjectContainer3D
      {
         var _loc2_:DisplayObject3D = null;
         for each(_loc2_ in param1.children)
         {
            param1.removeChild(_loc2_);
            this.addChild(_loc2_);
         }
         return this;
      }
      
      public function removeChildByName(param1:String) : DisplayObject3D
      {
         return removeChild(getChildByName(param1));
      }
      
      override public function toString() : String
      {
         return childrenList();
      }
      
      public function removeChild(param1:DisplayObject3D) : DisplayObject3D
      {
         if(param1)
         {
            delete this._childrenByName[this._children[param1]];
            delete this._children[param1];
            param1.parent = null;
            param1.root = null;
            --_childrenTotal;
            return param1;
         }
         return null;
      }
      
      public function childrenList() : String
      {
         var _loc1_:String = null;
         var _loc2_:String = null;
         _loc1_ = "";
         for(_loc2_ in this._children)
         {
            _loc1_ += _loc2_ + "\n";
         }
         return _loc1_;
      }
      
      public function get children() : Object
      {
         return this._childrenByName;
      }
   }
}

